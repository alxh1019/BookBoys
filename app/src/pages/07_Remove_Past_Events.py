import streamlit as st
import requests

BASE_URL = "http://localhost:8501"

st.title("Delete an Event")

st.subheader("Select an Event to Delete")

try:
    response = requests.get(f"{BASE_URL}/mostRecentEvents")
    response.raise_for_status()
    events = response.json()

    if events:
        event_options = {f"{event['Title']} on {event['Date']} at {event['Location']}": event['EventID'] for event in events}
        selected_event = st.selectbox("Choose an event to delete", list(event_options.keys()))

        if st.button("Delete Selected Event"):
            event_id = event_options[selected_event]
            delete_response = requests.delete(f"{BASE_URL}/events/{event_id}")

            if delete_response.status_code == 200:
                st.success("Event deleted successfully!")
                st.experimental_rerun()
            else:
                st.error(f"Failed to delete event. Status: {delete_response.status_code}")

    else:
        st.info("No events available to delete.")

except Exception as e:
    st.error(f"Could not fetch events: {e}")
