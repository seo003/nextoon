package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.CrawDTO;
import util.DatabaseUtil;

public class CrawDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public int saveInfo(CrawDTO crawDTO) {
		return 1;
	}
}
