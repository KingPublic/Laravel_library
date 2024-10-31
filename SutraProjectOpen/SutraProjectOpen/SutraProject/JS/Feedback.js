
document.getElementById('feedbackForm').addEventListener('submit', function(event) {
  event.preventDefault();

  // Get form data
  const email = document.getElementById('email').value;
  const message = document.getElementById('message').value;

  // Validate email format
  if (!validateEmail(email)) {
    document.getElementById('feedbackMessage').innerText = "Please enter a valid email.";
    return;
  }

  // Create AJAX request
  const xhr = new XMLHttpRequest();
  xhr.open("POST", "process_feedback.php", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);
      document.getElementById('feedbackMessage').innerText = response.message;
    }
  };

  // Send form data to backend
  const data = `email=${encodeURIComponent(email)}&message=${encodeURIComponent(message)}`;
  xhr.send(data);
});

function validateEmail(email) {
  const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return re.test(String(email).toLowerCase());
}

