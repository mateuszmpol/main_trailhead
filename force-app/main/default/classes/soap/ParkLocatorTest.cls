@isTest
private class ParkLocatorTest {

    @isTest
    static void test() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        List<String> results = new List<String>();
        List<String> expectedResults = new List<String>{
            'Park1',
            'Park2',
            'Park3'
        };
        results = ParkLocator.country('Germany');
        System.assertEquals(expectedResults, results);
    }
}
