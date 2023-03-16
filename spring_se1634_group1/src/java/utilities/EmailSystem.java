package utilities;

import entities.MailRequest;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

public class EmailSystem {

    private BlockingQueue<MailRequest> emailQueue = new LinkedBlockingQueue<>();
    private ExecutorService executor = Executors.newFixedThreadPool(10);

    public void sendEmail(String sender, String recipient, String subject, String text) {
        MailRequest mailRequest = new MailRequest(sender, recipient, subject, text);
        emailQueue.offer(mailRequest);
        executor.execute(new EmailSender(emailQueue));
    }
}

class EmailSender implements Runnable {

    private SMTP smtp;
    private volatile boolean stop;
    private BlockingQueue<MailRequest> emailQueue;

    public EmailSender(BlockingQueue<MailRequest> emailQueue) {
        this.emailQueue = emailQueue;
        this.stop = false;
    }

    public void stop() {
        stop = true;
    }

    @Override
    public void run() {
        while (!stop) {
            try {
                MailRequest mailRequest = emailQueue.take();
                smtp = new SMTP(ConfigManagement.getInstance().getConfigValue("SMTP_HOST"), 
                        ConfigManagement.getInstance().getConfigValue("SMTP_PORT"),
                        ConfigManagement.getInstance().getConfigValue("SMTP_ACCOUNT_EMAIL"),
                        ConfigManagement.getInstance().getConfigValue("SMTP_ACCOUNT_PASSWORD"));
                smtp.connect();
                smtp.sendMimeMessage(mailRequest.getSender(), mailRequest.getRecipient(),
                        mailRequest.getSubject(), mailRequest.getText());
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (MessagingException ex) {
                Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EmailSender.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
