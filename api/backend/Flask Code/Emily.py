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

@emily.route('/mostRecentEvents')
def get_most_recent_events():
    
    query = 
            SELECT EventID,
                   Title,
                   Location, Date, Time, Max_Capacity
            FROM Events
            ORDER BY Date DESC
                LIMIT 5 

    # Same process as handler above
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# Route to get a list of all books in the database.

@emily.route('/allBooks', methods=['GET'])
def get_all_books():
    query =
            SELECT BookID,
                   title,
                   genre,
                   pages
            FROM Books

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

@emily.route('/events', methods=['PUT'])
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

#Remove a specific event by ID (e.g. after the event's date
#has passed
@emily.route('/events/<int:event_id>', methods=['DELETE'])
def delete_event(event_id):
    query = "DELETE FROM Events WHERE EventID = %s"
    cursor = db.get_db().cursor()
    cursor.execute(query, (event_id,))
    db.get_db().commit()
    return 'Event deleted!', 200

#------------------------------------------------------------
# Create a new event for the library
@emily.route('/addEvent', methods=['POST'])
    def create_event():
        current_app.logger.info('POST /events route')

        event_info = request.json
        event_id = event_info['event_id']
        title = event_info['title']
        location = event_info['location']
        date = event_info['date']
        time = event_info['time']
        max_capacity = event_info['max_capacity']

        query =
            INSERT INTO Events (event_id, title, location, date, time, max_capacity)
            VALUES (%s, %s, %s, %s, %s, %s)

        data = (title, location, date, time, max_capacity)
        cursor = db.get_db().cursor()
        cursor.execute(query, data)
        db.get_db().commit()

        return jsonify({"message": "Event added successfully!"}), 200
