---
layout: home
title: Student Home
description: Home Page
hide: true
---

## Imaads Page

- ### Here is my [Github](https://github.com/imaad08)

- ### Here is a little [about me](https://Imaad08.github.io/studentcsa/about)

- ### Here is a list of popular cities and their weather

- ### You can enter cities to see their weather

<br>

<style>

  .container {
    text-align: center;
    background-color: #2C3038; /* Slightly lighter background for the container */
    padding: 20px;
    border-radius: 20px;
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.3); /* Light shadow for better visibility */
    margin-top: 50px;
  }

  h1 {
    color: #E0E0E0; /* Light color for headings */
  }

  .search-container {
    margin: 20px 0;
    border-radius: 20px;
  }

  input[type="text"] {
    padding: 10px;
    border: 1px solid #555; /* Darker border color */
    border-radius: 20px;
    background-color: #333; /* Dark background for input */
    color: #E0E0E0; /* Light text color for input */
  }

  button {
    padding: 10px 20px;
    background-color: #007bff; /* Primary button color */
    color: #E0E0E0; /* Light text color on button */
    border: none;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s;
    outline: 3px solid white;
  }

  button:hover {
    background-color: #0056b3; /* Darker shade on hover */
  }

  table {
    width: 100%;
    border-collapse: collapse;
    color: #E0E0E0; /* Light text color for table */
  }

  th, td {
    padding: 10px;
    border: 1px solid #555; /* Darker border for table */
  }

  th {
    background-color: #333; /* Dark background for table headers */
  }

  tr:nth-child(even) {
    background-color: #2C3038; /* Alternate row color for better readability */
  }

  tr:hover {
    background-color: #3A3F48; /* Highlight row on hover */
  }
</style>

  <div class="weather-container">
    <input type="text" id="location" placeholder="Enter a city">
    <button onclick="fetchWeather()">Search</button>
    <div id="weather-data">
    </div>
  </div>
  <!-- Table to display top 10 cities' weather data -->
  <table id="top-cities-table" class="container">
    <thead>
      <tr>
        <th>Rank</th>
        <th>City</th>
        <th>Weather</th>
      </tr>
    </thead>
    <tbody>
      <!-- Data for top 10 cities will be inserted here dynamically -->
    </tbody>
  </table>

  <script>
// Function to fetch weather data when called
function fetchWeather() {
  // Get the input element for location from the HTML document
  var locationInput = document.getElementById("location");

  // Get the trimmed value of the location input
  var location = locationInput.value.trim();

  // Check if the location input is empty
  if (location === "") {
    // Display an alert if the input is empty and return from the function
    alert("Please enter a city.");
    return;
  }

  // OpenWeatherMap API Key for authentication
  var OpenWeatherMapAPIKey = "06ffac091aa8f9ef15e54c9209611dcd";

  // Construct the URL for the OpenWeatherMap API request using the location and API key
  var URL = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${OpenWeatherMapAPIKey}`;

  // Use the fetch API to make an HTTP request to the OpenWeatherMap API
  fetch(URL)
    .then(response => response.json()) // Parse the response as JSON
    .then(data => {
      // Check if the data includes sys information, indicating a valid response
      if (data.sys) {
        // Get the weather data container element from the HTML document
        var weatherContainer = document.getElementById("weather-data");

        // Calculate the temperature in Fahrenheit from the Kelvin value in the response
        var temperature = Math.round(((data.main.temp - 273.15) * (9 / 5)) + 32).toFixed(0);

        // Update the HTML content with weather information
        weatherContainer.innerHTML = `
          <br>
          <h2>Weather in ${data.name}, ${data.sys.country} looks like:</h2>
          <p>Temperature: ${temperature}°F, ${data.weather[0].description}</p>
          <p>Humidity is ${data.main.humidity}%</p>
        `;
      } else {
        // If sys information is not available in the response, log an error and show an alert
        console.error("Error fetching weather data: Country information not available.");
        alert('Please try retyping the city name');
      }
    })
    .catch(error => {
      // Handle any errors that occur during the fetch operation
      console.error("Error fetching weather data:", error);
    });
}

// Get the location input element again
var locationInput = document.getElementById("location");

// Add an event listener to the location input element to trigger fetchWeather() when Enter key is pressed
locationInput.addEventListener("keyup", function (event) {
  if (event.key === "Enter") {
    fetchWeather();
  }
});
function fetchWeatherForCity(cityName) {
  // Construct the URL for the OpenWeatherMap API request for the specified city
  var OpenWeatherMapAPIKey = "06ffac091aa8f9ef15e54c9209611dcd"; 
  var URL = `https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${OpenWeatherMapAPIKey}`;

  // Use the fetch API to make an HTTP request to the OpenWeatherMap API
  return fetch(URL)
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      if (data && data.main) {
        return data;
      } else {
        throw new Error("Weather data not available for city: " + cityName);
      }
    })
    .catch(error => {
      console.error("Error fetching weather data for city:", error);
      return null; // Return null for cities with errors
    });
}

// Function to fetch weather data for the top cities
function fetchWeatherForTopCities() {
  var topCities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "Austin"];

  Promise.all(topCities.map(city => fetchWeatherForCity(city)))
    .then(weatherDataArray => {
      var tableBody = document.querySelector("#top-cities-table tbody");
      tableBody.innerHTML = "";

      weatherDataArray.forEach((weatherData, index) => {
        if (weatherData) { // Check if weather data is available
          var temperature = Math.round(((weatherData.main.temp - 273.15) * (9 / 5)) + 32).toFixed(0);
          var row = `<tr>
                       <td>${index + 1}</td>
                       <td>${topCities[index]}</td>
                       <td>${temperature}°F, ${weatherData.weather[0].description}</td>
                     </tr>`;
          tableBody.innerHTML += row;
        }
      });
    })
    .catch(error => {
      console.error("Error fetching weather data for top cities:", error);
    });
}

// Call fetchWeatherForTopCities initially to populate the table
fetchWeatherForTopCities();
  </script>
