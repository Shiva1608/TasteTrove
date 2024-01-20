package loginportal;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class Dbconnect 
{
	static Connection con = null;
	
	public Dbconnect() throws SQLException, ClassNotFoundException
	
	{
		 con = DriverManager.getConnection("jdbc:mysql://localhost:3310/ttproject","root","13579");
		
	}
	public String login(String email,String pass) throws NoSuchAlgorithmException
	{
		try {
		String query3 = "select email, password from registered_users where email=?";
		PreparedStatement stmt2 = con.prepareStatement(query3);
		stmt2.setString(1,email);
		ResultSet rs = stmt2.executeQuery();
		if(rs.next())
		{
		
			if(rs.getString(2).equals(Encryption.encrypt(pass))) 
				return null;
			else 
				return "Password incorrect!";
	
		}
		else
			return "Email doesn't exist!";
		}
		catch(SQLException e) {
			return "Error in login!";
		}
	}
		
		
	public String sign_up(String name,String email, String pass) throws NoSuchAlgorithmException
	{
		try {
			String query1 = "insert into registered_users values(?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query1);
			stmt.setString(1,name);
			stmt.setString(2, email);
			stmt.setString(3,Encryption.encrypt(pass));
			stmt.execute();
			return null;
		}
		catch(SQLIntegrityConstraintViolationException e)
		{
			return "Email already registered!";
		} catch (SQLException e) {
			return "Error in signup!";
		}
	}
	public String reset(String email,String pass) {
		try {
		String query3 = "select email,password from registered_users where email=?";
		String query2 = "update registered_users set password=? where email=?";
		PreparedStatement stmt4 = con.prepareStatement(query3);
		stmt4.setString(1, email);
		ResultSet rs = stmt4.executeQuery();
		if(rs.next()) {
			if(rs.getString(2).equals(Encryption.encrypt(pass)))
				return "Use a password you havent used previously!";
			else {
				PreparedStatement stmt1 = con.prepareStatement(query2);
				stmt1.setString(1, Encryption.encrypt(pass));
				stmt1.setString(2, email);
				stmt1.execute();
				return null;
			}
		}
		else
			return "An error occured!";
		} catch (SQLException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			return "An Error Occured";
		}
		
	}
	public String email_check(String email) {
		try {
			String query3 = "select email from registered_users where email=?";
			PreparedStatement stmt2 = con.prepareStatement(query3);
			stmt2.setString(1, email);
			ResultSet rs = stmt2.executeQuery();
			if(rs.next())
				return null;
			else
				return "Email not registered!";
		}
		catch(SQLException e) {
			return "Error in reset!";
		}
	}
}
