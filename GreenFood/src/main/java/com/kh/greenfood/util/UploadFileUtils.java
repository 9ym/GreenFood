package com.kh.greenfood.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	/* S3Util 객체로 AmazonU3 서비스 사용해서 버킷에 파일 업로드 */
	public static String uploadFile(String uploadPath, String originalName, byte[] byteData) throws Exception {
		S3Util s3 = new S3Util();
		String bucketName = "greenfood";
		
		return null;
	}
	
	/* 오늘 날짜 < 년 - 월 - 일 > 폴더 경로 생성  */
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		System.out.println("yearPath :" + yearPath);
		System.out.println("monthPath :" + monthPath);
		System.out.println("datePath :" + datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath);
		logger.info(datePath);
		return datePath;
	}
	
	/* uploadPath에 폴더s 실제로 만들어짐 */
	private static void makeDir(String uploadPath, String ...paths) {
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
}
