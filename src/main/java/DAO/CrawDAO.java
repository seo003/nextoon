package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.CrawDTO;
import util.DatabaseUtil;

public class CrawDAO {
    Connection conn = DatabaseUtil.getConnection();
    private ResultSet rs;

    public void saveInfo(CrawDTO crawDTO) {
        String sql = "INSERT INTO craw VALUES(?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, crawDTO.getCrawTitle());
            pstmt.setString(2, crawDTO.getCrawAuthor());
            pstmt.setString(3, crawDTO.getCrawWeek());
            pstmt.setString(4, crawDTO.getCrawGenre());
            pstmt.setString(5, crawDTO.getCrawSummary());
            pstmt.setString(6, crawDTO.getCrawUrl());
                pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("데이터베이스 오류");
        }
    }
    public void resetInfo() {
        String sql = "DELETE FROM craw";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("데이터베이스 오류");
        }
    }
}
