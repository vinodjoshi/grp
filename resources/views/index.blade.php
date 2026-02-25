<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AI Business Coach</title>

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f7fa;
        }
        header {
            background: #1e293b;
            color: white;
            padding: 15px 25px;
        }
        h1 {
            margin: 0;
            font-size: 20px;
        }
        section {
            background: white;
            margin: 20px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
        }
        h2 {
            margin-top: 0;
            color: #1e293b;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        select, input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 5px;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background: #2563eb;
            color: white;
            cursor: pointer;
        }
        .btn:disabled {
            background: #94a3b8;
            cursor: not-allowed;
        }
        .loader {
            display: none;
            margin-top: 20px;
            text-align: center;
        }
        .loader.active {
            display: block;
        }
        .spinner {
            border: 4px solid #f3f4f6;
            border-top: 4px solid #2563eb;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .result-card {
            background: #f1f5f9;
            padding: 15px;
            border-radius: 6px;
            margin-top: 15px;
        }
        ul {
            padding-left: 18px;
        }
    </style>
</head>
<body>

<header>
    <h1>AI Business Coach — Matching & Daily Enablement</h1>
</header>

<section>
    <h2>Step 1: Your Profile</h2>

    <form id="businessCoachForm">
        @csrf

        <label>Capital Band</label>
        <select name="capital_band">
            <option value="">-- Select Capital Band --</option>
            @foreach($capitalBands as $band)
                <option value="{{ $band->label }}">{{ $band->label }}</option>
            @endforeach
        </select>

        <label>Time Availability</label>
        <select name="time_availability">
            <option value="">-- Select Time Availability --</option>
            @foreach($timeAvailabilities as $time)
                <option value="{{ $time->label }}">{{ $time->label }}</option>
            @endforeach
        </select>

        <label>Skills</label>
        <div class="checkbox-group">
            @foreach($skills as $skill)
                <label>
                    <input type="checkbox" name="skills[]" value="{{ $skill->label }}">
                    {{ $skill->label }}
                </label>
            @endforeach
        </div>

        <label>Risk Tolerance</label>
        <select name="risk_tolerance">
            <option value="">-- Select Risk Tolerance --</option>
            @foreach($riskTolerances as $risk)
                <option value="{{ $risk->label }}">{{ $risk->label }}</option>
            @endforeach
        </select>

        <label>Confidence to Sell</label>
        <select name="confidence_to_sell">
            <option value="">-- Select Confidence to Sell --</option>
            @foreach($confidenceToSells as $confidence)
                <option value="{{ $confidence->label }}">{{ $confidence->label }}</option>
            @endforeach
        </select>

        <label>Location</label>
        <select name="location">
            <option value="">-- Select Location --</option>
            @foreach($locations as $loc)
                <option value="{{ $loc->label }}">{{ $loc->label }}</option>
            @endforeach
        </select>

        <label>Assets You Have</label>
        <div class="checkbox-group">
            <label><input type="checkbox" name="assets[]" value="Stove"> Stove</label>
            <label><input type="checkbox" name="assets[]" value="Freezer"> Freezer</label>
            <label><input type="checkbox" name="assets[]" value="Vehicle"> Vehicle</label>
            <label><input type="checkbox" name="assets[]" value="Sewing Machine"> Sewing Machine</label>
            <label><input type="checkbox" name="assets[]" value="Smartphone Only"> Smartphone Only</label>
        </div>

        <button type="submit" class="btn" id="submitBtn">Find My Best Businesses</button>
    </form>

    <div class="loader" id="loader">
        <div class="spinner"></div>
        <p>Finding your best business matches...</p>
    </div>

    <div id="results"></div>
</section>

<script>
document.getElementById("businessCoachForm").addEventListener("submit", function(e) {
    e.preventDefault();

    let formData = new FormData(this);
    let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    let loader = document.getElementById('loader');
    let submitBtn = document.getElementById('submitBtn');
    let resultsDiv = document.getElementById("results");

    // Show loader and disable button
    loader.classList.add('active');
    submitBtn.disabled = true;
    resultsDiv.innerHTML = "";

    fetch('{{ route("business-coach.recommend") }}', {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': csrfToken
        },
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        // Hide loader and enable button
        loader.classList.remove('active');
        submitBtn.disabled = false;

        if(data.success) {

            data.data.options.forEach((option, index) => {

                let card = `
                    <div class="result-card">
                        <h3>Option ${index + 1}: ${option.title}</h3>
                        <strong>Subtype ID:</strong> ${option.subtype_id}<br><br>

                        <strong>Why it fits:</strong>
                        <ul>
                            ${option.why_it_fits.map(item => `<li>${item}</li>`).join("")}
                        </ul>

                        <strong>Operating model:</strong>
                        <p>${option.operating_model}</p>

                        <strong>Complexity:</strong> ${option.complexity}<br>
                        <strong>Risk band:</strong> ${option.risk_band}<br>
                        <strong>Capital fit:</strong> ${option.capital_fit}<br><br>

                        <strong>Why it’s strong:</strong>
                        <p>${option.confidence_reason}</p>
                    </div>
                `;

                resultsDiv.innerHTML += card;
            });

        } else {
            resultsDiv.innerHTML = `<p style="color:red;">${data.error}</p>`;
        }
    })
    .catch(err => {
        // Hide loader and enable button on error
        loader.classList.remove('active');
        submitBtn.disabled = false;
        console.error(err);
        alert("Something went wrong.");
    });
});
</script>

</body>
</html>