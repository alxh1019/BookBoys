##################################################
# This is the main/entry-point file for the 
# sample application for your project
##################################################

# Set up basic logging infrastructure
import logging
logging.basicConfig(format='%(filename)s:%(lineno)s:%(levelname)s -- %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# import the main streamlit library as well
# as SideBarLinks function from src/modules folder
import streamlit as st
from modules.nav import SideBarLinks

# streamlit supports reguarl and wide layout (how the controls
# are organized/displayed on the screen).
st.set_page_config(layout = 'wide')

# If a user is at this page, we assume they are not 
# authenticated.  So we change the 'authenticated' value
# in the streamlit session_state to false. 
st.session_state['authenticated'] = False

# Use the SideBarLinks function from src/modules/nav.py to control
# the links displayed on the left-side panel. 
# IMPORTANT: ensure src/.streamlit/config.toml sets
# showSidebarNavigation = false in the [client] section
SideBarLinks(show_home=True)

# ***************************************************
#    The major content of this page
# ***************************************************

# set the title of the page and provide a simple prompt. 
logger.info("Loading the Home page of the app")
st.title('CS 3200 Sample Semester Project App')
st.write('\n\n')
st.write('### HI! As which user would you like to log in?')

if st.button('Act as Admin',
            type = 'primary',
            use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'admin'
    st.session_state['first_name'] = 'David'
    st.switch_page('pages/25_Admin_Home.py')

if st.button('Act as Librarian',
            type = 'primary',
            use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'librarian'
    st.session_state['first_name'] = 'Emily'
    st.switch_page('pages/05_Librarian_Home.py')

if st.button('Act as Donator',
             type = 'primary',
             use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'Donator'
    st.session_state['first_name'] = 'Kelly'
    st.switch_page('pages/20_Donator_Home.py')

if st.button('Act as Reader',
             type = 'primary',
             use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'Reader'
    st.session_state['first_name'] = 'John'
    st.switch_page('pages/14_John_Common_User.py')


