#Edit upcoming events code save

import streamlit as st
import requests
from datetime import datetime

# Your backend base URL
BASE_URL = "http://localhost:8501"

st.title("Edit Event Information")

# Step 1: Get a list of recent events for selection
try:
    response = requests.get(f"{BASE_URL}/mostRecentEvents")
    response.raise_for_status()
    events = response.json()

    if events:
        event_options = {
            f"{e['Title']} on {e['Date']} at {e['Location']}": e for e in events
        }
        selected_event_key = st.selectbox("Choose an event to edit", list(event_options.keys()))
        selected_event = event_options[selected_event_key]

        # Step 2: Show a form pre-filled with current values
        with st.form("edit_event_form"):
            title = st.text_input("Title", selected_event["Title"])
            location = st.text_input("Location", selected_event["Location"])
            date = st.date_input("Date", datetime.strptime(selected_event["Date"], "%Y-%m-%d").date())
            time = st.time_input("Time", datetime.strptime(selected_event["Time"], "%H:%M").time())
            max_capacity = st.number_input("Max Capacity", value=int(selected_event["Max_Capacity"]), step=1)

            submitted = st.form_submit_button("Update Event")

            if submitted:
                payload = {
                    "event_id": selected_event["EventID"],
                    "Title": title,
                    "Location": location,
                    "Date": date.strftime("%Y-%m-%d"),
                    "Time": time.strftime("%H:%M"),
                    "Max_Capacity": int(max_capacity)
                }

                update_response = requests.put(f"{BASE_URL}/events", json=payload)

                if update_response.status_code == 200:
                    st.success("Event updated successfully!")
                    st.experimental_rerun()
                else:
                    try:
                        error_detail = update_response.json().get('detail', 'No details provided')
                    except Exception:
                        error_detail = update_response.text
                    st.error(f"Failed to update event. Status: {update_response.status_code}. Details: {error_detail}")
    else:
        st.info("No events available to edit.")
except Exception as e:
    st.error(f"Error fetching events: {e}")


