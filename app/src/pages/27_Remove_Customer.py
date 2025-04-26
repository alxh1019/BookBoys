import streamlit as st
import requests

BASE_URL = "http://web-api:4000"

st.title("Delete a Customer")

customer_id_to_delete = st.text_input("Enter the Customer ID to delete:")

if st.button("Delete Customer"):
    if customer_id_to_delete:
        try:
            response = requests.delete(f"{BASE_URL}/deleteCustomer", params={"customer_id": customer_id_to_delete})
            if response.status_code == 200:
                st.success("Customer deleted successfully!")
            else:
                st.error(f"Failed to delete customer. Status: {response.status_code}")
        except Exception as e:
            st.error(f"Error occurred: {e}")
    else:
        st.warning("Please enter a Customer ID.")
