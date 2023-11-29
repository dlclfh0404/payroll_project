package main;

import java.sql.*;
import java.util.Scanner;

import db.DBconnect;

class PayHobongCodeList {
	int    cnt;             // 순번
	String p_grade;			// 직급
	int    p_ho;			// 호봉
	int    p_ho_won;		// 금액(월봉)
  //int    p_ho_year;       // 연봉
	
	void printPayMaster() {
		System.out.printf("%3d %3s %3d    %8d     %8d\n", 
				          cnt, p_grade, p_ho, p_ho_won, p_ho_won*12);
	}
}

public class Pay_HobongCode_List {

	public static void main(String[] args) {
		DBconnect d = new DBconnect();
		
		Connection conn = d.getConnection();
		PreparedStatement pstmt = null;
		String sql;
		
		Scanner input = new Scanner(System.in);
		
		try {
			while(true) {
				System.out.println("직급별 호봉 정보를 출력합니다. 전체:1 종료:9 직급(2자리)");
				sql = " select grade, ho, ho_won "
					+ "	   from hr_hobong_code ";
				int in_order = input.nextInt();
				if (in_order == 9) {
					System.out.println("Payroll Main Menu 화면으로 갑니다");
					Pay_MainMenu.main(args);
					System.exit(0);
				} else if (in_order == 1) {
					sql = sql + " order by grade";
				} else {
					sql = sql + " where grade = " + in_order;
				}
				
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				PayHobongCodeList p = new PayHobongCodeList();
				int i_cnt = 0;
				
				System.out.println("=============직급별 호봉 현황============");
				System.out.println("번호  직급 호봉     금액(월봉)          연봉");
				System.out.println("====================================");
				
				while (rs.next()) {
					p.p_grade         = rs.getString("grade");
					p.p_ho            = rs.getInt("ho");
					p.p_ho_won        = rs.getInt("ho_won");
					p.cnt = ++i_cnt;
					p.printPayMaster();
				}
				System.out.println("====================================");
				rs.close();
				// pstmt.close();
				// conn.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
