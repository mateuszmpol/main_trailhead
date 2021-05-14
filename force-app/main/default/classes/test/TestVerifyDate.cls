@isTest
private class TestVerifyDate {

    @isTest static void testDate2IsWithinTheNext30Days(){
        Date verifyDate = VerifyDate.CheckDates(Date.newInstance(2020, 04, 14), Date.newInstance(2020, 04, 15));
        System.assertEquals(Date.newInstance(2020, 04, 15), verifyDate);
    }

    @isTest static void testDate2IsNotWithinTheNext30Days() {
        Date verifyDate = VerifyDate.CheckDates(Date.newInstance(2020, 04, 14), Date.newInstance(2020, 05, 15));
        System.assertEquals(Date.newInstance(2020, 04, 30), verifyDate); 
    }
}
