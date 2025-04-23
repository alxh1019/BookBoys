import logging

logger = logging.getLogger(__name__)
import pandas as pd
import sqlite3
import os
import streamlit as st
from streamlit_extras.app_logo import add_logo
import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
from modules.nav import SideBarLinks

DB_PATH = "/database-files/events.db"
SQL_INIT_FILE = "/database-files/sample_data.sql"

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('New Events Info')

# You can access the session state to make a more customized/personalized app experience
st.write(f"### Hi, {st.session_state['first_name']}.")

# Step 1: Only create the DB if it doesn't exist yet
if not os.path.exists(DB_PATH):
    with sqlite3.connect(DB_PATH) as conn:
        with open(SQL_SCRIPT, 'r') as f:
            conn.executescript(f.read())
        st.success("Database created from SQL file.")

# Step 2: Connect to DB and fetch data from your tables
with sqlite3.connect(DB_PATH) as conn:
    tables = pd.read_sql_query("SELECT name FROM sqlite_master WHERE type='table';", conn)
    st.write("### Tables in the Database")
    st.table(tables)

    # Example: show contents of a specific table
    if "events" in tables["name"].values:
        st.write("### Data from `events` table")
        df = pd.read_sql_query("SELECT * FROM events", conn)
        st.dataframe(df)
    else:
        st.warning("Table `events` not found in the database.")


'''
# get the countries from the world bank data
with st.echo(code_location='above'):
    countries: pd.DataFrame = wb.get_countries()

    st.dataframe(countries)

# the with statment shows the code for this block above it
with st.echo(code_location='above'):
    arr = np.random.normal(1, 1, size=100)
    test_plot, ax = plt.subplots()
    ax.hist(arr, bins=20)

    st.pyplot(test_plot)

with st.echo(code_location='above'):
    slim_countries = countries[countries['incomeLevel'] != 'Aggregates']
    data_crosstab = pd.crosstab(slim_countries['region'],
                                slim_countries['incomeLevel'],
                                margins=False)
    st.table(data_crosstab)
'''