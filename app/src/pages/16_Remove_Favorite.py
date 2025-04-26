import logging
logger = logging.getLogger(__name__)

import streamlit as st
import pandas as pd
import requests
from modules.nav import SideBarLinks

st.title("Delete a Favorite Book")

book_id_to_delete = st.text_input("Enter the Book ID to delete from favorites:")

if st.button("Delete Favorite"):
    if book_id_to_delete:
        try:
            BASE_URL = "http://web-api:4000"
            response = requests.delete(f"{BASE_URL}/removeFavorite/{book_id_to_delete}")
            if response.status_code == 200:
                st.success("Favorite book deleted successfully!")
            else:
                st.error(f"Failed to delete favorite book. Status: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please enter a Book ID.")
