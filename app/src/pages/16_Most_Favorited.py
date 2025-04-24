import logging
logger = logging.getLogger(__name__)

import streamlit as st
import pandas as pd
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')
SideBarLinks()

st.title("Most Favorited Books")

try:
    resp = requests.get("http://backend:5000/mostPopularBooks")
    data = resp.json()
    df = pd.DataFrame(data, columns=["BookID", "Title", "Genre", "FavoriteCount"])
    st.dataframe(df, use_container_width=True)
except:
    st.error("Unable to retrieve data from server.")
