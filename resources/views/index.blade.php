<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AI Business Coach</title>
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

<!-- USER PROFILE INPUT -->
<section>
    <h2>Step 1: Your Profile</h2>

    <label>Capital Band</label>
    <select name="capital_band_id">
        <option value="">-- Select Capital Band --</option>
        @foreach($capitalBands as $band)
            <option value="{{ $band->id }}">{{ $band->label }}</option>
        @endforeach
    </select>

    <label>Time Availability</label>
    <select name="time_availability_id">
        <option value="">-- Select Time Availability --</option>
        @foreach($timeAvailabilities as $time)
            <option value="{{ $time->id }}">{{ $time->label }}</option>
        @endforeach
    </select>

    <label>Skills</label>
    <div class="checkbox-group">
        @foreach($skills as $skill)
            <label><input type="checkbox" name="skills[]" value="{{ $skill->id }}"> {{ $skill->label }}</label>
        @endforeach
    </div>

    <label>Risk Tolerance</label>
    <select name="risk_tolerance_id">
        <option value="">-- Select Risk Tolerance --</option>
        @foreach($riskTolerances as $risk)
            <option value="{{ $risk->id }}">{{ $risk->label }}</option>
        @endforeach
    </select>

    <label>Assets You Have</label>
    <div class="checkbox-group">
        <label><input type="checkbox"> Stove</label>
        <label><input type="checkbox"> Freezer</label>
        <label><input type="checkbox"> Vehicle</label>
        <label><input type="checkbox"> Sewing Machine</label>
        <label><input type="checkbox"> Smartphone Only</label>
    </div>

    <button class="btn">Find My Best Businesses</button>
</section>

<!-- MATCHING OUTPUT -->
<section>
    <h2>Step 2: Recommended Businesses</h2>

    <div class="result-card">
        <h3>🍲 Home Tiffin Service</h3>
        <strong>Why this fits:</strong>
        <ul>
            <li>Low startup cost matches your capital band</li>
            <li>You selected cooking skills</li>
            <li>Short cash cycle (daily income)</li>
        </ul>
        <strong>Key Risks:</strong>
        <ul>
            <li>Requires daily stock planning</li>
            <li>Food safety discipline</li>
        </ul>
        <strong>First Action:</strong>
        <p>List 5 dishes you can cook consistently.</p>
    </div>

    <div class="result-card">
        <h3>📱 Phone Repair Service</h3>
        <strong>Why this fits:</strong>
        <ul>
            <li>Repair skills selected</li>
            <li>Works in medium foot-traffic areas</li>
        </ul>
        <strong>Key Risks:</strong>
        <ul>
            <li>Needs tool investment</li>
        </ul>
        <strong>First Action:</strong>
        <p>Write a list of tools required.</p>
    </div>
</section>

<!-- DAILY DEVELOPMENT ENGINE -->
<section>
    <h2>Step 3: Today’s Micro Tasks</h2>

    <div class="result-card">
        <h3>📅 Daily Discipline Tasks</h3>
        <ul>
            <li>Record today’s money in/out</li>
            <li>Count stock of 5 fast-selling items</li>
            <li>Check profit on 3 products</li>
            <li>Record one customer sale</li>
        </ul>
    </div>
</section>

</body>
</html>
