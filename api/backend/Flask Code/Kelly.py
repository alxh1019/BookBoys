#Post, put, delete

from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of
# routes.
library_donation_supplier_Kelly = Blueprint('Kelly', __name__)

#------------------------------------------------------------
# Get all the library donation guidelines to the library from the system
@library_donation_guidelines.route('/guidelines')
def book_donations_guidelines():
    query = '''
    SELECT WebsiteURL, Name, LastUpdated
    FROM Website
    ORDER BY LastUpdated DESC
    '''

    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
#------------------------------------------------------------
#Get all the books donated to the library from the system
@donated_books.route('/allBooks', methods=['GET'])
def user_donated_books():
    query = '''
            SELECT BookID,
                   title,
                   genre,
                   pages
            FROM Books
            '''

    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response
# ------------------------------------------------------------
