#post (), put (done), delete (done), get (), /access a page ()

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
david = Blueprint('david', __name__)

# ------------------------------------------------------------
# Get the 5 most recent admin logins by name
@david.route('/getRecentAdminLogins')
def get_recent_admin_logins():
    query = '''
            SELECT Admin.FName, Admin.LName, Admin.Last_Login
            FROM Admin
            ORDER BY Last_Login DESC
            LIMIT 5
        '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# Route to get admins of BookBoys Database
@david.route('/getCustomerMember')
def get_all_admins():
    query = '''
                    SELECT Admin.FName, Admin.LName
                    FROM Admin
        '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Delete a customer by customerId
@david.route('/customer/<customer_id>', methods=['DELETE'])
def delete_customer(customer_id):
    current_app.logger.info(f'DELETE /customer/{customer_id} route')

    query = '''
            DELETE FROM Customer
            WHERE CustomerID = %s
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (customer_id,))
    db.get_db().commit()

    return f'Customer with customerId {customer_id} removed!', 200

#------------------------------------------------------------
# Update a book's status (e.g., In Library or Checked Out)
@david.route('/books/status', methods=['PUT'])
def update_book_status():
    current_app.logger.info('PUT /books/status route')

    book_info = request.json
    book_id = book_info['book_id']
    status = book_info['status']  # Expected values: 'In Library' or 'Checked Out'

    query = '''
            UPDATE Books
            SET Status = %s
            WHERE BookID = %s
            '''
    data = (status, book_id)
    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()

    return f"Book ID {book_id} status updated to '{status}'!", 200

#------------------------------------------------------------
# Add a book to the collection
@david.route('/books', methods=['POST'])
def add_books():
    current_app.logger.info('POST /books route')

    book_info = request.json
    book_id = book_info['BookID']
    genre = book_info['genre']
    title = book_info['title']
    pages = book_info['pages']

    query = '''
                INSERT INTO Books (book_id, genre, title, pages)
                VALUES (%s, %s, %s, %s, %s)
                '''

    data = (book_id, genre, title, pages)
    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()

    return 'New book created!', 201