package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.PreparableStatement;
import com.mysql.cj.xdevapi.Result;

public class UserDao extends CreateConnection{
	private static Connection connection=CreateConnection.createConnection();
	
	public static boolean createUser(User u) {
		
		String createUserQuery="insert into user values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=connection.prepareStatement(createUserQuery);
			pstmt.setInt(1, 0);
			pstmt.setString(2, u.getFirstName());
			pstmt.setString(3, u.getLastName());
			pstmt.setString(4, u.getEmailAddress());
			pstmt.setString(5, u.getPassword());
			pstmt.setString(6, u.getContact());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
		}
		
		return true;
	}

	public static boolean authenticateUser(User u) {
		String userDataQuery="select user_email_address,user_password from user where user_email_address=?";
		try {
			PreparedStatement pstmt=connection.prepareStatement(userDataQuery);
			pstmt.setString(1, u.getEmailAddress());
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				if(u.getEmailAddress().equals(rs.getString(1)) && u.getPassword().equals(rs.getString(2))) {
					return true;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
