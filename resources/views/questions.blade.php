<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

        <form id="questionsForm">
            @csrf

            <!-- Question 1 -->
            <div class="question-group">
                <span class="question-number">1</span>
                <span class="question-text">Do you have passion for starting this type of business?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q1_a" name="question_1" value="Very passionate">
                        <label for="q1_a">Very passionate</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q1_b" name="question_1" value="Somewhat passionate">
                        <label for="q1_b">Somewhat passionate</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q1_c" name="question_1" value="Not sure">
                        <label for="q1_c">Not sure</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q1_d" name="question_1" value="Not passionate">
                        <label for="q1_d">Not passionate</label>
                    </div>
                </div>
            </div>

            <!-- Question 2 -->
            <div class="question-group">
                <span class="question-number">2</span>
                <span class="question-text">How confident are you in your ability to execute this business plan?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q2_a" name="question_2" value="Very confident">
                        <label for="q2_a">Very confident</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q2_b" name="question_2" value="Confident">
                        <label for="q2_b">Confident</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q2_c" name="question_2" value="Somewhat confident">
                        <label for="q2_c">Somewhat confident</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q2_d" name="question_2" value="Not confident">
                        <label for="q2_d">Not confident</label>
                    </div>
                </div>
            </div>

            <!-- Question 3 -->
            <div class="question-group">
                <span class="question-number">3</span>
                <span class="question-text">Do you have the necessary skills for this business?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q3_a" name="question_3" value="Already have all skills">
                        <label for="q3_a">Already have all skills</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q3_b" name="question_3" value="Have most skills">
                        <label for="q3_b">Have most skills</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q3_c" name="question_3" value="Can learn the skills">
                        <label for="q3_c">Can learn the skills</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q3_d" name="question_3" value="Missing key skills">
                        <label for="q3_d">Missing key skills</label>
                    </div>
                </div>
            </div>

            <!-- Question 4 -->
            <div class="question-group">
                <span class="question-number">4</span>
                <span class="question-text">Is your family supportive of this business idea?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q4_a" name="question_4" value="Very supportive">
                        <label for="q4_a">Very supportive</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q4_b" name="question_4" value="Supportive">
                        <label for="q4_b">Supportive</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q4_c" name="question_4" value="Somewhat supportive">
                        <label for="q4_c">Somewhat supportive</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q4_d" name="question_4" value="Not supportive">
                        <label for="q4_d">Not supportive</label>
                    </div>
                </div>
            </div>

            <!-- Question 5 -->
            <div class="question-group">
                <span class="question-number">5</span>
                <span class="question-text">How comfortable are you managing finances and tracking expenses?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q5_a" name="question_5" value="Very comfortable">
                        <label for="q5_a">Very comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q5_b" name="question_5" value="Comfortable">
                        <label for="q5_b">Comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q5_c" name="question_5" value="Somewhat comfortable">
                        <label for="q5_c">Somewhat comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q5_d" name="question_5" value="Not comfortable">
                        <label for="q5_d">Not comfortable</label>
                    </div>
                </div>
            </div>

            <!-- Question 6 -->
            <div class="question-group">
                <span class="question-number">6</span>
                <span class="question-text">Are you willing to work full-time on this business initially?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q6_a" name="question_6" value="Yes, full-time">
                        <label for="q6_a">Yes, full-time</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q6_b" name="question_6" value="Yes, part-time">
                        <label for="q6_b">Yes, part-time</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q6_c" name="question_6" value="Flexible timing">
                        <label for="q6_c">Flexible timing</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q6_d" name="question_6" value="Limited availability">
                        <label for="q6_d">Limited availability</label>
                    </div>
                </div>
            </div>

            <!-- Question 7 -->
            <div class="question-group">
                <span class="question-number">7</span>
                <span class="question-text">Do you have access to your required startup capital?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q7_a" name="question_7" value="Yes, fully funded">
                        <label for="q7_a">Yes, fully funded</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q7_b" name="question_7" value="Mostly funded">
                        <label for="q7_b">Mostly funded</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q7_c" name="question_7" value="Partially funded">
                        <label for="q7_c">Partially funded</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q7_d" name="question_7" value="Not funded yet">
                        <label for="q7_d">Not funded yet</label>
                    </div>
                </div>
            </div>

            <!-- Question 8 -->
            <div class="question-group">
                <span class="question-number">8</span>
                <span class="question-text">How do you handle stress and challenges?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q8_a" name="question_8" value="Very well">
                        <label for="q8_a">Very well</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q8_b" name="question_8" value="Well">
                        <label for="q8_b">Well</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q8_c" name="question_8" value="Fairly well">
                        <label for="q8_c">Fairly well</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q8_d" name="question_8" value="Struggle with stress">
                        <label for="q8_d">Struggle with stress</label>
                    </div>
                </div>
            </div>

            <!-- Question 9 -->
            <div class="question-group">
                <span class="question-number">9</span>
                <span class="question-text">Do you have experience in sales or marketing?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q9_a" name="question_9" value="Extensive experience">
                        <label for="q9_a">Extensive experience</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q9_b" name="question_9" value="Some experience">
                        <label for="q9_b">Some experience</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q9_c" name="question_9" value="Little experience">
                        <label for="q9_c">Little experience</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q9_d" name="question_9" value="No experience">
                        <label for="q9_d">No experience</label>
                    </div>
                </div>
            </div>

            <!-- Question 10 -->
            <div class="question-group">
                <span class="question-number">10</span>
                <span class="question-text">How quickly do you expect to see profits?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q10_a" name="question_10" value="Less than 3 months">
                        <label for="q10_a">Less than 3 months</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q10_b" name="question_10" value="3-6 months">
                        <label for="q10_b">3-6 months</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q10_c" name="question_10" value="6-12 months">
                        <label for="q10_c">6-12 months</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q10_d" name="question_10" value="Over a year">
                        <label for="q10_d">Over a year</label>
                    </div>
                </div>
            </div>

            <!-- Question 11 -->
            <div class="question-group">
                <span class="question-number">11</span>
                <span class="question-text">Are you comfortable working in your local community?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q11_a" name="question_11" value="Very comfortable">
                        <label for="q11_a">Very comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q11_b" name="question_11" value="Comfortable">
                        <label for="q11_b">Comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q11_c" name="question_11" value="Somewhat comfortable">
                        <label for="q11_c">Somewhat comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q11_d" name="question_11" value="Prefer online/remote">
                        <label for="q11_d">Prefer online/remote</label>
                    </div>
                </div>
            </div>

            <!-- Question 12 -->
            <div class="question-group">
                <span class="question-number">12</span>
                <span class="question-text">How tech-savvy are you?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q12_a" name="question_12" value="Very tech-savvy">
                        <label for="q12_a">Very tech-savvy</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q12_b" name="question_12" value="Fairly tech-savvy">
                        <label for="q12_b">Fairly tech-savvy</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q12_c" name="question_12" value="Basic tech skills">
                        <label for="q12_c">Basic tech skills</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q12_d" name="question_12" value="Not tech-savvy">
                        <label for="q12_d">Not tech-savvy</label>
                    </div>
                </div>
            </div>

            <!-- Question 13 -->
            <div class="question-group">
                <span class="question-number">13</span>
                <span class="question-text">Are you willing to take on business and financial risks?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q13_a" name="question_13" value="Yes, high risk comfort">
                        <label for="q13_a">Yes, high risk comfort</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q13_b" name="question_13" value="Moderate risk comfort">
                        <label for="q13_b">Moderate risk comfort</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q13_c" name="question_13" value="Low risk comfort">
                        <label for="q13_c">Low risk comfort</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q13_d" name="question_13" value="Very risk averse">
                        <label for="q13_d">Very risk averse</label>
                    </div>
                </div>
            </div>

            <!-- Question 14 -->
            <div class="question-group">
                <span class="question-number">14</span>
                <span class="question-text">Do you prefer teamwork or independent work?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q14_a" name="question_14" value="Prefer teamwork">
                        <label for="q14_a">Prefer teamwork</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q14_b" name="question_14" value="Can work with team">
                        <label for="q14_b">Can work with team</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q14_c" name="question_14" value="Prefer independent">
                        <label for="q14_c">Prefer independent</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q14_d" name="question_14" value="Either works">
                        <label for="q14_d">Either works</label>
                    </div>
                </div>
            </div>

            <!-- Question 15 -->
            <div class="question-group">
                <span class="question-number">15</span>
                <span class="question-text">How well do you adapt to change?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q15_a" name="question_15" value="Adapt very easily">
                        <label for="q15_a">Adapt very easily</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q15_b" name="question_15" value="Adapt well">
                        <label for="q15_b">Adapt well</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q15_c" name="question_15" value="Adapt with effort">
                        <label for="q15_c">Adapt with effort</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q15_d" name="question_15" value="Struggle with change">
                        <label for="q15_d">Struggle with change</label>
                    </div>
                </div>
            </div>

            <!-- Question 16 -->
            <div class="question-group">
                <span class="question-number">16</span>
                <span class="question-text">Do you have a network to grow this business?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q16_a" name="question_16" value="Strong network">
                        <label for="q16_a">Strong network</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q16_b" name="question_16" value="Good network">
                        <label for="q16_b">Good network</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q16_c" name="question_16" value="Small network">
                        <label for="q16_c">Small network</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q16_d" name="question_16" value="Limited network">
                        <label for="q16_d">Limited network</label>
                    </div>
                </div>
            </div>

            <!-- Question 17 -->
            <div class="question-group">
                <span class="question-number">17</span>
                <span class="question-text">Would you be comfortable with customer service responsibilities?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q17_a" name="question_17" value="Very comfortable">
                        <label for="q17_a">Very comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q17_b" name="question_17" value="Comfortable">
                        <label for="q17_b">Comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q17_c" name="question_17" value="Somewhat comfortable">
                        <label for="q17_c">Somewhat comfortable</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q17_d" name="question_17" value="Not comfortable">
                        <label for="q17_d">Not comfortable</label>
                    </div>
                </div>
            </div>

            <!-- Question 18 -->
            <div class="question-group">
                <span class="question-number">18</span>
                <span class="question-text">How do you handle competition?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q18_a" name="question_18" value="Thrive on competition">
                        <label for="q18_a">Thrive on competition</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q18_b" name="question_18" value="Handle well">
                        <label for="q18_b">Handle well</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q18_c" name="question_18" value="Somewhat challenged">
                        <label for="q18_c">Somewhat challenged</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q18_d" name="question_18" value="Intimidated by competition">
                        <label for="q18_d">Intimidated by competition</label>
                    </div>
                </div>
            </div>

            <!-- Question 19 -->
            <div class="question-group">
                <span class="question-number">19</span>
                <span class="question-text">How prioritize long-term sustainability?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q19_a" name="question_19" value="Very important">
                        <label for="q19_a">Very important</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q19_b" name="question_19" value="Important">
                        <label for="q19_b">Important</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q19_c" name="question_19" value="Somewhat important">
                        <label for="q19_c">Somewhat important</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q19_d" name="question_19" value="Not a priority">
                        <label for="q19_d">Not a priority</label>
                    </div>
                </div>
            </div>

            <!-- Question 20 -->
            <div class="question-group">
                <span class="question-number">20</span>
                <span class="question-text">When do you plan to start this business?</span>
                <div class="answer-options">
                    <div class="radio-option">
                        <input type="radio" id="q20_a" name="question_20" value="Immediately">
                        <label for="q20_a">Immediately</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q20_b" name="question_20" value="Within 1 month">
                        <label for="q20_b">Within 1 month</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q20_c" name="question_20" value="Within 3 months">
                        <label for="q20_c">Within 3 months</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="q20_d" name="question_20" value="Later this year">
                        <label for="q20_d">Later this year</label>
                    </div>
                </div>
            </div>

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
}

// Update progress bar
function updateProgress() {
    const totalQuestions = 20;
    const answeredQuestions = document.querySelectorAll('input[type="radio"]:checked').length;
    const progress = (answeredQuestions / totalQuestions) * 100;
    document.getElementById('progressFill').style.width = progress + '%';
}

// Add event listeners to all radio buttons
document.querySelectorAll('input[type="radio"]').forEach(radio => {
    radio.addEventListener('change', updateProgress);
});

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

    // Collect form data
    const formData = new FormData(this);
    const answers = {};

    for (let i = 1; i <= totalQuestions; i++) {
        const answerKey = `question_${i}`;
        answers[answerKey] = formData.get(answerKey);
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
