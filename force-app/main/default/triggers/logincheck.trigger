trigger logincheck on User (before insert) 
{
   list<loginhistory> logcheck = new List<loginhistory>();
    logcheck = [select id,status from loginhistory];
    
        
    

}