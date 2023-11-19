package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class LikeyDAO {
	Connection conn = DatabaseUtil.getConnection();

	public int like(String UserID, String bbsID, String UserIP) {
		String SQL = "INSERT INTO likey VALUES (?, ?, ?)";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UserID);
			pstmt.setString(2, bbsID);
			pstmt.setString(3, UserIP);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
