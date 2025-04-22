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
kelly = Blueprint('Kelly', __name__)

#------------------------------------------------------------
# Get all the library donation guidelines to the library from the system
@books.route('/guidelines')
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
@books.route('/allBooks', methods=['GET'])
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
# Update library book info for books donated to the library
@books.route('/updateBookStatus', methods = ['PUT'])
def update_library_books():
    current_app.logger.info('PUT /book route')
    book_info = request.json
    book_id = book_info['id']
    title = book_info['title']
    genre = book_info['genre']
    pages = book_info['pages']
    query = '''
                INSERT INTO Books (book_id, title, genre, pages)
                VALUES (%s, %s, %s, %s, %s)
                '''
    data = (book_id, title, genre, pages)
    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()
    return 'New book added to the library!'
#------------------------------------------------------------------
#Delete the book genre
@books.route('/deleteBooks', methods = ['DELETE'])
def delete_book_genre():
    current_app.logger.info('DELETE /removeBooks route')
    query = '''
    DELETE FROM Books
    WHERE Genre = {genre}'''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Old Book Genre Deleted!'
#-----------------------------------------------------------------------
#Librarian's favorite customer
@book.route('/favoriteCustomer', methods = ['POST'])
def favorite_customer():
    current_app.logger.info('POST /events route')

    customer_fav = request.json
    FName = customer_fav['FName']
    MName = customer_fav['MName']
    LName =customer_fav['LName']
    CustomerID = customer_fav['CustomerID']
    Membership_Date = customer_fav['Membership_Date']
    query = '''
               INSERT INTO Events (FName, MName, LName, CustomerID, Membership_Date)
               VALUES (%s, %s, %s, %s, %s)
               '''
    data = (FName, MName, LName, CustomerID, Membership_Date)
    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()

    return 'Favorite Member of the library created', 201