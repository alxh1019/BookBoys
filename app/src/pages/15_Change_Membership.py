import logging
logger = logging.getLogger(__name__)

import streamlit as st
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')
SideBarLinks()

st.title("Update Membership Plan")

plan_id = st.text_input("Enter the Plan ID to update:")
new_duration = st.number_input("Enter the new Duration (in months)", min_value=1, step=1)
if st.button("Update Membership Plan"):
    if plan_id and new_duration:
        try:
            data = {
                "PlanID": plan_id,
                "Duration": new_duration
            }
            BASE_URL = "http://web-api:4000"
            response = requests.put(f"{BASE_URL}/membershipUpdate", json=data)

            if response.status_code == 200:
                st.success("Membership plan updated successfully!")
            else:
                st.error(f"Failed to update membership plan. Status: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please fill out all fields.")

