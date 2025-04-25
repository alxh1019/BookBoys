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
                BASE_URL = "http://localhost:8501"
                response = requests.put(f"{BASE_URL}/update_library_books", json=payload)

                if response.status_code == 200:
                    st.success("Book successfully added to the library!")
                else:
                    st.error(f"Failed to add book. Status code: {response.status_code}")
            except Exception as e:
                st.error(f"Error adding book: {e}")