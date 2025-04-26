import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks
import requests

st.set_page_config(layout = 'wide')

SideBarLinks()

st.title(f"Welcome Donator, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Adding a favorite library customer',
             type = 'primary',
             use_container_width = True):
  st.switch_page('pages/22_Favorite_Library_Customer.py')

if st.button('Delete a book genre within the library',
             type = 'primary',
             use_container_width=True):
  st.switch_page('pages/23_delete_book_genre.py')

if st.button('Update the books in the library',
             type = 'primary',
             use_container_width=True):
  st.switch_page('pages/24_update_library_books.py')