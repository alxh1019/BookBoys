import streamlit as st
import requests

BASE_URL = "http://localhost:8501"

st.title("Delete a Book Genre")

genre_to_delete = st.text_input("Enter the book genre to delete:")

if st.button("Delete Genre"):
    if genre_to_delete:
        try:
            response = requests.delete(f"{BASE_URL}/delete_book_genre", params={"genre": genre_to_delete})
            if response.status_code == 200:
                st.success("Book genre deleted successfully!")
            else:
                st.error(f"Failed to delete book genre. Status: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please enter a genre.")