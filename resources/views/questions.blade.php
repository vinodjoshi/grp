@extends('layouts.app')

@section('header_subtitle')
    <p>Please answer the following 20 questions to help us understand if this business opportunity is right for you.</p>
@endsection

@section('content')

<div class="container">
    <div class="questions-form">
        <div id="optionInfo" class="option-info" style="display: none;">
            <strong>Selected Business:</strong> <span id="businessTitle"></span>
        </div>

        <div class="progress-bar">
            <div class="progress-fill" id="progressFill"></div>
        </div>

        <div class="error-message" id="errorMessage">
            Please answer all questions before submitting.
        </div>

        <div id="loadingSpinner" class="loading-spinner" style="display: none;">
            <div></div>
            <p>Generating personalized assessment questions...</p>
        </div>

        <form id="questionsForm">
            @csrf

            <div id="dynamicQuestionsContainer"></div>

            <!-- Existing Hardcoded Questions (fallback) -->

            <div class="button-group">
                <button type="button" class="btn btn-back" onclick="goBack()">Go Back</button>
                <button type="submit" class="btn btn-submit" id="submitBtn">Submit Answers</button>
            </div>
        </form>

        <!-- Action Plan Container -->
        <div id="actionPlanContainer" class="action-plan-container">
            <div class="action-plan-header">
                <h2>Your Personalized Action Plan</h2>
            </div>
            <div class="action-plan-content" id="actionPlanContent"></div>
            <div id="planLoadingSpinner" class="loading-spinner" style="display: none;">
                <div></div>
                <p>Creating your personalized action plan...</p>
            </div>
            <div class="action-plan-footer">
                <button type="button" class="btn btn-download" onclick="downloadActionPlan()">Download as PDF</button>
                <a href="{{ route('home') }}" class="btn btn-back-to-home">Back to Home</a>
            </div>
        </div>
    </div>
</div>

@endsection

@section('scripts')
<script>
const selectedOption = JSON.parse(sessionStorage.getItem('selectedOption') || '{}');
if (selectedOption.title) {
    document.getElementById('optionInfo').style.display = 'block';
    document.getElementById('businessTitle').textContent = selectedOption.title;
    
    // Load generated questions
    loadGeneratedQuestions(selectedOption.title);
} else {
    // If no option selected, hide loading and show fallback
    document.getElementById('loadingSpinner').style.display = 'none';
}

// Load dynamically generated questions from AI
async function loadGeneratedQuestions(businessTitle) {
    document.getElementById('loadingSpinner').style.display = 'block';
    
    try {
        const response = await fetch("{{ route('generate-questions') }}", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
            },
            body: JSON.stringify({
                business_title: businessTitle
            })
        });

        const data = await response.json();
        
        if (data.success && data.data.questions && data.data.questions.length > 0) {
            renderDynamicQuestions(data.data.questions);
            document.getElementById('loadingSpinner').style.display = 'none';
        } else {
            throw new Error('No questions generated');
        }
    } catch (error) {
        console.error('Error loading questions:', error);
        document.getElementById('loadingSpinner').style.display = 'none';
        // Show the fallback hardcoded questions
        document.getElementById('dynamicQuestionsContainer').style.display = 'none';
    }
}

// Render dynamically generated questions
function renderDynamicQuestions(questions) {
    const container = document.getElementById('dynamicQuestionsContainer');
    let html = '';
    
    questions.slice(0, 10).forEach((q, index) => {
        const questionNum = index + 1;
        const optionsHtml = (q.options || q.answer_options || []).map((option, optIdx) => {
            const optionId = `dynamic_q${questionNum}_${optIdx}`;
            const optionValue = option.replace(/"/g, '&quot;');
            return `
                <div class="radio-option">
                    <input type="radio" id="${optionId}" name="dynamic_question_${questionNum}" value="${optionValue}">
                    <label for="${optionId}">${option}</label>
                </div>
            `;
        }).join('');
        
        html += `
            <div class="question-group">
                <span class="question-number">${questionNum}</span>
                <span class="question-text">${q.question}</span>
                <div class="answer-options">
                    ${optionsHtml}
                </div>
            </div>
        `;
    });
    
    container.innerHTML = html;
    
    // Re-attach event listeners to new radio buttons
    document.querySelectorAll('#dynamicQuestionsContainer input[type="radio"]').forEach(radio => {
        radio.addEventListener('change', updateProgress);
    });
    
    // Update progress initially
    updateProgress();
}

// Update progress bar based on answered questions
function updateProgress() {
    const totalQuestions = 10;
    const answeredQuestions = document.querySelectorAll('input[type="radio"]:checked').length;
    const progress = (answeredQuestions / totalQuestions) * 100;
    document.getElementById('progressFill').style.width = progress + '%';
}

// Form submission
document.getElementById('questionsForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const totalQuestions = 10;
    const answeredQuestions = document.querySelectorAll('input[type="radio"]:checked').length;

    // Validate that all questions are answered
    if (answeredQuestions < totalQuestions) {
        document.getElementById('errorMessage').style.display = 'block';
        window.scrollTo(0, 0);
        return;
    }

    document.getElementById('errorMessage').style.display = 'none';

    // Collect form data from dynamic questions
    const formData = new FormData(this);
    const answers = {};

    // Get answers from dynamic questions
    for (let i = 1; i <= totalQuestions; i++) {
        const dynamicAnswerKey = `dynamic_question_${i}`;
        const fallbackAnswerKey = `question_${i}`;
        
        // Check for dynamic question answer first, then fallback to hardcoded
        answers[`question_${i}`] = formData.get(dynamicAnswerKey) || formData.get(fallbackAnswerKey) || '';
    }

    // Hide form and show loading spinner
    document.getElementById('questionsForm').style.display = 'none';
    document.getElementById('actionPlanContainer').classList.add('show');
    document.getElementById('planLoadingSpinner').style.display = 'block';
    document.getElementById('actionPlanContent').innerHTML = '';

    try {
        // Fetch action plan from backend
        const response = await fetch("{{ route('generate-action-plan') }}", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
            },
            body: JSON.stringify({
                business_title: selectedOption.title,
                answers: answers
            })
        });

        const data = await response.json();
        
        if (data.success && data.data.action_plan) {
            // Format the action plan for display
            const formattedPlan = formatActionPlan(data.data.action_plan);
            document.getElementById('actionPlanContent').innerHTML = formattedPlan;
            
            // Store the action plan
            sessionStorage.setItem('actionPlan', data.data.action_plan);
            sessionStorage.setItem('submittedAnswers', JSON.stringify({
                selectedOption: selectedOption,
                answers: answers,
                timestamp: new Date().toISOString()
            }));
        } else {
            document.getElementById('actionPlanContent').innerHTML = '<p style="color: red;">Failed to generate action plan. Please try again.</p>';
        }
    } catch (error) {
        console.error('Error generating action plan:', error);
        document.getElementById('actionPlanContent').innerHTML = '<p style="color: red;">An error occurred while generating your action plan. Please try again.</p>';
    } finally {
        document.getElementById('planLoadingSpinner').style.display = 'none';
    }
});

// Format the action plan for display
function formatActionPlan(text) {
    // Convert markdown-style headers and lists to HTML
    let html = text
        .replace(/\n/g, '</p><p>')
        .replace(/<p><p>/g, '<p>')
        .replace(/<\/p><\/p>/g, '</p>');
    
    // Convert headers (lines starting with #)
    html = html.replace(/^<p>#{1,3}\s+(.+?)<\/p>/gm, '<h$1>$2</h$1>');
    html = html.replace(/^<p>##\s+(.+?)<\/p>/gm, '<h3>$1</h3>');
    html = html.replace(/^<p>#\s+(.+?)<\/p>/gm, '<h2>$1</h2>');
    
    // Wrap in paragraph tags where appropriate
    html = '<p>' + html + '</p>';
    
    return html;
}

// Download action plan as PDF (basic implementation)
function downloadActionPlan() {
    const actionPlan = sessionStorage.getItem('actionPlan');
    const businessTitle = selectedOption.title;
    
    if (!actionPlan) {
        alert('Action plan not found.');
        return;
    }

    const element = document.createElement('a');
    const file = new Blob([actionPlan], { type: 'text/plain' });
    element.href = URL.createObjectURL(file);
    element.download = `Action-Plan-${businessTitle.replace(/\s+/g, '-')}.txt`;
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
}

// Return to home
function returnToHome() {
    sessionStorage.removeItem('selectedOption');
    sessionStorage.removeItem('submittedAnswers');
    sessionStorage.removeItem('actionPlan');
    window.location.href = '/';
}

// Go back button
function goBack() {
    if (confirm('Are you sure? Your answers will not be saved.')) {
        sessionStorage.removeItem('selectedOption');
        window.location.href = '/';
    }
}
</script>
@endsection
