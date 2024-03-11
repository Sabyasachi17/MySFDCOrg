public class login_History
{
    public List<LoginHistory> record{set;get;}
    public void getLogin_History()
    {
        
        record = new List<LoginHistory>();
        record = [Select userId ,LoginType from LoginHistory];
    
        for(LoginHistory a:record)
        {
            if(a.LoginType!='Application')
            {
             System.debug(a.userId+''+a.LoginType);
                
            }
        }
        
	}

}