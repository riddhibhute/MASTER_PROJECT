<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .form-container {
            display: none;
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 15px;
        }
        .form-row {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
        .form-row label {
            width: 150px;
        }
        .form-row input, .form-row select {
            flex: 1;
            padding: 5px;
        }
        button {
            padding: 8px 15px;
            margin-top: 10px;
        }
        .btn-blue {
            background-color: #007BFF;
            color: white;
            border: none;
        }
        .btn-blue:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>User List</h2>

<!-- Add New User Button -->
<button class="btn-blue" onclick="toggleForm()">Add New User</button>

<!-- User Table -->
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Code</th>
            <th>User Type</th>
            <th>Phone</th>
            <th>Department</th>
            <th>Status</th>
            <th>Joining Date</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Dr. RAJIV GUPTA</td>
            <td>E-007</td>
            <td>Consultant</td>
            <td>3333333333</td>
            <td>ANESTHESIOLOGY</td>
            <td>Confirmed</td>
            <td>24-08-2022</td>
        </tr>
        <!-- More rows can be dynamically populated here -->
    </tbody>
</table>

<!-- Registration Form -->
<div class="form-container" id="registrationForm">
    <h3>Register New User</h3>
    <form>
        <div class="form-row">
            <label for="prefix">Prefix *</label>
            <select id="prefix">
                <option value="">Select</option>
                <option>Mr.</option>
                <option>Mrs.</option>
                <option>Dr.</option>
            </select>

            <label for="fullName">Full Name *</label>
            <input type="text" id="fullName" required>
        </div>

        <div class="form-row">
            <label for="primaryNo">Primary No *</label>
            <input type="text" id="primaryNo" required>

            <label for="secondaryNo">Secondary No</label>
            <input type="text" id="secondaryNo">
        </div>

        <div class="form-row">
            <label for="email">Personal Email-ID</label>
            <input type="email" id="email">

            <label for="officialEmail">Official Email-ID</label>
            <input type="email" id="officialEmail">
        </div>

        <div class="form-row">
            <label for="dob">DOB *</label>
            <input type="date" id="dob">

            <label for="gender">Gender *</label>
            <select id="gender">
                <option value="">Select</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>
        </div>

        <div class="form-row">
            <label for="company">Company Name *</label>
            <input type="text" id="company">

            <label for="department">Department Name *</label>
            <input type="text" id="department">
        </div>

        <div class="form-row">
            <label for="designation">Designation *</label>
            <input type="text" id="designation">

            <label for="status">Status *</label>
            <select id="status">
                <option value="">Select</option>
                <option>Confirmed</option>
                <option>Student</option>
                <option>Trainee</option>
            </select>
        </div>

        <div class="form-row">
            <label for="userType">User Type *</label>
            <select id="userType">
                <option value="">Select</option>
                <option>Staff</option>
                <option>Doctor</option>
                <option>Consultant</option>
            </select>

            <label for="joiningDate">Date of Joining</label>
            <input type="date" id="joiningDate">
        </div>

        <!-- Submit/Save button -->
        <button type="submit" class="btn-blue">Save</button>
    </form>
</div>

<script>
    function toggleForm() {
        var form = document.getElementById("registrationForm");
        form.style.display = form.style.display === "none" || form.style.display === "" ? "block" : "none";
    }
</script>

</body>
</html>
