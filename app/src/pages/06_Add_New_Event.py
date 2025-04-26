import streamlit as st
import requests
import datetime

BASE_URL = "http://localhost:8501"
#BASE_URL = "http://localhost:4000"

st.title("Add a New Event")

with st.form("add_event_form"):
    event_id = st.text_input("Event ID")
    title = st.text_input("Title")
    location = st.text_input("Location")
    date = st.date_input("Date", value=datetime.date.today())
    current_time = datetime.datetime.now().time().strftime("%H:%M")
    time = st.text_input("Time", value=current_time)
    max_capacity = st.text_input("Max Capacity")

    submitted = st.form_submit_button("Add Event")

    if submitted:
        if not all([event_id, title, location, date, time, max_capacity]):
            st.warning("Please fill out all fields.")
        else:
            try:
                payload = {
                    "id": event_id,
                    "title": title,
                    "location": location,
                    "date": str(date),
                    "time": time,
                    "max_capacity": max_capacity
                }
                response = requests.post(f"{BASE_URL}/addEvent", json=payload)

                if response.status_code == 200:
                    st.success("New Event successfully added to the library!")
                else:
                    st.error(f"Failed to add event. Status code: {response.status_code}")
            except Exception as e:
                st.error(f"Error adding event: {e}")