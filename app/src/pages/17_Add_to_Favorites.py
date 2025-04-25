import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks

st.title("Add a Favorite Book")
st.markdown("Fill out the details below to mark a book as a favorite.")

book_id = st.text_input("Book ID")
book_name = st.text_input("Book Title")
book_genre = st.text_input("Genre")
author_id = st.text_input("Author ID")

if st.button("Submit Favorite Book"):
    if not all([book_id, book_name, book_genre, author_id]):
        st.error("Please fill out all required fields.")
    else:
        data = {
            "Books_BookID": book_id,
            "Books_name": book_name,
            "Books_genre": book_genre,
            "Books_AuthorID": author_id
        }

        try:
            response = requests.post("http://web-api:4000/favorites", json=data)
            if response.status_code == 200:
                st.success("Favorite book added successfully!")
            else:
                st.error(f"Failed to add favorite. Status code: {response.status_code}")
        except Exception as e:
            st.error(f"Error connecting to server: {e}")
