#post (done), put (done), delete (done), get (done), /access a page (done)

#imports
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

# Create a new Blueprint object, which is a collection of
# routes.
emily = Blueprint('emily', __name__)

#------------------------------------------------------------------------
# Get the top 5 most recent (upcoming) events from the database
@events.route('/mostRecentEvents')
def get_most_recent_events():
    query = '''
            SELECT EventID,
                   Title,
                   Location, Date, Time, Max_Capacity
            FROM Events
            ORDER BY Date DESC
                LIMIT 5 \
            '''

    # Same process as handler above
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# Route to get a list of all books in the database.
@books.route('/allBooks', methods=['GET'])
def get_all_books():
    query = '''
            SELECT BookID,
                   title,
                   genre,
                   pages
            FROM Books
            '''

    # Same process as above
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Update customer info for customer with particular userID
#   Notice the manner of constructing the query.
@events.route('/events', methods=['PUT'])
def update_event_details():
    current_app.logger.info('PUT /events route')
    event_info = request.json
    event_id = event_info['event_id']
    title = event_info['Title']
    location = event_info['Location']
    date = event_info['Date']
    time = event_info['Time']
    max_capacity = event_info['Max_Capacity']

    query = ('UPDATE Events '
             'SET title = %s, '
             'location = %s, '
             'date = %s, '
             'time = %s, '
             'max_capacity = %s, ' # might be an integer!!! (change??)
             'where id = %s')
    data = (title, location, date, time, max_capacity, event_id)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'event updated!'

#------------------------------------------------------------
# Delete all events that have already passed (based on Date)
@events.route('/removePastEvents', methods=['DELETE'])
def remove_past_events():
    current_app.logger.info('DELETE /removePastEvents route')

    query = '''
            DELETE FROM Events
            WHERE Date < CURDATE()
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Past events removed!'

#------------------------------------------------------------
# Create a new event for the library
@events.route('/events', methods=['POST'])
def create_event():
    current_app.logger.info('POST /events route')

    event_info = request.json
    title = event_info['title']
    location = event_info['location']
    date = event_info['date']
    time = event_info['time']
    max_capacity = event_info['max_capacity']

    query = '''
            INSERT INTO Events (Title, Location, Date, Time, Max_Capacity)
            VALUES (%s, %s, %s, %s, %s)
            '''
    data = (title, location, date, time, max_capacity)
    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()

    return 'New event created!', 201

