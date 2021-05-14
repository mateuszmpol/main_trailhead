public with sharing class StringArrayTest {
    
    public static List<String> generateStringArray(Integer n) {
        List<String> outputArray = new List<String>();
        for (Integer i = 0; i < n; i++) {
            outputArray.add('Test '+i);
            System.debug(outputArray[i]);
        }
        return outputArray;
    }

}