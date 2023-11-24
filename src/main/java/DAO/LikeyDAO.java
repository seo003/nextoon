package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class LikeyDAO {
	Connection conn = DatabaseUtil.getConnection();

	public int like(String userId, String bbsId, String UserIp) {
		String SQL = "INSERT INTO likey VALUES (?, ?, ?)";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setString(2, bbsId);
			pstmt.setString(3, UserIp);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
