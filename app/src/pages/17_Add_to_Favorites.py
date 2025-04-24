import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')
SideBarLinks()

st.title("Add a Book to Your Favorites")

name = st.text_input("Book Title")
genre = st.text_input("Genre")
book_id = st.text_input("Book ID")
author_id = st.text_input("Author ID")

if st.button("Add to Favorites", type="primary"):
    payload = {
        "Books_name": name,
        "Books_genre": genre,
        "Books_BookID": book_id,
        "Books_AuthorID": author_id
    }
    try:
        resp = requests.post("http://backend:5000/favorites", json=payload)
        if resp.status_code == 200:
            st.success("Book added to favorites!")
        else:
            st.error("Failed to add book.")
    except:
        st.error("API connection failed.")
