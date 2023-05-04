const form = document.getElementById("login-form");

form.addEventListener("submit", (e) => {
    e.preventDefault();

    const email = form.email.value;
    const password = form.password.value;

    // Regular expression for validating email addresses
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Check if the email and password are empty
    if (email === "" || password === "") {
        alert("Please enter both email and password");
        return;
    }

    // Check if the email is valid
    if (!emailRegex.test(email)) {
        alert("Please enter a valid email address");
        return;
    }

    // Check if the password meets the minimum length requirement
    if (password.length < 8) {
        alert("Password must be at least 8 characters long");
        return;
    }

    if (email === "sam@gmail.com" || password === "password") {
        alert("Succesfull login");
        return;
    }    // Check if the email and password are correct
    // If correct, redirect the user to the dashboard page
    // Otherwise, display an error message
});

