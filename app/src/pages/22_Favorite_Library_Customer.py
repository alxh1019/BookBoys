import streamlit as st
import requests
import datetime

st.title("Librarian's Favorite Customer")

st.markdown("Fill out the details below to add a favorite library member.")

fname = st.text_input("First Name")
mname = st.text_input("Middle Name")
lname = st.text_input("Last Name")
customer_id = st.text_input("Customer ID")
membership_date = st.date_input("Membership Date", value=datetime.date.today())

if st.button("Submit Favorite Customer"):
    if not all([fname, lname, customer_id, membership_date]):
        st.error("Please fill out all required fields.")
    else:
        data = {
            "FName": fname,
            "MName": mname,
            "LName": lname,
            "CustomerID": customer_id,
            "Membership_Date": str(membership_date)
        }

        try:
            response = requests.post("http://localhost:4000", json=data)

            if response.status_code == 201:
                st.success("Favorite Member of the library created successfully!")
            else:
                st.error(f"Failed to create favorite member. Status code: {response.status_code}")
        except Exception as e:
            st.error(f"Error connecting to server: {e}")