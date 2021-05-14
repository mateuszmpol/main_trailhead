@isTest
public with sharing class AnimalLocatorTest {

    @isTest
    public static void getAnimalNameById1ShouldReturnChickenName() {

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        String nameValue = AnimalLocator.getAnimalNameById(1);
        System.debug('Expected Name: ' + nameValue);
        System.assertNotEquals(0, nameValue.length());
        System.assertEquals('chicken', nameValue);
    }
    

}
