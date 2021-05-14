public with sharing class ParkLocator {
    
    public static String[] country(String countryName) {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(countryName);
    }
}
