import streamlit as st
import requests

st.title("🌤️ Weather App (WeatherAPI.com)")
st.write("Type a city and press Enter.")

city = st.text_input("Enter city name")

api_key = "6102a2872d9b4c019df191531252007"  # replace with your actual key

if city:  # this block runs only if city is not empty
    url = f"http://api.weatherapi.com/v1/current.json?key={api_key}&q={city}"
    response = requests.get(url)
    data = response.json()

    if "error" not in data:
        location = data['location']
        current = data['current']

        st.success(f"Weather in {location['name']}, {location['country']}")
        st.metric("🌡 Temperature", f"{current['temp_c']} °C")
        st.write("🌥 Condition:", current['condition']['text'])
        st.write("💧 Humidity:", f"{current['humidity']}%")
        st.write("🌬 Wind Speed:", f"{current['wind_kph']} km/h")
        st.image("https:" + current['condition']['icon'], width=100)
    else:
        st.error("City not found. Try another one.")
