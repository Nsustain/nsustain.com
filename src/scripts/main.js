// Hello world.
const anElement = document.querySelector('h1');
anElement.textContent = 'An h1 element with JavaScript.';

// Example of event handlers.
let myHeading = document.querySelector('h1');
myHeading.addEventListener('click', function() {
    alert('You clicked an h1 element!');
});

// The above function is called an anonymous function
// because it doesn't have a name. Plus, here's a shortcut
// for anonymous functions: () = >
myHeading.addEventListener('click', () => {

  // Calling setUserName()
  if(!localStorage.getItem('name')) {
    setUserName();
  } else {
    let storedName = localStorage.getItem('name');
    myHeading.textContent = 'Hello! ' + storedName;
  }

});

// --------------------------------------------------
// A function for prompting for user name.
// --------------------------------------------------
let myButton = document.querySelector('button');
function setUserName() {

  let myName = prompt('Enter your user name.');

  // The API localStorage stores myName in the browser.
  localStorage.setItem('name', myName);
  myHeading.textContent = 'Hello, ' + myName;

}


