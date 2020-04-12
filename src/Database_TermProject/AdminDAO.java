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

@WebServlet("/AdminDAO")
public class AdminDAO extends HttpServlet {

	private static final long serialVersionUID = 1L;                            // For java.io.Serializable
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	public AdminDAO() {}

	protected void connect_func() throws SQLException {
		if (connect == null || connect.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}

			connect = (Connection) DriverManager
					.getConnection("jdbc:mysql://127.0.0.1:3306/TermProject?"
								   + "user=root&password=admin");
		}
	}


	private void closeAndDisconnectAll() throws SQLException {
		if (resultSet != null) resultSet.close();
		if (statement != null) statement.close();
		if (preparedStatement != null) preparedStatement.close();
		if (connect != null) connect.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


	public boolean validateAdmin(String username, String password) throws SQLException {

		String SQL_findUserMatch;
		boolean userLocated;
		boolean usernameRoot;

		connect_func();

		SQL_findUserMatch = "SELECT * " +
							"FROM users " +
							"WHERE username = ? AND password = ?";

		preparedStatement = connect.prepareStatement(SQL_findUserMatch);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		resultSet = preparedStatement.executeQuery();

		userLocated = resultSet.next(); // CHECK: This method proper?
		usernameRoot = username.equals("root");									// Lowercase 'r'
		System.out.println("ADMINDAO: " + username);

		// FOR TESTING
		if (userLocated && usernameRoot) {
			System.out.println("~ ADMIN ACCESS: ON ~");
		}
		else
			System.out.println("~ ADMIN ACCESS: OFF ~");

		closeAndDisconnectAll();
		return userLocated && usernameRoot;
	}


	public List<User> questionEight() throws SQLException {

 		List<User> listBreeders;
		String SQL_getUsers;
		User tempUser;

		listBreeders = new ArrayList<>();

		SQL_getUsers = "SELECT author " +
					   "FROM reviews " +
					   "WHERE NOT rating = 'cray-cray';";

		connect_func();

		statement = (Statement) connect.createStatement();
		resultSet = statement.executeQuery(SQL_getUsers);

		while (resultSet.next()) {
			String username = resultSet.getString("username");                  // Extract data from each table row (i.e. Each user)
			String password = resultSet.getString("password");
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String email = resultSet.getString("email");

			tempUser = new User(username, password, firstName, lastName, email);    // Intermediate temp User obj

			listBreeders.add(tempUser);                                        // Add the just-made temp User to the list
		}

		closeAndDisconnectAll();
		return  listBreeders;                                                   // Return the list of Users (can be empty)
	}


	public List<User> questionNine() throws SQLException {

 		List<User> listBreeders;
		String SQL_getUsers;
		User tempUser;

		 listBreeders = new ArrayList<>();
		SQL_getUsers = "SELECT author " +
					   "FROM Reviews " +
					   "WHERE rating = ALL(SELECT rating FROM Reviews WHERE rating = 'Cray') " +
					   "AND rating = ALL(SELECT rating FROM Reviews WHERE rating ='Cray-Cray');" ;

		connect_func();

		statement = (Statement) connect.createStatement();
		resultSet = statement.executeQuery(SQL_getUsers);

		while (resultSet.next()) {
			String username = resultSet.getString("username");                  // Extract data from each table row (i.e. Each user)
			String password = resultSet.getString("password");
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String email = resultSet.getString("email");

			tempUser = new User(username, password, firstName, lastName, email);    // Intermediate temp User obj

			 listBreeders.add(tempUser);                                            // Add the just-made temp User to the list
		}

		closeAndDisconnectAll();
		return  listBreeders;                                                       // Return the list of Users (can be empty)
	}

	public List<User> questionTen() throws SQLException {

 		List<User> listBreeders;
		String SQL_getUsers;
		User tempUser;

		 listBreeders = new ArrayList<>();
		SQL_getUsers = "SELECT owner " +
					   "FROM animals " +
					   "WHERE EXISTS (SELECT animalID FROM Reviews WHERE Reviews.animalID = Animals.animalID) " +
					   "AND (SELECT animalID FROM Reviews WHERE NOT rating = 'Cray-Cray');" ;

		connect_func();

		statement = (Statement) connect.createStatement();
		resultSet = statement.executeQuery(SQL_getUsers);

		while (resultSet.next()) {
			String username = resultSet.getString("username");                  // Extract data from each table row (i.e. Each user)
			String password = resultSet.getString("password");
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String email = resultSet.getString("email");

			tempUser = new User(username, password, firstName, lastName, email);    // Intermediate temp User obj

			 listBreeders.add(tempUser);                                            // Add the just-made temp User to the list
		}

		closeAndDisconnectAll();
		return  listBreeders;                                                       // Return the list of Users (can be empty)
	}


	// Users Never Posted
}
