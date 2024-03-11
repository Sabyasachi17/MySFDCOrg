trigger leadbfrinsert on Lead (before insert) 
{
    lead a = trigger.new[0];
    a.FirstName = 'trigger test';
    System.debug('Lead created----debug line');
   

}