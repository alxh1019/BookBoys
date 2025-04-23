import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Librarian, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('View Upcoming Library Events Info',
             type='primary',
             use_container_width=True):
  st.switch_page('pages/06_New_Events_Info.py')

if st.button('Remove Past Events',
             type='primary',
             use_container_width=True):
  st.switch_page('pages/07_Remove_Past_Events.py')

if st.button('Edit Upcoming Events Info',
           type='primary',
           use_container_width=True):
  st.switch_page('pages/08_Edit_Upcoming_Events.py')