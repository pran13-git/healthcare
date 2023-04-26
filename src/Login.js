import React, { useState } from 'react';
import './Login.css';


function Login() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [rememberMe, setRememberMe] = useState(false);
  const [forgotPasswordClicked, setForgotPasswordClicked] = useState(false);

  const handleUsernameChange = (event) => {
    setUsername(event.target.value);
  };

  const handlePasswordChange = (event) => {
    setPassword(event.target.value);
  };

  const handleRememberMeChange = (event) => {
    setRememberMe(event.target.checked);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log('Username:', username, 'Password:', password, 'Remember me:', rememberMe);
    // add code to handle form submission here
  };

  const handleForgotPasswordClick = () => {
    setForgotPasswordClicked(true);
    // add code to handle forgot password click here
  };

  return (
    <div className="login-container">
      <form onSubmit={handleSubmit} className="login-form">
        <h2 style={{textAlign:"left"}}>Login</h2>
        <label>
          Username
          <input type="text" value={username} onChange={handleUsernameChange} />
        </label>
        <label>
          Password
          <input type="password" value={password} onChange={handlePasswordChange} />
        </label>
        <div className="form-row">
          <label>
            <input type="checkbox" checked={rememberMe} onChange={handleRememberMeChange} />
            <span>Remember me</span>
          </label>
          <button type="button" onClick={handleForgotPasswordClick}>Forgot password?</button>
        </div>
        <button type="submit">Login</button>
      </form>
      {forgotPasswordClicked && (
        <div className="forgot-password-container">
          <h2>Forgot Password?</h2>
          <p>Enter your email address and we'll send you a link to reset your password.</p>
          <form onSubmit={() => {}}>
            <label>
              Email:
              <input type="email" />
            </label>
            <button type="submit">Send Reset Link</button>
          </form>
        </div>
      )}
    </div>
  );
}

export default Login;
