package main;

import java.util.Scanner;

public class Pay_MainMenu {

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		
		while(true) {
			System.out.println("=============================================");
			System.out.println("******* 인사급여 시스템(성일정보고 2학년12반 제공)******");
			System.out.println("=============================================");
			
			System.out.println("  1.인사마스터 검색(선택:전체/소속별/개인별)");
			System.out.println("  2.급여마스터 검색(선택: 연봉순:1 소속순:2 입사일기준:3 종료:9)\n"
					        +  "              (사번입력 or 소속코드입력)");
			System.out.println("  3.기준정보 검색");
			System.out.println("  4.호봉정보 검색");
			System.out.println("  5.월 근태정보 검색(선택:전체/소속별/개인별)");
			System.out.println("  6.월 급여지급내역 검색(선택:전체/소속별/개인별)");
			System.out.println("  7.월 급여작업");
			System.out.println("  0.작업을 종료합니다.");
			
			System.out.println("---------------------------------------------");
			System.out.println("작업 번호를 선택하세요?");
			
			int i_num = input.nextInt();
			if (i_num == 1) {
				Pay_Master_List.main(args);		  //1.인사마스터 검색(선택:전체/소속별/개인별)
			} else if (i_num == 2) {
				Pay_Hobong_List.main(args);		  //2.급여마스터 검색(연봉)
			} else if (i_num == 3) {
				Pay_StandardCode_List.main(args); //3.기준정보 검색
			} else if (i_num == 4) {
				Pay_HobongCode_List.main(args);	  //4.호봉정보 검색
			} else if (i_num == 5) {
				Pay_MonthWork_List.main(args);	  //5.월 근태정보 검색
			} else if (i_num == 6) {
				Pay_Master_List.main(args);		  //6.월 급여지급내역 검색(선택:전체/소속별/개인별)					  //6.
			} else if (i_num == 7) {
				Pay_Master_List.main(args);		  //7.월 급여작업
			} else if (i_num == 0) {
				System.out.println("작업을 종료합니다.");
				break;
			}
			 
		}

	}

}
