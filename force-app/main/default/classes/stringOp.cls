public class stringOp {
    
    public static void sort()
    {
        integer[] Arr= new List<Integer>{75,45,231,4,9};
            system.debug('old array'+Arr);
        Arr.sort();
        system.debug('new array'+Arr);
        
        
        
    }
    
    public static void testSet()
    {
        set<integer> test = new set<integer>{33,44,55,66,77,88,33,44,55};
            boolean p=test.contains(33);
        boolean r=test.contains(200);
        	test.add(200);
        	system.assert(test.contains(88), 'value is present');
            system.debug('Test set contains'+p+'-and-'+r);
        	system.debug('set contains'+test);
        	test.remove(44);
        	system.debug('after removal'+test);
        	
        
        
    }

}