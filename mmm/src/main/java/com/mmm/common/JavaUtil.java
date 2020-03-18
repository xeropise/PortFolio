package com.mmm.common;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class JavaUtil {
	
	// int 7을 String '07'로 변환
	public static String formatNumber2(int num) {
		String str = String.format("%02d", num);
		
		return str;
	}
	
	// int를 String으로
	public static String toString(int num) {
		return String.valueOf(num);
	}
	
	// String을 int로 NumberFormatException 주의
	public static int toInt(String s) {
		
		return Integer.parseInt(s); 
	}
	// %% Format변경하지말것.. 대소문자 잘못넣어도 다르게 작동합니다
	// String YYYY-MM-DD HH:MM 을 Timestamp로
	public static Timestamp ymdhmToTimestamp(String s) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return new Timestamp(dateFormat.parse(s).getTime());		
	}
	
	
	// String YYYY-MM-DD을 Timestamp로 
	public static Timestamp ymdToTimestamp(String s) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return new Timestamp(dateFormat.parse(s).getTime());
	}
	// String MM-DD을 Timestamp로
	public static Timestamp mdToTimestamp(String s) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
		return new Timestamp(dateFormat.parse(s).getTime());		
	}
	
	// String HH:MM을 
	public static Timestamp hmToTimestamp(String s) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
		return new Timestamp(dateFormat.parse(s).getTime());		
	}
	
	public static String convertDateFormat(String string)throws ParseException{
		SimpleDateFormat inputFomat = new SimpleDateFormat("yyyy-MM-dd.HH.mm.ss");
 		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		Date date = inputFomat.parse(string);
		return outputFormat.format(date);
	}
	
	public static String convertDateFormatforKMDB(String string)throws ParseException{
		SimpleDateFormat inputFomat = new SimpleDateFormat("yy.MM.dd");
 		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyyMM01");
 		Date date = inputFomat.parse(string);
		return outputFormat.format(date);
	}

	public static String convertDateFormatforDB(String string)throws ParseException{
		SimpleDateFormat inputFomat = new SimpleDateFormat("yy.MM.dd");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = inputFomat.parse(string);
		return outputFormat.format(date);
	}
	
	
	public static String convertDateFormatNoSecond(String string)throws ParseException{
		SimpleDateFormat inputFomat = new SimpleDateFormat("yyyy-MM-dd.HH.mm.ss");
 		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 		Date date = inputFomat.parse(string);
		return outputFormat.format(date);
	}
}
