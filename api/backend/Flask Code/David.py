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

#------------------------------------------------------------
# Delete a customer by customerId
@customers.route('/customer/<customer_id>', methods=['DELETE'])
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
@books.route('/books/status', methods=['PUT'])
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
