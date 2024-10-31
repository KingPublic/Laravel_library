async function fetchDestinations() {
    try {
      const response = await fetch('https://your-backend-api-url/api/destinations'); // Ganti dengan URL API Anda
      const data = await response.json();

      const datalist = document.getElementById('datalist');
      data.forEach(destination => {
        const item = document.createElement('div');
        item.className = 'autocomplete-item';
        item.textContent = destination;

        item.addEventListener('click', () => {
          document.getElementById('destinasi').value = destination;
          datalist.innerHTML = '';
        });

        datalist.appendChild(item);
      });
    } catch (error) {
      console.error('Error fetching destinations:', error);
    }
  }

  function validate() {
    const selectedActivities = document.querySelectorAll('.activity-option.selected');
    const selectedPerson = document.querySelector('.person.selected');
    const selectedAnggaran = document.querySelector('.option-anggaran.selected');
    const destinasi = document.getElementById('destinasi').value;
    const date = document.getElementById('datePicker').value;
    const days = parseInt(document.querySelector('.num').innerText);

    if (!destinasi) {
      alert("Harap pilih terlebih dahulu destinasi Anda!");
      return;
    }

    if (!date) {
      alert("Harap pilih tanggal keberangkatan Anda!");
      return;
    }

    if (!selectedAnggaran) {
      alert("Harap pilih terlebih dahulu anggaran Anda!");
      return;
    }

    if (!selectedPerson) {
      alert("Harap pilih terlebih dahulu jumlah orang yang pergi!");
      return;
    }

    if (selectedActivities.length <= 0) {
      alert("Harap pilih terlebih dahulu aktivitas yang diinginkan!");
      return;
    }

    const activities = Array.from(selectedActivities).map(activity => activity.querySelector('h3').innerText);
    const person = selectedPerson.querySelector('h3').innerText;
    const anggaran = selectedAnggaran.querySelector('h3').innerText;

    const tripData = {
      destinasi,
      date,
      days,
      anggaran,
      person,
      activities
    };

    fetch('/api/trip/plan', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(tripData)
    })
    .then(response => response.json()) // Assuming your backend sends JSON response
    .then(data => {
      // Save trip data to local storage or session storage
      sessionStorage.setItem('tripData', JSON.stringify(data));
      
      // Redirect to result page
      window.location.href = '/trip-result.html';
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }

  document.addEventListener('DOMContentLoaded', fetchDestinations);

  const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();

// Middleware to parse incoming request bodies
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Serve static files (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, 'public')));

// POST endpoint to handle form submission
app.post('/submit', (req, res) => {
    // Here you would integrate with your AI service to process the form data
    const formData = req.body; // Contains all form input data

    // Example: Process formData with AI service and get result
    const aiResult = { 
        // Example result from AI service
        itinerary: "Your personalized travel plan based on inputs."
    };

    // Redirect to the result page with AI output
    res.redirect(`/afterplan?itinerary=${encodeURIComponent(aiResult.itinerary)}`);
});

// GET endpoint for afterplan.html page
app.get('/afterplan', (req, res) => {
    const itinerary = req.query.itinerary; // Retrieve AI result from query parameter

    // Render afterplan.html with AI result
    res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>After Planning</title>
            <link rel="stylesheet" href="styles.css">
        </head>
        <body>
            <div class="container">
                <h1>Your Travel Plan</h1>
                <p>${itinerary}</p>
            </div>
        </body>
        </html>
    `);
});

// Start server on port 3000
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});



 src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"