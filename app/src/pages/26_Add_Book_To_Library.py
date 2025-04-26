import streamlit as st
import requests
import datetime

BASE_URL = "http://localhost:8501"
#BASE_URL = "http://localhost:4000"

st.title("Add a New Book To The Library")

with st.form("add_book_form"):
    book_id = st.text_input("Book ID")
    title = st.text_input("Title")
    genre = st.text_input("Genre")
    pages = st.text_input("Pages")
    author_id = st.text_input("Author ID")

    submitted = st.form_submit_button("Add Book")

    if submitted:
        if not all([book_id, title, genre, pages, author_id]):
            st.warning("Please fill out all fields.")
        else:
            try:
                payload = {
                    "id": book_id,
                    "title": title,
                    "genre": genre,
                    "pages": pages,
                    "author_id": author_id
                }
                response = requests.post(f"{BASE_URL}/addBook", json=payload)

                if response.status_code == 200:
                    st.success("New Book successfully added to the library!")
                else:
                    st.error(f"Failed to add book. Status code: {response.status_code}")
            except Exception as e:
                st.error(f"Error adding book: {e}")