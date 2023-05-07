function validEmail(){
    const emailPattern = /[A-Za-z\.]*@[A-Za-z]*(\.[A-Za-z]*)+/
    const emailInput = document.getElementById("email");

    if(emailInput.value===""){
        emailInput.classList.remove("wrong");
        emailInput.classList.remove("right");
    }    
    else if(emailPattern.test(emailInput.value)){
        emailInput.classList.remove("wrong");
        emailInput.classList.add("right");
    }
    else{
        emailInput.classList.remove("right");
        emailInput.classList.add("wrong")
    }
}



function validName(){
    const namePattern = /^[A-Za-z] [A-Za-z]+( [A-Za-z]+)?$/
    const nameInput = document.getElementById("name");
    
    if(nameInput.value===""){
        nameInput.classList.remove("wrong");
        nameInput.classList.remove("right");
    }    
    else if(namePattern.test(nameInput.value)){
        nameInput.classList.remove("wrong");
        nameInput.classList.add("right");
        return true;
    }
    else{
        nameInput.classList.remove("right");
        nameInput.classList.add("wrong")
    }
    return false;
}

function validUsername(){
    const usernamePattern = /^[A-Za-z]+$/
    const usernameInput = document.getElementById("username");
    const suggestion = document.getElementById("usernameSuggestion");

    if(usernameInput.value===""){
        suggestion.innerHTML = "";
        usernameInput.classList.remove("wrong");
        usernameInput.classList.remove("right");
    }    
    else if(usernamePattern.test(usernameInput.value)){
        suggestion.innerHTML = "";
        usernameInput.classList.remove("wrong");
        usernameInput.classList.add("right");
        return true;
    }
    else{
        suggestion.innerHTML = "Only alphabets are allowed";
        usernameInput.classList.remove("right");
        usernameInput.classList.add("wrong")
    }
    return false;
}

function validPassword(){
    const passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&*?])[A-Za-z\d@$!%?&*?]{8,}$/
    const passwordInput = document.getElementById("password");
    const suggestion = document.getElementById("passwordSuggestion");

    if(passwordInput.value===""){
        suggestion.innerHTML = "";
        passwordInput.classList.remove("wrong");
        passwordInput.classList.remove("right");
    }    
    else if(passwordPattern.test(passwordInput.value)){
        suggestion.innerHTML = "";
        passwordInput.classList.remove("wrong");
        passwordInput.classList.add("right");
        return true;
    }
    else if(passwordInput.value.search(/[a-z]/) < 0){
        suggestion.innerHTML = "Add small letters"
        passwordInput.classList.remove("right");
        passwordInput.classList.add("wrong")
    }
    else if( passwordInput.value.search(/.*[A-Z]/) < 0){
        suggestion.innerHTML = "Add Capital letters"
        passwordInput.classList.remove("right");
        passwordInput.classList.add("wrong")
    }
    else if( passwordInput.value.search(/.*[\d]/) < 0){
        suggestion.innerHTML = "Add Digits"
        passwordInput.classList.remove("right");
        passwordInput.classList.add("wrong")
    }
    else if( passwordInput.value.search(/.*[@$!%*?&*?]/) < 0){
        suggestion.innerHTML = "Add Special Charecters"
        passwordInput.classList.remove("right");
        passwordInput.classList.add("wrong")
    }
    else{
        suggestion.innerHTML = "Length less than 8"
        passwordInput.classList.remove("right");
        passwordInput.classList.add("wrong")
    }

    return false;
    
}

function checkLanguage(){
    const arr=[];
    const ctn = document.getElementsByClassName("language-ctn");
    Array.from(ctn).forEach(input=>{
        if(input.firstElementChild.checked){
            arr.push(input.firstElementChild.value);
        }
    })

    if(arr.length < 2){
        alert("Select Minimum 2 languages");
        return false;
    }
    return true;
}


function checkAge(){
    const dobDOM = document.getElementById("dob");
    
    const dob = new Date(dobDOM.value);
    var month_diff = Date.now() - dob.getTime();  
    var age_dt = new Date(month_diff);     
    var year = age_dt.getUTCFullYear();  
    var age = Math.abs(year - 1970);  
    
    if(age >=18 && age <=35){
        return true;
    }else{
        alert("Age must be above 18 and below 35");
        return false;
    }
}

function submitForm(){
    checkLanguage()
    if(checkAge() && validPassword() && validUsername() && validName() && checkLanguage()){
        alert("Details have been submitted Successfully");
    }
}