const cityName = document.querySelector(".search-box");

const displayCityName = document.querySelector(".city");
const displayTemp = document.querySelector(".temp");
const displayhumi = document.querySelector(".humidity");
const displaywinds = document.querySelector(".Wind");
const displaypressure = document.querySelector(".pressure");
const displaystatus = document.querySelector(".stats");
const displayicon = document.querySelector(".weather-img");
const displaydate = document.querySelector(".dateandtime #date");
const API_Key = "9f9c3f4af4250b8ae162dbdecfb6fb41";

async function fetchWeather(city_name = "Bolton") {
  try {
    const out = await fetch(
      `http://localhost/prototype2/connect.php?city=${city_name}`
    );

    if (out.status == 404) {
      alert("Invalid City Name");
    } else {
      const data = await out.json();
      console.log(data);
      displayCityName.innerHTML = `${data.city_name}, ${data.country}`;
      displayTemp.innerHTML = `${parseInt(data.temperature)}<span>°C</span>`;
      displayhumi.innerHTML = `${data.humidity}%`;
      displaywinds.innerHTML = `${parseInt(data.wind_speed)} m/s`;
      displaypressure.innerHTML = `${data.pressure} mpa`;

      displayicon.src = `https://openweathermap.org/img/wn/${data.icon}@2x.png`;

      let timestampOffset = parseInt(data.timezone);
      const timestamp = Math.floor(Date.now() / 1000) + timestampOffset;
      const date = new Date(timestamp * 1000);

      const formattedDate = date.toLocaleDateString("en-US", {
        day: "numeric",
        month: "long",
      });

      const formattedDay = date.toLocaleDateString("en-US", {
        weekday: "long",
      });

      const formattedTime = date.toLocaleTimeString("en-US", {
        hour: "numeric",
        minute: "numeric",
        timeZone: "UTC",
      });

      displaydate.innerHTML = `${formattedDay} | ${formattedDate} | ${formattedTime}`;
    }
  } catch (error) {
    console.log(error);
  }
}

window.onload = (event) => {
  event.preventDefault();
  fetchWeather();
};

document.querySelector("#searchinp").addEventListener("click", (event) => {
  event.preventDefault();
  const city_name = cityName.value.trim();
  if (city_name !== "") {
    fetchWeather(city_name);
  } else {
    alert("Please enter a city name");
  }
});
