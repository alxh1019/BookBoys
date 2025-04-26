'''
import streamlit as st
import requests

BASE_URL = "http://localhost:8501"

st.title("Delete a Book Genre")

genre_to_delete = st.text_input("Enter the book genre to delete:")

if st.button("Delete Genre"):
    if genre_to_delete:
        try:
            BASE_URL = "http://localhost:4000"
            response = requests.delete(f"{BASE_URL}/deleteBooks", params={"genre": genre_to_delete})
            if response.status_code == 200:
                st.success("Book genre deleted successfully!")
            else:
                st.error(f"Failed to delete book genre. Status: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please enter a genre.")
'''
# BREAK

import streamlit as st
import requests

BASE_URL = "http://localhost:8501"

st.title("Delete an Event")

event_to_delete = st.text_input("Enter the Event ID to delete:")

if st.button("Delete Event"):
    if event_to_delete:
        try:
            BASE_URL = "http://localhost:4000"
            response = requests.delete(f"{BASE_URL}/deleteEvent", params={"event_id": event_to_delete})
            if response.status_code == 200:
                st.success("Event deleted successfully!")
            else:
                st.error(f"Failed to delete event. Status: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please enter an event.")