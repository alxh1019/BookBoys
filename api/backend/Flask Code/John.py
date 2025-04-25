from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

#------------------------------------------------------------
# Create a new object for John, which is a collection of routes.
john = Blueprint('John', __name__)

# ------------------------------------------------------------
# Get the top 5 most popular books based on favorites count
@john.route('/mostPopularBooks')
def get_most_popular_books():
    query = '''
            SELECT Books.BookID, 
                   Books.Title, 
                   Books.Genre, 
                   COUNT(Favorites.BookID) AS FavoriteCount
            FROM Books
            JOIN Favorites ON Books.BookID = Favorites.BookID
            GROUP BY Books.BookID
            ORDER BY FavoriteCount DESC
            LIMIT 5
            '''

    cursor = db.get_db().cursor()
    cursor.execute(query)
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Get all genres of books available, package them, and return them to John for selection
@john.route('/customerInterests/<CustomerID>', methods=['GET'])
def get_genre_of_interest(CustomerID):
    query = '''
            SELECT Genre
            FROM Books
            WHERE CustomerID = %s
    '''

    cursor = db.get_db().cursor()
    cursor.execute(query, (CustomerID,))
    theData = cursor.fetchall()

    response = make_response(jsonify(theData))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Add books that John enjoyed so he can reference back to this list
@john.route('/favorites', methods=['POST'])
def add_to_favorite_list():
   the_data = request.json
   current_app.logger.info(the_data)

   name = the_data['Books_name']
   genre = the_data['Books_genre']
   bookID = the_data['Books_BookID']
   authorID = the_data['Books_AuthorID']

   query = f'''
           INSERT INTO Favorites (product_name,
                                 genre,
                                 bookID,
                                 authorID)
           VALUES ('{name}', '{genre}', '{str(bookID)}', {str(authorID)})
       '''

   current_app.logger.info(query)

   cursor = db.get_db().cursor()
   cursor.execute(query)
   db.get_db().commit()

   response = make_response("Successfully added product")
   response.status_code = 200
   return response

# ------------------------------------------------------------
# Update a John's membership plan
@john.route('/membershipUpdate', methods=['PUT'])
def update_membership():
    current_app.logger.info('PUT /membershipUpdate route')
    membership_info = request.json

    planID = membership_info['PlanID']
    fee = membership_info['Fee']
    duration = membership_info['Duration']

    query = '''
        UPDATE MembershipPlan
        SET fee = %s,
            duration = %s
        WHERE PlanID = %s
    '''
    data = (fee, duration, planID)

    cursor = db.get_db().cursor()
    cursor.execute(query, data)
    db.get_db().commit()
    return 'Membership updated!'


# ------------------------------------------------------------
# Delete a favorite book from John's list by BookID
@john.route('/removeFavorite/<bookID>', methods=['DELETE'])
def remove_favorite(bookID):
    current_app.logger.info('DELETE /removeFavorite/{bookID} route')

    query = f'''
            DELETE FROM Favorites
            WHERE BookID = {bookID}
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Favorite book removed!'