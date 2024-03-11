public with sharing class CountCandidates11 {

 

    public integer candidateCount11 {get;set;}

    public CountCandidates11(ApexPages.StandardSetController controller) {   

        candidateCount11 = [SELECT Count() FROM candidates__c];  

    }

}