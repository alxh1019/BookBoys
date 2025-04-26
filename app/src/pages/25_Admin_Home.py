import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Admin, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Add a Book to the Library',
             type='primary',
             use_container_width=True):
  st.switch_page('pages/26_Add_Book_To_Library.py')

if st.button('Remove a Customer From the Library',
             type='primary',
             use_container_width=True):
  st.switch_page('pages/27_Remove_Customer.py')

if st.button('Edit a Book\'s Status',
           type='primary',
           use_container_width=True):
  st.switch_page('pages/28_Edit_Book_Status.py')