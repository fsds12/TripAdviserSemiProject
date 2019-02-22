package tripAdviser.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		
		return new PasswordAuthentication("aldnsejdro@gmail.com","1535423z");
	}
	
	
}
