import streamlit as st
import requests

# Your backend base URL
BASE_URL = "http://localhost:8501"

st.title("Edit Event Information")

# Step 1: Get list of recent events for selection
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
            date = st.date_input("Date", selected_event["Date"])
            time = st.time_input("Time", selected_event["Time"])
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
                    st.error(f"Failed to update event. Status: {update_response.status_code}")
    else:
        st.info("No events available to edit.")
except Exception as e:
    st.error(f"Error fetching events: {e}")

''' #Leven's update code (semi-working)
import streamlit as st
import requests

BASE_URL = "http://localhost:8501"

st.title("Add a Donated Book to the Library")

with st.form("donated_book_form"):
    book_id = st.text_input("Book ID")
    title = st.text_input("Book Title")
    genre = st.text_input("Genre")
    pages = st.number_input("Number of Pages", step=1, min_value=1)

    submitted = st.form_submit_button("Add Book")

    if submitted:
        if not all([book_id, title, genre, pages]):
            st.warning("Please fill out all fields.")
        else:
            try:
                payload = {
                    "id": book_id,
                    "title": title,
                    "genre": genre,
                    "pages": int(pages)
                }
                response = requests.put(f"{BASE_URL}/updateBookStatus", json=payload)

                if response.status_code == 200:
                    st.success("Book successfully added to the library!")
                else:
                    st.error(f"Failed to add book. Status code: {response.status_code}")
            except Exception as e:
                st.error(f"Error adding book: {e}")
'''