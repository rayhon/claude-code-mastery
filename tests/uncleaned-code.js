// uncleaned-code.js
const API_KEY = "hardcoded-secret-key-123"; // This should be flagged

function fetchData() {
    console.log("Fetching data..."); // Debug statement - should be caught
    
    // TODO: Add error handling here
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            console.log(data); // Another debug statement
        });
}

// This is old code we don't need anymore
// function oldFunction() {
//     return "deprecated";
// }