package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	public static String getHash(String str) {
		String result = "";
		
		try {
			MessageDigest ms = MessageDigest.getInstance("SHA-256");
			ms.update(str.getBytes());
			byte byteData[] = ms.digest();
			StringBuffer bf = new StringBuffer();
			for(int i = 0; i < byteData.length; i++) {
				bf.append(Integer.toString((byteData[i] & 0xFF) + 0x100, 16).substring(1));
			}
			
			result = bf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
}
//package common;
//
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//
//public class SHA256 {
//	public static String encodeSha256(String str) {
//		String result = "";
//		
//		try {
//			MessageDigest sh = MessageDigest.getInstance("SHA-256");
//			sh.update(str.getBytes());
//			byte byteData[] = sh.digest();
//			StringBuffer sb = new StringBuffer();
//			for (int i = 0; i < byteData.length; i++) {
//				sb.append(Integer.toString((byteData[i] & 0xFF) + 0x100, 16).substring(1));
//			}
//			
//			result = sb.toString();
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//			result = null;
//		}
//		
//		return result;
//	}
//}