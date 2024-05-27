'use strict';


document.addEventListener('DOMContentLoaded', () => {
    const submitBtn = document.querySelector('button[type="submit"]');
    const username = document.querySelector('#username');
    const email = document.querySelector('#email');

    const validateForm = () => {
        if (username.value.trim() === '' || email.value.trim() === '') {
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    }
    validateForm();

    username.addEventListener('input', validateForm);
    email.addEventListener('input', validateForm);
});