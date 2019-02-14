package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{
	
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	//암호화를위해 getParameter메소드를 오버라이딩함
	@Override
	public String getParameter(String key) {
		String value = "";
		if(key != null && (key.equals("password") || key.equals("password_new"))) {
			System.out.println(super.getParameter(key));
			value = getSha512(super.getParameter(key));
			System.out.println("암호화한값 : " + value);
		}
		else {
			value = super.getParameter(key);
		}
		return value;
	}
	
	private String getSha512(String value) {
		String encryptPw = "";
		//암호화 객체 생성 : MessageDigest
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		}
		catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes = value.getBytes(Charset.forName("UTF-8"));
		
		md.update(bytes);
		encryptPw = Base64.getEncoder().encodeToString(md.digest());
		
		return encryptPw;
	}
}
