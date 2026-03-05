@extends('layouts.app')

@section('content')

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

        <label>Your Address (Auto-detect)</label>
        <input type="text" id="addressInput" name="user_address" placeholder="Start typing your address..." autocomplete="off">
        <input type="hidden" id="latitude" name="latitude">
        <input type="hidden" id="longitude" name="longitude">
        <input type="hidden" id="formattedAddress" name="formatted_address">

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

@endsection

@section('scripts')
<script>
// Initialize Google Places Autocomplete
function initAutocomplete() {
    const input = document.getElementById('addressInput');
    if (!input) return;

    const autocomplete = new google.maps.places.Autocomplete(input, {
        fields: ['address_components', 'geometry', 'formatted_address', 'name']
    });

    autocomplete.addListener('place_changed', function() {
        const place = autocomplete.getPlace();
        
        if (!place.geometry) {
            console.log('No details available for input: ' + place.name);
            return;
        }

        // Store coordinates and formatted address
        document.getElementById('latitude').value = place.geometry.location.lat();
        document.getElementById('longitude').value = place.geometry.location.lng();
        document.getElementById('formattedAddress').value = place.formatted_address;
    });
}

// Wait for Google Maps API to load
window.initAutocomplete = initAutocomplete;
if (typeof google !== 'undefined' && google.maps && google.maps.places) {
    initAutocomplete();
} else {
    window.addEventListener('load', function() {
        setTimeout(initAutocomplete, 1000);
    });
}

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

                let optionJson = JSON.stringify(option).replace(/"/g, '&quot;');
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

                        <button class="btn btn-select" data-option="${optionJson}">Select</button>
                    </div>
                `;

                resultsDiv.innerHTML += card;
            });

            // Add click event listeners to select buttons
            document.querySelectorAll('.btn-select').forEach(button => {
                button.addEventListener('click', function() {
                    const optionJson = this.getAttribute('data-option').replace(/&quot;/g, '"');
                    const option = JSON.parse(optionJson);
                    selectOption(option);
                });
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

function selectOption(option) {
    // Store the option in sessionStorage for retrieval on the questions page
    sessionStorage.setItem('selectedOption', JSON.stringify(option));
    
    // Also store user's location if provided
    const userAddress = document.getElementById('formattedAddress')?.value || 
                       document.getElementById('addressInput')?.value || 
                       '';
    if (userAddress) {
        sessionStorage.setItem('userLocation', userAddress);
    }
    
    // Redirect to the questions page
    window.location.href = '{{ route("questions") }}';
}
</script>
@endsection