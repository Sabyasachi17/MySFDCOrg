global class logintry Implements Schedulable
{
        global void execute(SchedulableContext sc)
        {
            fetchuser();
        }
    
public static void fetchuser()
{
        list<LoginHistory> userlist = new list<loginhistory>();
        userlist = [select userid,status,logintime from loginHistory where logintime=today];
        User userlist2 = new User();
        System.debug(userlist.size());
        for(loginhistory a:userlist)
        {
            if(a.status!='success')
            {
                System.debug(a);
                userlist2=[select id,email from user where id=:a.userid];
                string p= (string)userlist2.email;
                System.debug(a);
                System.debug(userlist2);
                SingleMail(p,'Login Steps','Please follow the login steps to login successfully');
                
                
            }
        }
}
    // Public method

    public static void SingleMail(String address, String subject, String body) {

        // Create an email message object

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        String[] sendingTo = new String[]{address}; 

        mail.setToAddresses(sendingTo);

        mail.setSubject(subject);

        mail.setPlainTextBody(body);

        //message sending

      Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail}); 

    }
 
 
 
 }