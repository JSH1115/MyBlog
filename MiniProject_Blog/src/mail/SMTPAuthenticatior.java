package mail;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends javax.mail.Authenticator {
    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("rmaqhql", "!jhgutnv3657");
    }
}
