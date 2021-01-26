package com.kh.greenfood.util;

import java.io.File;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3Util implements Keys, BucketFolder {
	
	/* S3 bucket 이름 */
	private static final String BUCKET = "greenfood";

	/* AmazonS3 접속한 객체 생성 */
	private static AmazonS3 access() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		
		final AmazonS3 s3 = new AmazonS3Client(credentials, clientConfig);
		s3.setEndpoint("s3.ap-northeast-2.amazonaws.com"); // 리전-서울 
		return s3;
	}
	
	/* 파일 업로드 */
	// S3Util.fileUpload(file, fileName, category);
	public static void fileUpload(File file, String fileName, String category) {
		AmazonS3 s3 = access();
		String s3FileName = setS3FileName(fileName, category);
		PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET, s3FileName, file);
		putObjectRequest.setCannedAcl(CannedAccessControlList.PublicReadWrite);
		s3.putObject(putObjectRequest);
	}
	
	/* 파일 복사 */
	// S3Util.fileCopy(fileName, categoryBefore, categoryAfter);
	public static void fileCopy(String fileName, String categoryBefore, String categoryAfter) {
		AmazonS3 s3 = access();
		String fileNameBefore = setS3FileName(fileName, categoryBefore);
		String fileNameAfter = setS3FileName(fileName, categoryAfter);
		CopyObjectRequest copyObjectRequest = new CopyObjectRequest(BUCKET, fileNameBefore, BUCKET, fileNameAfter);
		copyObjectRequest.setCannedAccessControlList(CannedAccessControlList.PublicReadWrite);
		s3.copyObject(copyObjectRequest);
	}
	
	/* 파일 삭제 */
	// S3Util.fileDelete(fileName, category);
	public static void fileDelete(String fileName, String category) {
		AmazonS3 s3 = access();
		s3.deleteObject(BUCKET, setS3FileName(fileName, category));
	}
	
	/* 이미지 파일 url 불러오기 => 버킷주소/폴더 이름/파일 이름.### 생성 */
	// S3Util.getImageUrl(fileName, category);
	public static String getImageUrl(String fileName, String category) {
		String imageUrl= BUCKET_URL + setS3FileName(fileName, category);
		return imageUrl;
	}
	
	/* 파일 이름 => 폴더 이름/파일 이름.### 생성 */
	private static String setS3FileName(String fileName, String category) {
		String folderName = findFolder(category);
		String s3FileName = folderName + "/" + fileName;
		return s3FileName;
	}
	
	/* 카테고리에 따라서 버킷 내 폴더 이름 찾기 */
	private static String findFolder(String category) {
		String folderName = "";
		switch (category) {
		case "2001":
			folderName = CATEGORY_2001;
			break;
		case "2002":
			folderName = CATEGORY_2002;
			break;
		case "2003":
			folderName = CATEGORY_2003;
			break;
		case "2004":
			folderName = CATEGORY_2004;
			break;
		case "2005":
			folderName = CATEGORY_2005;
			break;
		case "2006":
			folderName = CATEGORY_2006;
			break;
		case "2007":
			folderName = CATEGORY_2007;
			break;
		}
		return folderName;
	}
	
	
	/* 버킷 안에 폴더 생성 */
	/*public void createFolder(String bucketName, String folderName) {
		final AmazonS3 s3 = access();
		s3.putObject(bucketName, folderName + "/", 
				new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}*/
	
	/* 파일 URL */
	/*public String getFileURL(String bucketName, String fileName) {
		System.out.println("넘어오는 파일명 :" + fileName);
		String imgName = (fileName).replace(File.separatorChar, '/');
		return s3.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, fileName)).toString();
	}*/
	
}
