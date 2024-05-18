package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FeedbackDao {
	private static Connection connection=CreateConnection.createConnection();
	
	public static int addFeedback(FeedbackDto fDto) {
		String insertFeedbackQuery="insert into feedback values(?,?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(insertFeedbackQuery);
			pstmt.setInt(1, 0);
			pstmt.setString(2, fDto.getFeedbackerName());
			pstmt.setString(3, fDto.getFeedbackerEmail());
			pstmt.setString(4, fDto.getFeedbackMessage());
			
			int count=pstmt.executeUpdate();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
}
