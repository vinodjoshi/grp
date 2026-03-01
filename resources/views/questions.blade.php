<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Business Questions - AI Business Coach</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            padding: 20px;
        }

        header {
            background: #1e293b;
            color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        header p {
            font-size: 16px;
            color: #e2e8f0;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .questions-form {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
        }

        .question-group {
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e2e8f0;
        }

        .question-group:last-child {
            border-bottom: none;
        }

        .question-number {
            display: inline-block;
            background: #2563eb;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            text-align: center;
            line-height: 30px;
            font-weight: bold;
            margin-right: 10px;
        }

        .question-text {
            display: inline;
            font-weight: bold;
            color: #1e293b;
        }

        .answer-options {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 12px;
            margin-left: 40px;
        }

        .radio-option {
            display: flex;
            align-items: center;
        }

        .radio-option input[type="radio"] {
            margin-right: 10px;
            cursor: pointer;
            width: 18px;
            height: 18px;
        }

        .radio-option label {
            cursor: pointer;
            font-size: 14px;
            color: #475569;
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #e2e8f0;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn-submit {
            background: #16a34a;
            color: white;
            flex: 1;
        }

        .btn-submit:hover {
            background: #15803d;
        }

        .btn-submit:disabled {
            background: #94a3b8;
            cursor: not-allowed;
        }

        .btn-back {
            background: #94a3b8;
            color: white;
            flex: 1;
        }

        .btn-back:hover {
            background: #64748b;
        }

        .error-message {
            background: #fee2e2;
            color: #dc2626;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            display: none;
        }

        .progress-bar {
            width: 100%;
            height: 4px;
            background: #e2e8f0;
            border-radius: 2px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: #2563eb;
            transition: width 0.2s;
        }

        .option-info {
            background: #dbeafe;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #0284c7;
        }

        .option-info strong {
            color: #0c4a6e;
        }
    </style>
</head>
<body>

<header>
    <h1>AI Business Coach — Assessment Questions</h1>
    <p>Please answer the following 20 questions to help us understand if this business opportunity is right for you.</p>
</header>

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

        <div id="loadingSpinner" class="loading-spinner" style="display: none; text-align: center; padding: 40px; margin-bottom: 20px;">
            <div style="border: 4px solid #f3f4f6; border-top: 4px solid #2563eb; border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite; margin: 0 auto; margin-bottom: 15px;"></div>
            <p style="color: #64748b;">Generating personalized assessment questions...</p>
        </div>

        <style>
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>

        <form id="questionsForm">
            @csrf

            <div id="dynamicQuestionsContainer"></div>

            <!-- Existing Hardcoded Questions (fallback) -->

            <div class="button-group">
                <button type="button" class="btn btn-back" onclick="goBack()">Go Back</button>
                <button type="submit" class="btn btn-submit" id="submitBtn">Submit Answers</button>
            </div>
        </form>
    </div>
</div>

<script>
// Display the selected business option
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
        const response = await fetch('/api/generate-questions', {
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
    
    questions.slice(0, 20).forEach((q, index) => {
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
    const totalQuestions = 20;
    const answeredQuestions = document.querySelectorAll('input[type="radio"]:checked').length;
    const progress = (answeredQuestions / totalQuestions) * 100;
    document.getElementById('progressFill').style.width = progress + '%';
}

// Form submission
document.getElementById('questionsForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const totalQuestions = 20;
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

    // Prepare submission data
    const submissionData = {
        selectedOption: selectedOption,
        answers: answers,
        timestamp: new Date().toISOString()
    };

    // Store in sessionStorage for now (you can send to backend if needed)
    sessionStorage.setItem('submittedAnswers', JSON.stringify(submissionData));

    // Show success message
    alert('Thank you for completing the assessment! Your responses have been recorded.');

    // Clear sessionStorage and redirect back to home
    setTimeout(() => {
        sessionStorage.removeItem('selectedOption');
        window.location.href = '/';
    }, 1500);
});

// Go back button
function goBack() {
    if (confirm('Are you sure? Your answers will not be saved.')) {
        sessionStorage.removeItem('selectedOption');
        window.location.href = '/';
    }
}
</script>

</body>
</html>
