import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome the BookBoys Database!, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Change your membership plan',
             type='primary',
             use_container_width=True):
  st.switch_page('pages/15_Change_Membership.py')

if st.button("Add a Book to your Favorites",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/17_Add_to_Favorites.py')

if st.button('Delete a Book from your Favorites',
             type='primary',
             use_container_width=True):
  st.switch_page('pages/16_Remove_Favorite.py')