package loginportal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PageLoader {
	public static ArrayList<String[]> DataLayout(){
		ArrayList<String[]> data = new ArrayList<String[]>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3310/ttproject","root","13579");
			String query = "SELECT * from restaurant";
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String[] temp = new String[3];
				temp[0] = rs.getString(2);
				temp[1] = rs.getString(5);
				temp[2] = rs.getString(6);
				data.add(temp);
			}
			return data;
		}
		catch(SQLException e) {
			System.out.print(e);
			return null;
		}
	}
	public static ArrayList<String[]> menu(String name){
		ArrayList<String[]> data = new ArrayList<String[]>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3310/ttproject","root","13579");
			String query = "SELECT R.res_name,R.res_address,R.rating,R.cuisine,M.food_item,M.description,M.price from restaurant R,menu M where R.res_id=M.res_id AND R.res_name=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, name);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String[] temp = new String[7];
				for(int i=0;i<7;i++)
					temp[i] = rs.getString(i+1);
				data.add(temp);
			}
			return data;
		}
		catch(SQLException e) {
			return null;
		}
	}
	public static String price(String prod) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3310/ttproject","root","13579");
			String query = "SELECT price from menu where food_item=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, prod);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch(SQLException e) {
			System.out.print(e);
			return null;
		}
	}
}
