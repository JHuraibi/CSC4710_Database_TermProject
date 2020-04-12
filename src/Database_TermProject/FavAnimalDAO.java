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

//------------------------------------------------------------------------------------------------------//
// Notes:                                                                                               //
//      - The size of the table columns that reference usernames (e.g. favBreedersUsername) must        //
//              match the size of corresponding column in the reference table.                          //
//              [EXAMPLE]: If in table Users username is set to "varchar(30), then in                   //
//                         table favBreeders favBreedersUsername must also be "varchar(30)"             //
//      - Deleting a tuple from the FavAnimals table effectively "deletes" the animal                   //
//          from the user's fav                                                                         //
//                                                                                                      //
//------------------------------------------------------------------------------------------------------//

@WebServlet("/FavAnimalDAO")
public class FavAnimalDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;                            // For java.io.Serializable
    private Connection connect = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public FavAnimalDAO() {
    }

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
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connect != null) connect.close();
    }


    protected void initializeTable() throws SQLException {

        String SQL_dropTable;
        String SQL_createTable;

        SQL_dropTable = "DROP TABLE IF EXISTS favAnimals";

        SQL_createTable = "CREATE TABLE IF NOT EXISTS favAnimals (" +
                "animalID INTEGER NOT NULL, " +
                "whoFavdAnimal varchar(30) NOT NULL, " +
                "PRIMARY KEY (animalID, whoFavdAnimal)," +
                "FOREIGN KEY (animalID) REFERENCES Animals(animalID) ON DELETE CASCADE," +
                "FOREIGN KEY (whoFavdAnimal) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE ); ";

        connect_func();                                                         // Ensure active connection
        statement = connect.createStatement();
        statement.executeUpdate("SET FOREIGN_KEY_CHECKS = 0");                  // Disable foreign checks to allow for table drop

        statement.executeUpdate(SQL_dropTable);                                 // Drop any preexisting FavAnimals table
        statement.executeUpdate(SQL_createTable);                               // Establish new FavAnimals table

        statement.executeUpdate("SET FOREIGN_KEY_CHECKS = 1");                  // Re-enable foreign key constraints

        closeAndDisconnectAll();
		System.out.println("FavAnimals: DAO and TABLE INITIALIZED");
    }


    public List<Animal> listAllFavAnimals(String whoFavdAnimal) throws SQLException {

        List<Animal> listFavAnimals;
        String SQL_getAnimals;
        Animal tempAnimal;

        listFavAnimals = new ArrayList<>();

        SQL_getAnimals = "SELECT * " +
						 "FROM favAnimals " +
						 "WHERE whoFavdAnimal = ?";

        connect_func();
		preparedStatement = (PreparedStatement) connect.prepareStatement(SQL_getAnimals);
        preparedStatement.setString(1, whoFavdAnimal);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            int id = resultSet.getInt("");
            String name = resultSet.getString("name");
            String species = resultSet.getString("species");
            String birthDate = resultSet.getString("birthDate");
            int adoptionPrice = resultSet.getInt("adoptionPrice");
            String ownerUsername = resultSet.getString("ownerUsername");

            tempAnimal = new Animal(id, name, species, birthDate, adoptionPrice, ownerUsername);

            listFavAnimals.add(tempAnimal);
        }

        closeAndDisconnectAll();
        return listFavAnimals;
    }


	public boolean insert(int animalID, String usernameWhoFavd) throws SQLException {

        String SQL_insertAnimal;
        boolean rowInserted;

        connect_func();

        SQL_insertAnimal = "INSERT " +
						   "INTO favAnimals(animalID, whoFavdAnimal) " +
						   "values (?, ?)";

        preparedStatement = (PreparedStatement) connect.prepareStatement(SQL_insertAnimal);
        preparedStatement.setInt(1, animalID);
        preparedStatement.setString(2, usernameWhoFavd);
        rowInserted = preparedStatement.executeUpdate() > 0;

        closeAndDisconnectAll();
        return rowInserted;
    }


    public boolean delete(int animalID) throws SQLException {

        boolean rowDeleted;
        String SQL_deleteAnimal;

        connect_func();

        SQL_deleteAnimal = "DELETE " +
						   "FROM favAnimals " +
						   "WHERE animalID = ?";         						// See: Notes

        preparedStatement = (PreparedStatement) connect.prepareStatement(SQL_deleteAnimal);
        preparedStatement.setInt(1, animalID);
        rowDeleted = preparedStatement.executeUpdate() > 0;

        closeAndDisconnectAll();
        return rowDeleted;
    }

}// END CLASS [ FavAnimalDAO ]
