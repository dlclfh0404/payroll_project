package main;

import java.sql.*;
import java.util.Scanner;

import db.DBconnect;

class PayStandardCodeList {
	int    cnt;             // 순번
	String p_std1;			// 구분 코드
	String p_std2;			// 코드
	int    p_std_won;		// 금액
	int    p_std_rate1;		// 지급 기준율1
	int    p_std_rate2;	    // 지급 기준율2
	int    p_std_rate3;		// 지급 기준율3
	String p_name;			// 코드명
	
	void printPayStandardCodeList() {
		System.out.printf("%3d %3s %6s   %8d   %4d  %5d  %4d     %s \n", 
				cnt, p_std1, p_std2, p_std_won, p_std_rate1, p_std_rate2,
				p_std_rate3, p_name);
	}
}

public class Pay_StandardCode_List {

	public static void main(String[] args) {
		DBconnect d = new DBconnect();
		
		Connection conn = d.getConnection();
		PreparedStatement pstmt = null;
		String sql;
		
		System.out.println("테스트1");
		
		Scanner input = new Scanner(System.in);
		
		try {
			while(true) {
				System.out.println("기준정보를 출력합니다. 전체:1 종료:9 구분(2자리)");
				sql = "select std1, std2, std_won, std_rate1, "
					+ "      std_rate2, std_rate3, name "
					+ "  from hr_standard_code ";
				int in_order = input.nextInt();
				if (in_order == 9) {
					System.out.println("Payroll Main Menu 화면으로 갑니다");
					Pay_MainMenu.main(args);
					System.exit(0);
				} else if (in_order == 1) {
					sql = sql + " order by std1";
				} else {
					sql = sql + " where std1 = " + in_order;
				}
				
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				PayStandardCodeList p = new PayStandardCodeList();
				int i_cnt = 0;
				
				System.out.println("=======================기준정보현황=============================");
				System.out.println("번호  구분 코드            금액  지급%1  지급%2  지급%3    코드명");
				System.out.println("============================================================");
				
				while (rs.next()) {
					p.p_std1         = rs.getString("std1");
					p.p_std2         = rs.getString("std2");
					p.p_std_won      = rs.getInt("std_won");
					p.p_std_rate1    = rs.getInt("std_rate1");
					p.p_std_rate2    = rs.getInt("std_rate2");
					p.p_std_rate3    = rs.getInt("std_rate3");
					p.p_name         = rs.getString("name");
					p.cnt = ++i_cnt;
					p.printPayStandardCodeList();
				}
				System.out.println("============================================================");
				rs.close();
				// pstmt.close();
				// conn.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
