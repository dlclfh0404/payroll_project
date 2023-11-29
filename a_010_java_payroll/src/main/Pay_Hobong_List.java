package main;

import java.sql.*;
import java.util.*;
import db.DBconnect;

class PayHobongList{
	int    cnt;                // 순번
	String p_id;			   // 사원번호
	String p_name;			   // 성명
	String p_jumin1;		   // 주민번호 - 앞자리 
	String p_jumin2;		   // 주민번호 - 뒷자리
	String p_grade;			   // 직급
	int    p_ho_won;		   // 월급
 // int    p_ho_year;		   // 연봉
	String p_status;		   // 재직 상태
	String p_date_in;		   // 입사일자
	String p_date_out;		   // 퇴사일자
	String p_department;	   // 소속번호
	String p_department_name;  // 소속명
	
	void printPayHobong() {
			System.out.printf("%3d  %s  %s  %s %s  %s  %d  %s  %s  %s  %10s  %s %s \n",
					cnt, p_id, p_name, p_jumin1, p_jumin2, p_grade, p_ho_won, p_ho_won*12, p_status, p_date_in,
					p_date_out, p_department, p_department_name);
	}
	
}
public class Pay_Hobong_List {
	public static void main(String[] args) {
		DBconnect d = new DBconnect();
		
		Connection conn= d.getConnection();
		PreparedStatement pstmt=null;
		String sql;
		
		Scanner input = new Scanner(System.in);
		try {
			while(true) {
				System.out.println("급여마스터를 출력합니다. 연봉순:1 소속순:2 입사일기준:3 종료:9 사번입력 소속코드입력");
				int in_order=input.nextInt();
				sql = "select id, name, jumin1, jumin2, status, "
				    + "      (select name from hr_standard_code where std1 = '21' and std2 = grade) grade, "
		            + "      (select ho_won from hr_hobong_code where ho = a.ho and grade = a.grade) ho_won, "
				    + "      (select name from hr_standard_code where std1 = '99' and std2 = status) status_name, "
				    + "      to_char(date_in,  'yyyy-mm-dd') date_in, "
				    + "      to_char(date_out, 'yyyy-mm-dd') date_out, "
				    + "      department, "
				    + "     (select name from hr_standard_code where std1 = '11' and std2 = department) department_name "
				    + " from hr_master a ";
				
				if(in_order == 9) {
					System.out.println("Payroll Main Menu 화면으로 갑니다");
					Pay_MainMenu.main(args);
					System.exit(0);
				}else if(in_order == 1) {
					sql=sql+" order by ho_won desc";
				}else if(in_order == 2) {
					sql=sql+" order by grade";
				}else if(in_order == 3) {
					sql=sql+" order by date_in";
				} else if(in_order > 1000 && in_order < 9999) {
					sql = sql + " where department =" + in_order;
				} else if(in_order > 170000 && in_order < 999999) {
					sql = sql + " where id =" + in_order;
				}
				
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				PayHobongList p = new PayHobongList();
				int i_cnt = 0;
				
				System.out.println("급여마스터 년봉 LIST");
				System.out.println("===========================================================================================================");
				System.out.println("번호  사원번호    성명   주민등록번호       직급       월급       연봉  상태    입사일자       퇴직일자    소속  소속명   ");
				System.out.println("===========================================================================================================");
				
				while(rs.next()) {
					p.p_id				= rs.getString("id");
					p.p_name			= rs.getString("name");
					p.p_jumin1			= rs.getString("jumin1");
					p.p_jumin2			= rs.getString("jumin2");
					p.p_grade			= rs.getString("grade");
					p.p_ho_won			= rs.getInt("ho_won");
					p.p_status			= rs.getString("status_name");
					p.p_date_in			= rs.getString("date_in");
					p.p_date_out        = rs.getString("date_out");
					if(rs.getString("status").equals("1")) {
						p.p_date_out      =  " ";
					}
					p.p_department      = rs.getString("department");
					p.p_department_name = rs.getString("department_name");
					p.cnt = ++i_cnt;
					p.printPayHobong();
				}
				System.out.println("===========================================================================================================");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}