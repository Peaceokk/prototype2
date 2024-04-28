<?php

// Function to fetch weather data from OpenWeatherMap API
function getWeatherData($city)
{
    $apiKey = '9f9c3f4af4250b8ae162dbdecfb6fb41';
    $url = "http://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}&units=metric";
    $response = file_get_contents($url);
    return json_decode($response, true);
}

// Function to store weather data in the database
function storeWeatherData($conn, $data)
{
    $name = $data['name'];
    $temperature = $data['main']['temp'];
    $humidity = $data['main']['humidity'];
    $wind_speed = $data['wind']['speed'];
    $pressure = $data['main']['pressure'];
    $stats = $data['weather'][0]['description'];
    $icon = $data['weather'][0]['icon'];
    $country = $data['sys']['country'];
    $timezone = $data['timezone'];
    $timestamp = date("Y-m-d H:i:s"); // Current timestamp

    $query = "INSERT INTO weatherdata (city_name, temperature, humidity, wind_speed, pressure, stats, icon, country, timezone, timestamp) 
              VALUES ('$name', '$temperature', '$humidity', '$wind_speed', '$pressure', '$stats', '$icon', '$country', '$timezone', '$timestamp')";
    $result = mysqli_query($conn, $query);
    if (!$result) {
        echo "Error: " . mysqli_error($conn);
    }
}

// Function to retrieve the latest weather data from the database for a given city
function getLatestWeatherData($conn, $city)
{
    $query = "SELECT * FROM weatherdata WHERE city_name = '$city' ORDER BY timestamp DESC LIMIT 1";
    $result = mysqli_query($conn, $query);
    if ($result && mysqli_num_rows($result) > 0) {
        return mysqli_fetch_assoc($result);
    } else {
        return false;
    }
}

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "weather";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if city name is provided
if (isset($_GET['city'])) {
    $city = $_GET['city']; // Get city name from the query parameters
} else {
    die("City name is required.");
}

// Check if data for this city exists in the database
$existingData = getLatestWeatherData($conn, $city);

if ($existingData) {
    // Data exists in the database, return it
    header('Content-Type: application/json');
    echo json_encode($existingData);
} else {
    // Data doesn't exist, fetch from API and store in the database
    $weatherData = getWeatherData($city);
    if ($weatherData) {
        storeWeatherData($conn, $weatherData);
        // Return the fetched data
        header('Content-Type: application/json');
        echo json_encode($weatherData);
    } else {
        echo "Failed to fetch data from the API.";
    }
}

// Close connection
mysqli_close($conn);
