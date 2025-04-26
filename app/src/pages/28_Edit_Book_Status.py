import streamlit as st
import requests

st.title("Update Book Status")

book_id = st.text_input("Enter Book ID")
status = st.selectbox("Select Book Status", ["In Library", "Checked Out"])

if st.button("Update Status"):
    if book_id and status:
        payload = {
            "book_id": book_id,
            "status": status
        }
        try:
            BASE_URL = "http://localhost:4000"
            response = requests.put(f"{BASE_URL}/david/books/status", json=payload)

            if response.status_code == 200:
                st.success(response.text)
            else:
                st.error(f"Failed to update status. Status code: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please enter the Book ID and select a status.")