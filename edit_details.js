// Select the medical details element
const medicalDetails = document.querySelector('.medical-details');

// Create the edit button
const editButton = document.createElement('button');
editButton.innerHTML = '<i class="fa fa-pencil"></i> Edit';
editButton.classList.add('edit-button');
medicalDetails.appendChild(editButton);

// Listen for clicks on the edit button
editButton.addEventListener('click', () => {
  // Get the medical details fields
  const nameField = medicalDetails.querySelector('p:nth-of-type(1)');
  const emailField = medicalDetails.querySelector('p:nth-of-type(2)');
  const phoneField = medicalDetails.querySelector('p:nth-of-type(3)');
  const allergiesField = medicalDetails.querySelector('p:nth-of-type(4)');
  const medicationField = medicalDetails.querySelector('p:nth-of-type(5)');

  // Convert the fields to input elements
  const nameInput = createInputField(nameField, 'text', nameField.textContent);
  const emailInput = createInputField(emailField, 'email', emailField.textContent);
  const phoneInput = createInputField(phoneField, 'tel', phoneField.textContent);
  const allergiesInput = createInputField(allergiesField, 'text', allergiesField.textContent);
  const medicationInput = createInputField(medicationField, 'text', medicationField.textContent);

  // Replace the fields with the input elements
  nameField.replaceWith(nameInput);
  emailField.replaceWith(emailInput);
  phoneField.replaceWith(phoneInput);
  allergiesField.replaceWith(allergiesInput);
  medicationField.replaceWith(medicationInput);

  // Create the save button
  const saveButton = document.createElement('button');
  saveButton.innerHTML = '<i class="fa fa-save"></i> Save';
  saveButton.classList.add('save-button');
  medicalDetails.appendChild(saveButton);

  // Listen for clicks on the save button
  saveButton.addEventListener('click', () => {
    // Convert the input elements back to fields
    const newNameField = createField(nameInput, nameInput.value);
    const newEmailField = createField(emailInput, emailInput.value);
    const newPhoneField = createField(phoneInput, phoneInput.value);
    const newAllergiesField = createField(allergiesInput, allergiesInput.value);
    const newMedicationField = createField(medicationInput, medicationInput.value);

    // Replace the input elements with the fields
    nameInput.replaceWith(newNameField);
    emailInput.replaceWith(newEmailField);
    phoneInput.replaceWith(newPhoneField);
    allergiesInput.replaceWith(newAllergiesField);
    medicationInput.replaceWith(newMedicationField);

    // Remove the save button
    saveButton.remove();
  });
});

// Function to create an input field
function createInputField(field, type, value) {
  const input = document.createElement('input');
  input.type = type;
  input.value = value;
  input.classList.add('edit-input');
  field.replaceWith(input);
  return input;
}

// Function to create a field
function createField(input, value) {
  const field = document.createElement('p');
  field.textContent = value;
  input.replaceWith(field);
  return field;
}
