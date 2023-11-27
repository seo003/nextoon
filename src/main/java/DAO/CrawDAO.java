package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BbsDTO;
import DTO.CrawDTO;
import util.DatabaseUtil;

public class CrawDAO {
    Connection conn = DatabaseUtil.getConnection();
    private ResultSet rs;

    public void saveInfo(CrawDTO crawDTO) {
        String sql = "INSERT INTO craw VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, crawDTO.getCrawTitle());
            pstmt.setString(2, crawDTO.getCrawAuthor());
            pstmt.setString(3, crawDTO.getCrawWeek());
            pstmt.setString(4, crawDTO.getCrawGenre());
            pstmt.setString(5, crawDTO.getCrawSummary());
            pstmt.setString(6, crawDTO.getCrawUrl());
            pstmt.setString(7, crawDTO.getCrawImage());
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

    public ArrayList<CrawDTO> recommendInfo(String genre) {
        String sql = "SELECT * FROM craw WHERE crawGenre LIKE ?";
        ArrayList<CrawDTO> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + genre + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CrawDTO crawDTO = new CrawDTO();
                crawDTO.setCrawTitle(rs.getString(1));
                crawDTO.setCrawAuthor(rs.getString(2));
                crawDTO.setCrawWeek(rs.getString(3));
                crawDTO.setCrawGenre(rs.getString(4));
                crawDTO.setCrawSummary(rs.getString(5));
                crawDTO.setCrawUrl(rs.getString(6));
                crawDTO.setCrawImage(rs.getString(7));
                list.add(crawDTO);
//                System.out.println("crawDTO: " + crawDTO.toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<CrawDTO> allInfo() {
        String sql = "SELECT * FROM craw";
        ArrayList<CrawDTO> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CrawDTO crawDTO = new CrawDTO();
                crawDTO.setCrawTitle(rs.getString(1));
                crawDTO.setCrawAuthor(rs.getString(2));
                crawDTO.setCrawWeek(rs.getString(3));
                crawDTO.setCrawGenre(rs.getString(4));
                crawDTO.setCrawSummary(rs.getString(5));
                crawDTO.setCrawUrl(rs.getString(6));
                crawDTO.setCrawImage(rs.getString(7));
                list.add(crawDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
