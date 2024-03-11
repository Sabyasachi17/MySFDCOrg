public without sharing class CountCandidates111 {

 

    public integer candidateCount111 {get;set;}

    public CountCandidates111(ApexPages.StandardSetController controller) {   

        candidateCount111 = [SELECT Count() FROM candidates__c];  

    }

}