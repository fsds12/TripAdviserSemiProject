package tripAdviser.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{

	 public SMTPAuthenticatior() {
	        super();
	    }
	 
	    public PasswordAuthentication getPasswordAuthentication() {
	       
	        return new PasswordAuthentication("ckrgksejdro","1535542xx");
	    }


	
	
}
