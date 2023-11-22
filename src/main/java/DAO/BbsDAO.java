package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BbsDTO;
import util.DatabaseUtil;

public class BbsDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;
	private PreparedStatement pstmt;

	// 작성 일자
	public String getDate() {
		String sql = "select now()";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	// 게시글 번호 부여
	public int getNext() {
		// 현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구함
		String sql = "SELECT bbsId FROM bbs ORDER BY bbsId DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 글쓰기
	public int write(String userId, String bbsTitle, String bbsContent) {
		String sql = "INSERT INTO bbs (userId, bbsTitle, bbsDate, bbsContent) VALUES(?, ?, ?, ?)";
		try {
//			System.out.println("userId: " + userId);
//			System.out.println("bbsTitle: " + bbsTitle);
//			System.out.println("date: " + getDate());
//			System.out.println("bbsContent: " + bbsContent);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);	
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, getDate());
			pstmt.setString(4, bbsContent);
			//여기서 왜 catch됨 몰?루
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 게시글 리스트 메소드
	public ArrayList<BbsDTO> getList(int pageNumber) {
		String sql = "SELECT * FROM bbs WHERE bbsId < ? and bbsAvailable = 1 ORDER BY bbsId DESC LIMIT 10";

		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BbsDTO bbs = new BbsDTO();
				bbs.setBbsId(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setLikeCount(rs.getInt(7));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 페이징처리 메소드
	public boolean nextPage(int pageNumber) {
		String sql = "SELECT * FROM bbs WHERE bbsId < ? and bbsAvailable = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 게시글 내용 보는 메소드
	public BbsDTO getBbs(int bbsId) {
		String sql = "SELECT * FROM bbs WHERE bbsId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BbsDTO bbs = new BbsDTO();
				bbs.setBbsId(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	// 게시글 수정 메소드
	public int update(int bbsId, String bbsTitle, String bbsContent) {
		String sql = "UPDATE bbs SET bbsTitle = ?, bbsContent = ? WHERE bbsId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시글 삭제 메소드
	public int delete(int bbsId) {
		String sql = "UPDATE bbs SET bbsAvailable = 0 WHERE bbsId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시글 좋아요 메소드
	public int like(String bbsId) {
		String sql = "UPDATE bbs SET likeCount = likeCount + 1 WHERE bbsId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
