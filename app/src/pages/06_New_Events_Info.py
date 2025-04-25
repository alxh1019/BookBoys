import streamlit as st
import requests

BASE_URL = "http://localhost:8501"

st.title("Add a New Event")

with st.form("event_form"):
    event_id = st.text_input("Event ID")
    title = st.text_input("Title")
    location = st.text_input("Location")
    date = st.text_input("Date")
    time = st.text_input("Time")
    max_capacity = st.text_input("Max Capacity")

    pages = st.number_input("Number of Pages", step=1, min_value=1)

    submitted = st.form_submit_button("Add Book")

    if submitted:
        if not all([event_id, title, location, date, time, max_capacity]):
            st.warning("Please fill out all fields.")
        else:
            try:
                payload = {
                    "id": event_id,
                    "title": title,
                    "location": location,
                    "date": date,
                    "time": time,
                    "max_capacity": max_capacity
                }
                response = requests.put(f"{BASE_URL}/updateBookStatus", json=payload)

                if response.status_code == 200:
                    st.success("New Event successfully added to the library!")
                else:
                    st.error(f"Failed to add event. Status code: {response.status_code}")
            except Exception as e:
                st.error(f"Error adding event: {e}")