public class CountCandidates1 {
     public integer candidateCount {get; set;}

    public CountCandidates1(ApexPages.StandardSetController controller) {

        candidateCount = [SELECT Count() FROM candidates__c];

    }

 

}