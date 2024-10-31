document.addEventListener('DOMContentLoaded', function () {
	const switchers = [...document.querySelectorAll('.switcher')];
	
	switchers.forEach(item => {
	  item.addEventListener('click', function () {
		switchers.forEach(item => item.parentElement.classList.remove('is-active'));
		this.parentElement.classList.add('is-active');
	  });
	});
  
	// Login form submission
	document.getElementById('login-form').addEventListener('submit', function (e) {
		e.preventDefault();
		const email = document.getElementById('login-email').value;
		const password = document.getElementById('login-password').value;
	
		fetch('/login', { 
		  method: 'POST',
		  headers: {
			'Content-Type': 'application/json'
		  },
		  body: JSON.stringify({
			email: email,
			password: password
		  })
		})
		  .then(response => response.json())
		  .then(data => {
			if (data.success) {
			  // Handle successful login and redirect to Blog.html
			  window.location.href = 'Blog.html';
			} else {
			  // Handle login error
			  alert('Login failed: ' + data.message);
			}
		  })
		  .catch(error => {
			console.error('Error:', error);
		  });
	  });
	
	  // Signup form submission
	  document.getElementById('signup-form').addEventListener('submit', function (e) {
		e.preventDefault();
		const email = document.getElementById('signup-email').value;
		const username = document.getElementById('signup-username').value;
		const password = document.getElementById('signup-password').value;
	
		fetch('/register', { 
		  method: 'POST',
		  headers: {
			'Content-Type': 'application/json'
		  },
		  body: JSON.stringify({
			email: email,
			username: username,
			password: password
		  })
		})
		  .then(response => response.json())
		  .then(data => {
			if (data.success) {
			  // Handle successful signup and redirect to Blog.html
			  window.location.href = 'Blog.html';
			} else {
			  // Handle signup error
			  alert('Signup failed: ' + data.message);
			}
		  })
		  .catch(error => {
			console.error('Error:', error);
		  });
	  });
    });
  
  