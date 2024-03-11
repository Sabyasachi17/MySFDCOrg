public inherited sharing class CountCandidates1111 {

 

    public integer candidateCount1111 {get;set;}

    public CountCandidates1111(ApexPages.StandardSetController controller) {   

        candidateCount1111 = [SELECT Count() FROM candidates__c];  

    }

}