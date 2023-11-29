package main;

import java.sql.*;
import java.util.*;


import db.DBconnect;

class PayMonthWorkList {
	int    cnt;             // 순번
	String p_w_ym;			// 근태년월
	String p_id;			// 사원번호
	int    p_month_std;		// 기준일
	int    p_month_work;	// 지급일
	double p_month_minus;	// 제외일
	int    p_m13;			// 생리
	int    p_m14;			// 월차
	double p_not11_2;		// 평일OT
	double p_nnt11_3;		// 평일NT
	double p_hol12_1;		// 공휴지급일
	double p_hol12_2;		// 공휴 OT
	double p_hol12_3;		// 공휴 NT
	
	double s_month_minus = 0.0;
	int    s_m13 = 0;
	int    s_m14 = 0;
	double s_not11_2 = 0.0;
	double s_nnt11_3 = 0.0;
	double s_hol12_1 = 0.0;
	double s_hol12_2 = 0.0;
	double s_hol12_3 = 0.0;
	
	void printMonthWorkList() {
		System.out.printf("%3s %3s %7s %4d %4d %4.1f %3d %3d %5.1f %5.1f %7.1f %5.1f %5.1f  \n",
				cnt, p_w_ym, p_id, p_month_std, p_month_work, p_month_minus, p_m13, p_m14, p_not11_2, p_nnt11_3, p_hol12_1, p_hol12_2, p_hol12_3);
	}
	
	void printTotal() {
	    System.out.printf               ("%27s %4.1f %3d %3d %5.1f %5.1f %7.1f %5.1f %5.1f \n",
	    		p_id ,s_month_minus, s_m13, s_m14, s_not11_2, s_nnt11_3, s_hol12_1, s_hol12_2, s_hol12_3);
	}
}
public class Pay_MonthWork_List {

	public static void main(String[] args) {
		DBconnect d = new DBconnect();
		
		Connection conn = d.getConnection();
		PreparedStatement pstmt = null;
		String sql;
		
		Scanner input = new Scanner(System.in);
		
		try {
			while(true) {
				System.out.println("월 근태 내역을 출력합니다. 해당년월입력(예: 202301) 종료:9");
				int i_num = input.nextInt();
				sql = "select w_ym, id, month_std, month_work, "
					+ "       month_minus, m13, m14, not11_2, nnt11_3, "
					+ "       hol12_1, hol12_2, hol12_3 "
					+ "  from hr_month_work ";
				
				if(i_num == 9) {
					System.out.println("Payroll Main Menu 화면으로 갑니다");
					Pay_MainMenu.main(args);
					System.exit(0);
				} else if(i_num == 202301) {
					sql = sql+" where w_ym = " + i_num;
				} else if(i_num == 202302) {
					sql = sql+" where w_ym = " + i_num;
				} 
				
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				PayMonthWorkList p = new PayMonthWorkList();
				int i_cnt = 0;
				
				
				
				
				System.out.println("====================================월 근태 현황====================================");
				System.out.println("번호  근태년월  사원번호  기준일 지급일 제외일  생리 월차  평일OT 평일NT 공휴지급일  공휴OT 공휴NT   ");
				System.out.println("==================================================================================");
				
				while(rs.next()) {
					p.p_w_ym        = rs.getString("w_ym");
					p.p_id          = rs.getString("id");
					p.p_month_std   = rs.getInt("month_std");
					p.p_month_work  = rs.getInt("month_work");
					p.p_month_minus = rs.getDouble("month_minus");
					p.p_m13         = rs.getInt("m13");
					p.p_m14         = rs.getInt("m14");
					p.p_not11_2     = rs.getDouble("not11_2");
					p.p_nnt11_3     = rs.getDouble("nnt11_3");
					p.p_hol12_1     = rs.getDouble("hol12_1");
					p.p_hol12_2     = rs.getDouble("hol12_2");
					p.p_hol12_3     = rs.getDouble("hol12_3");
					p.cnt = ++i_cnt;
					
					p.s_month_minus  += rs.getDouble("month_minus");
					p.s_m13          += rs.getInt("m13");
					p.s_m14          += rs.getInt("m14");
					p.s_not11_2      += rs.getDouble("not11_2");
					p.s_nnt11_3      += rs.getDouble("nnt11_3");
					p.s_hol12_1      += rs.getDouble("hol12_1");
					p.s_hol12_2      += rs.getDouble("hol12_2");
					p.s_hol12_3      += rs.getDouble("hol12_3");
					
					p.printMonthWorkList();
					
				}
				System.out.println("==================================================================================");
				p.p_id = "합계";
				p.printTotal();
				System.out.println("==================================================================================");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
