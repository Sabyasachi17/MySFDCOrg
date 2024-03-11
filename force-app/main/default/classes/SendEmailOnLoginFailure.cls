public class SendEmailOnLoginFailure {
    public static void sendEmail(Id userId) {
        // Get the user's email address
        User user = [SELECT Email FROM User WHERE Id = :userId];
        String emailAddress = user.Email;

        // Create the email message
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { emailAddress });
        mail.setSubject('Login Failure');
        mail.setPlainTextBody('There was a problem logging into your Salesforce account. Please contact your administrator for assistance.');

        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}