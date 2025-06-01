<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .registration-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 20px;
            width: 950px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        .registration-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-family: Lucida Handwriting;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 8px;
            font-weight: 500;
            color: #444;
        }

        .form-group input, .form-group select {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
            transition: 0.3s;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: #6c63ff;
            box-shadow: 0 0 5px rgba(108, 99, 255, 0.5);
            outline: none;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .submit-btn {
            background: #6c63ff;
            color: white;
            padding: 14px;
            font-size: 16px;
            border: none;
            border-radius: 12px;
            width: 100%;
            cursor: pointer;
            font-weight: bold;
        }

        .submit-btn:hover {
            background: #594ad4;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="registration-container">
    <h2>MedClone -- Company Registration</h2>
    <form id="companyForm">
        <div class="form-group">
            <label for="companyName">Company Name *</label>
            <input type="text" id="companyName" name="companyName" required>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="country">Country</label>
                <select id="country" name="country" required>
                    <option value="">--Select Country--</option>
                </select>
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <select id="state" name="state" required>
                    <option value="">--Select State--</option>
                </select>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <select id="city" name="city" required>
                    <option value="">--Select City--</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address">
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="pincode">Pincode</label>
                <input type="text" id="pincode" name="pincode">
            </div>
            <div class="form-group">
                <label for="phoneNo">Phone Number</label>
                <input type="tel" id="phoneNo" name="phoneNo">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="adminName">Admin Name</label>
                <input type="text" id="adminName" name="adminName">
            </div>
            <div class="form-group">
                <label for="identityProofNo">Identity Proof No.</label>
                <input type="text" id="identityProofNo" name="identityProofNo">
            </div>
            <div class="form-group">
                <label for="photoFilePath">Upload Photo</label>
                <input type="file" id="photoFilePath" name="photoFilePath" accept="image/*">
            </div>
        </div>

        <button type="submit" class="submit-btn">Register Company</button>
    </form>
</div>

<script>
    const countrySelect = document.getElementById('country');
    const stateSelect = document.getElementById('state');
    const citySelect = document.getElementById('city');

    // Load countries
    async function loadCountries() {
        try {
            const res = await fetch('https://countriesnow.space/api/v0.1/countries/positions');
            const result = await res.json();
            result.data.forEach(c => {
                const option = document.createElement('option');
                option.value = c.name;
                option.textContent = c.name;
                countrySelect.appendChild(option);
            });
        } catch (e) {
            alert("Could not load countries");
            console.error(e);
        }
    }

    // Load states
    async function loadStates(country) {
        try {
            stateSelect.innerHTML = '<option value="">--Select State--</option>';
            citySelect.innerHTML = '<option value="">--Select City--</option>';
            const res = await fetch('https://countriesnow.space/api/v0.1/countries/states', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ country })
            });
            const result = await res.json();
            result.data.states.forEach(state => {
                const option = document.createElement('option');
                option.value = state.name;
                option.textContent = state.name;
                stateSelect.appendChild(option);
            });
        } catch (e) {
            alert("Could not load states");
            console.error(e);
        }
    }

    // Load cities
    async function loadCities(country, state) {
        try {
            citySelect.innerHTML = '<option value="">--Select City--</option>';
            const res = await fetch('https://countriesnow.space/api/v0.1/countries/state/cities', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ country, state })
            });
            const result = await res.json();
            result.data.forEach(city => {
                const option = document.createElement('option');
                option.value = city;
                option.textContent = city;
                citySelect.appendChild(option);
            });
        } catch (e) {
            alert("Could not load cities");
            console.error(e);
        }
    }

    // Event listeners
    countrySelect.addEventListener('change', () => {
        const selectedCountry = countrySelect.value;
        if (selectedCountry) {
            loadStates(selectedCountry);
        }
    });

    stateSelect.addEventListener('change', () => {
        const selectedCountry = countrySelect.value;
        const selectedState = stateSelect.value;
        if (selectedCountry && selectedState) {
            loadCities(selectedCountry, selectedState);
        }
    });

    // Load initial countries
    window.addEventListener('DOMContentLoaded', loadCountries);


      $('#companyForm').on('submit', function(e) {
            e.preventDefault();
            const formData = {
                companyName: $("input[name='companyName']").val(),
                country: $("input[name='country']").val(),
                state: $("input[name='state']").val(),
                city: $("input[name='city']").val(),
                address: $("input[name='address']").val(),
                pincode: $("input[name='pincode']").val(),
                phoneNo: $("input[name='phoneNo']").val(),
                email: $("input[name='email']").val(),
                adminName: $("input[name='adminName']").val(),
                identityProofNo: $("input[name='identityProofNo']").val(),
                photoFilePath: $("input[name='photoFilePath']").val()
            };

            $.ajax({
                url: 'http://localhost:8080/api/companies',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    alert("Company saved successfully!");
                },
                error: function(err) {
                    alert("Error saving company!");
                    console.error(err);
                }
            });
        });
</script>
</body>
</html>
