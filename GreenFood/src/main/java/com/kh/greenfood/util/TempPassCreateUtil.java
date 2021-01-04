package com.kh.greenfood.util;

public class TempPassCreateUtil {
	
	// 임시 비밀번호 생성 6자리 (숫자 0~9 , 영어 대문자 A~Z)
	public static String getTempPassword(){
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	           'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	   
		String str = "";
	   
		int idx = 0;
	    for (int i = 0; i < 6; i++) {
	    	idx = (int) (charSet.length * Math.random());
	    	str += charSet[idx];
	    }
	    return str;
	 }
}
