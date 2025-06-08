// CompanyRegistrationForm.jsx
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './CompanyRegistrationForm.css'; // Move your CSS here

const CompanyRegistrationForm = () => {
  const [formData, setFormData] = useState({
    companyName: '',
    country: '',
    state: '',
    city: '',
    address: '',
    pincode: '',
    phoneNo: '',
    email: '',
    adminName: '',
    identityProofNo: '',
    photoFilePath: null,
  });

  const [countries, setCountries] = useState([]);
  const [states, setStates] = useState([]);
  const [cities, setCities] = useState([]);

  useEffect(() => {
    fetchCountries();
  }, []);

  const fetchCountries = async () => {
    try {
      const res = await fetch('https://countriesnow.space/api/v0.1/countries/positions');
      const result = await res.json();
      setCountries(result.data.map(c => c.name));
    } catch (e) {
      alert('Could not load countries');
      console.error(e);
    }
  };

  const fetchStates = async (country) => {
    try {
      const res = await fetch('https://countriesnow.space/api/v0.1/countries/states', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ country }),
      });
      const result = await res.json();
      setStates(result.data.states.map(s => s.name));
      setCities([]); // Reset cities
    } catch (e) {
      alert('Could not load states');
      console.error(e);
    }
  };

  const fetchCities = async (country, state) => {
    try {
      const res = await fetch('https://countriesnow.space/api/v0.1/countries/state/cities', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ country, state }),
      });
      const result = await res.json();
      setCities(result.data);
    } catch (e) {
      alert('Could not load cities');
      console.error(e);
    }
  };

  const handleChange = (e) => {
    const { name, value, files } = e.target;
    setFormData({
      ...formData,
      [name]: files ? files[0] : value,
    });

    if (name === 'country') {
      setFormData({ ...formData, country: value, state: '', city: '' });
      fetchStates(value);
    }

    if (name === 'state') {
      setFormData({ ...formData, state: value, city: '' });
      fetchCities(formData.country, value);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const dataToSend = { ...formData };
      delete dataToSend.photoFilePath;

      await axios.post('http://localhost:8080/api/companies', dataToSend, {
        headers: { 'Content-Type': 'application/json' },
      });

      alert('Company saved successfully!');
      window.location.href = '/setup';
    } catch (err) {
      alert('Error saving company!');
      console.error(err);
    }
  };

  return (
    <div className="registration-container">
      <h2>MedClone -- Company Registration</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label>Company Name *</label>
          <input type="text" name="companyName" required value={formData.companyName} onChange={handleChange} />
        </div>

        <div className="form-row">
          <div className="form-group">
            <label>Country</label>
            <select name="country" required value={formData.country} onChange={handleChange}>
              <option value="">--Select Country--</option>
              {countries.map((c, idx) => <option key={idx} value={c}>{c}</option>)}
            </select>
          </div>
          <div className="form-group">
            <label>State</label>
            <select name="state" required value={formData.state} onChange={handleChange}>
              <option value="">--Select State--</option>
              {states.map((s, idx) => <option key={idx} value={s}>{s}</option>)}
            </select>
          </div>
          <div className="form-group">
            <label>City</label>
            <select name="city" required value={formData.city} onChange={handleChange}>
              <option value="">--Select City--</option>
              {cities.map((c, idx) => <option key={idx} value={c}>{c}</option>)}
            </select>
          </div>
        </div>

        <div className="form-group">
          <label>Address</label>
          <input type="text" name="address" value={formData.address} onChange={handleChange} />
        </div>

        <div className="form-row">
          <div className="form-group">
            <label>Pincode</label>
            <input type="text" name="pincode" value={formData.pincode} onChange={handleChange} />
          </div>
          <div className="form-group">
            <label>Phone Number</label>
            <input type="tel" name="phoneNo" value={formData.phoneNo} onChange={handleChange} />
          </div>
          <div className="form-group">
            <label>Email</label>
            <input type="email" name="email" value={formData.email} onChange={handleChange} />
          </div>
        </div>

        <div className="form-row">
          <div className="form-group">
            <label>Admin Name</label>
            <input type="text" name="adminName" value={formData.adminName} onChange={handleChange} />
          </div>
          <div className="form-group">
            <label>Identity Proof No.</label>
            <input type="text" name="identityProofNo" value={formData.identityProofNo} onChange={handleChange} />
          </div>
          <div className="form-group">
            <label>Upload Photo</label>
            <input type="file" name="photoFilePath" accept="image/*" onChange={handleChange} />
          </div>
        </div>

        <button type="submit" className="submit-btn">Register Company</button>
      </form>
    </div>
  );
};
export default CompanyRegistrationForm;

