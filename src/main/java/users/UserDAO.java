package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DatabaseUtil;
import java.sql.ResultSet;

public class UserDAO {
	Connection conn = DatabaseUtil.getConnection();

	public int join(String userId, String userName, String userPw, String userPhone, String userEmail) {
		String SQL = "INSERT INTO users VALUES (?,?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userPw);
			pstmt.setString(4, userPhone);
			pstmt.setString(5, userEmail);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1;
	}

	private PreparedStatement pstmt;
	private ResultSet rs;

	public int login(String userId, String userPw) {
		String sql = "SELECT userPW FROM users WHERE userId = ?";

		try {
			pstmt = conn.prepareStatement(sql); // mysql db 연결

			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userPw)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 틀림

			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 오류

	}
}
