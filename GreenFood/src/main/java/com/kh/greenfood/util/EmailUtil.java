package com.kh.greenfood.util;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

@Component
public class EmailUtil {

	@Inject
	private JavaMailSenderImpl mailSender;

	public boolean sendMail(String email, String password) {
		try {
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
					helper.setFrom("zerll9100@gmail.com");
					helper.setTo(email);
					helper.setText("안녕하세요 그린푸드입니다. 귀하의 임시비밀번호는"+ password +"입니다.");
					helper.setSubject("안녕하세요 그린푸드입니다. 임시비밀번호가 발급되었습니다.");
				}
			};
			mailSender.send(preparator);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
