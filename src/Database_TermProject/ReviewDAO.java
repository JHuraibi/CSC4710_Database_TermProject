package Database_TermProject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// !! CRITICAL: Update note below if the Reviews table ON CASCADE.. gets changed
//------------------------------------------------------------------------------------------------------//
// Notes:                                                                                               //
//      - The longest "rating" (ReviewForm.jsp) is "Totes Adorbs" @ 12 chars long  						//
//      - Attribute "comments" size needs to match the maxlength set for <textarea> of ReviewForm.jsp   //
//		- We mention in our Project-Wide notes that the Reviews table is a good example of the 			//
//			ON DELETE CASCADE and ON UPDATE CASCADE. This is because our Reviews table is set so that	//
//			when a user is deleted, the reviews they created remain. Only when the animal is 			//
//			deleted (adopted) will the review in question be deleted as well.							//
//                                                                                                      //
//------------------------------------------------------------------------------------------------------//

@WebServlet("/ReviewDAO")
public class ReviewDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;                            // For java.io.Serializable
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	

	public ReviewDAO() {}

    protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }

            connect = (Connection) DriverManager
                    .getConnection("jdbc:mysql://127.0.0.1:3306/TermProject?"
                            + "user=root&password=admin");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    private void closeAndDisconnectAll() throws SQLException {
        if (resultSet != null)          resultSet.close();
        if (statement != null)          statement.close();
        if (preparedStatement != null)  preparedStatement.close();
        if (connect != null)            connect.close();
    }


	protected void initializeTable() throws SQLException {

        String SQL_dropTable;
        String SQL_tableReviews;
        String SQL_populateTable;

		SQL_dropTable = "DROP TABLE IF EXISTS reviews";

		SQL_tableReviews = "CREATE TABLE IF NOT EXISTS reviews (" +
						   			"reviewID INTEGER NOT NULL AUTO_INCREMENT, " +
                                    "animalID INTEGER NOT NULL, " +
                                    "rating varchar(12)," +
                                    "comments varchar(140)," +
                                    "author varchar(30) NOT NULL," +
                                    "PRIMARY KEY (reviewID)," +
                                    "FOREIGN KEY (animalID) REFERENCES Animals(animalID) ON DELETE CASCADE ON UPDATE CASCADE," +
                                    "FOREIGN KEY (author) REFERENCES Users(username) ON UPDATE CASCADE ); ";


		SQL_populateTable = "INSERT INTO reviews (animalID, rating, comments, author) values " +
					"(1, 'Adorbs', 			'14/10 would boop again!', 										'user_2'), " +
					"(7, 'Adorbs', 			'Its a Pangolin, what else is there to say?', 					'user_6'), " +
					"(8, 'Cray-Cray', 		'Just out of prison, but great otherwise!', 					'user_2'), " +
					"(10, 'Adorbs', 		'Opt for the extended warranty instead of the life insurance', 	'user_9'), " +
					"(1, 'Adorbs', 			'14/10 would boop again!', 										'user_2'), " +
					"(11, 'Cray', 			'Its eyes are kinda...All glory to the hypnotoad', 				'user_1'), " +
					"(11, 'Totes Adorbs', 	'All glory to the hypnotoad', 									'user_2'), " +
					"(11, 'Totes Adorbs', 	'All glory to the hypnotoad', 									'user_4'), " +
					"(11, 'Totes Adorbs', 	'All glory to the hypnotoad', 									'user_5'), " +
					"(11, 'Totes Adorbs', 	'All glory to the hypnotoad', 									'root'), " +
					"(2, 'Cray-Cray',		'14/10 would boop again!', 										'user_1');" ;


		connect_func();											                // Ensure active connection
		statement =  (Statement) connect.createStatement();
        statement.executeUpdate("SET FOREIGN_KEY_CHECKS = 0");                  // Disable foreign key constraints (req'd to drop tables w/ references)

        statement = connect.createStatement();                                  // Create the statement
		statement.executeUpdate(SQL_dropTable);                                 // Drop any preexisting Reviews table
		statement.executeUpdate(SQL_tableReviews);                              // Establish new Reviews table
		statement.executeUpdate(SQL_populateTable);                       		// Populate Table w/ Predefined initial values

        statement.executeUpdate("SET FOREIGN_KEY_CHECKS = 1");                  // Re-enable foreign key constraints

        closeAndDisconnectAll();
		System.out.println("Reviews: DAO and TABLE INITIALIZED");
	}

	
	public boolean insert(Review newReview) throws SQLException {

	    String SQL_insertReview;
        boolean rowInserted;

	    connect_func();

        SQL_insertReview = "INSERT " +
						   "INTO reviews(animalID, rating, comments, author) " +
						   "values (?, ?, ?, ?)";

	    preparedStatement = (PreparedStatement) connect.prepareStatement(SQL_insertReview);
		preparedStatement.setInt(1, newReview.animalID);
		preparedStatement.setString(2, newReview.rating);
		preparedStatement.setString(3, newReview.comments);
		preparedStatement.setString(4, newReview.author);
		rowInserted = preparedStatement.executeUpdate() > 0;

		if (rowInserted){
			System.out.println("REVIEW ADDED");
		}

        closeAndDisconnectAll();
		return rowInserted;
	}


	public List<Review> getAllReviewsForAnimal(int animalID) throws SQLException {

        List<Review> listReviews;
		String SQL_selectReview;
        Review tempReview;

        listReviews = new ArrayList<>();

		SQL_selectReview = "SELECT * " +
						   "FROM reviews " +
						   "WHERE animalID = ?";

		connect_func();

		preparedStatement = (PreparedStatement) connect.prepareStatement(SQL_selectReview);
		preparedStatement.setInt(1, animalID);
		
		resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next())
		{
				   animalID = resultSet.getInt("animalID");                           // Reusing "animalID", line left for reading
            String rating = resultSet.getString("rating");
			String comments = resultSet.getString("comments");
			String author = resultSet.getString("author");

            tempReview = new Review(animalID, rating, comments, author);
            listReviews.add(tempReview);
		}

        closeAndDisconnectAll();
		return listReviews;
	}


	public boolean deleteReviewsByAnimal(int animalID) throws SQLException {

        String SQL_deleteReview;
        boolean rowsDeleted;


        SQL_deleteReview = "DELETE " +
						   "FROM reviews " +
						   "WHERE aniamlID = ?";

        connect_func();
        preparedStatement = (PreparedStatement) connect.prepareStatement(SQL_deleteReview);
        preparedStatement.setInt(1, animalID);
        rowsDeleted = preparedStatement.executeUpdate() > 0;

        closeAndDisconnectAll();
        return rowsDeleted;
    }

}// END CLASS [ ReviewDAO ]
