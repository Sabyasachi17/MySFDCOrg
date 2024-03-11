public class getInfoOrgA {

public static string getAccount(){
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://resourceful-unicorn-wuyhmx-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Accounts');
request.setHeader('Authorization','Bearer !AR8AQBRXy.Uq7sP1C5H0ukfN.Zn1w.iCQJKNcdc7tB2Y.vh0lrFEBvdHIrvavbxMtbltMFy1xVOkshh26PN5B1xo4iZ_BNV8');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if(response.getStatusCode() == 200) {
    System.debug(response.getStatusCode());
    // Deserialize the JSON string into collections of primitive data types.
    //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
  // System.debug(response.getBody());
    
}
   //Map<string,Object> result = (Map<string,Object>)Json.deserializeUntyped(response.getBody());
    List<Object> acclist = (List<Object>)Json.deserializeUntyped(response.getBody());
    
	List<Account> a = new List<Account>();
        //(List<Account>)JSON.deserialize(JSON.serialize(acclist), Type.forName('account')))
        for(object obj: acclist)
        {
			Account acc= new account();
            Account b=new account();
            acc= (Account)JSON.deserialize(JSON.serialize(obj), Type.forName('account'));
           b.name=acc.Name;
            b.Description='org a is connected';
            a.add(b);
        }
      
   
    System.debug(a);
  insert a;
    return response.getBody();


}}