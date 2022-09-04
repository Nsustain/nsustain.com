/*
 * This script is for me to remember
 * the basics of JavaScript.
 *
 * This is based on the following tutorial:
 * https://developer.mozilla.org/en-US/docs/Learn/\
 * Getting_started_with_the_web/JavaScript_basics
 */ // Example of setting textContent.
let h1 = document.querySelector("h1");
h1.textContent = "An h1 element with JavaScript.";
// Example of event handlers.
// Execute alert(...) when clicked.
h1.addEventListener("click", function() {
    alert("You clicked an h1 element!");
});
// Example of using the API localStorage
// to store userName.
let userName;
let h2 = document.querySelector("h2");
TEXT_h2 = "localStorage | userName: ";
let myButton = document.querySelector("button");
myButton.onclick = function() {
    promptForUserName();
};
// --------------------------------------------------
// A function for using the API local Stroage
// to store userName.
// --------------------------------------------------
function promptForUserName() {
    userName = prompt("Enter your user name.");
    // The API localStorage stores userName in the browser.
    localStorage.setItem("userName", userName);
    h2.textContent = TEXT_h2 + userName;
    // Example of using localStorage.getItem(...)
    if (localStorage.getItem("userName").toLowerCase() === "soobin rho") h2.textContent = TEXT_h2 + userName.toUpperCase();
}

//# sourceMappingURL=index.06b7e553.js.map
