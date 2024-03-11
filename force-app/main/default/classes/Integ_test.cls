public class Integ_test {
    
 Private static final string url = 'https://api.spoonacular.com/recipes/';
 Private static final string apiKey = '7dc6548fad2243c4ab1910d3ec7f15ac';

public static void getRandomReciepe(){
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=7dc6548fad2243c4ab1910d3ec7f15ac');
//request.setHeader('apiKey, '7dc6548fad2243c4ab1910d3ec7f15ac');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if(response.getStatusCode() == 200) {
    System.debug(response.getStatusCode());
    // Deserialize the JSON string into collections of primitive data types.
    //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
   System.debug(response.getBody());
}
}
public static void getReciepeByIngredients(String Ing)
{
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(url+'findByIngredients/?apiKey='+apiKey+'&ingredients='+Ing);
//request.setHeader('apiKey, '7dc6548fad2243c4ab1910d3ec7f15ac');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if(response.getStatusCode() == 200) {
    System.debug(response.getStatusCode());
    // Deserialize the JSON string into collections of primitive data types.
    //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
   System.debug(response.getBody());
}
}  
    
    
}