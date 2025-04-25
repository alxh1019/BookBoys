import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks


st.title("Add a Favorite Book")

st.markdown("Fill out the details below to mark a book as a favorite.")

customer_id = st.text_input("Customer ID")
book_id = st.text_input("Book ID")

if st.button("Submit Favorite Book"):
    if not all([customer_id, book_id]):
        st.error("Please fill out all required fields.")
    else:
        data = {
            "CustomerID": customer_id,
            "BookID": book_id
        }

        try:
            response = requests.post("http://127.0.0.1:5000/favorites", json=data)
            if response.status_code == 201:
                st.success("Favorite book created successfully!")
            else:
                st.error(f"Failed to create favorite book. Status code: {response.status_code}")
        except Exception as e:
            st.error(f"Error connecting to server: {e}")
