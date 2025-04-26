import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')
SideBarLinks()

st.title("Browse Books by Genre")

customer_id = st.session_state.get("user_id", "1")
genres = []

try:
    resp = requests.get(f"http://backend:5000/customerInterests/{customer_id}")
    genres = [item['Genre'] for item in resp.json()]
except:
    st.warning("Could not fetch genres from server.")

if genres:
    selected_genre = st.selectbox("Choose a genre:", genres)
    st.write(f"You selected **{selected_genre}**")
else:
    st.write("No genres found.")
