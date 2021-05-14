public with sharing class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        String animalName = '';

        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String,Object> animalDetails = (Map<String,Object>) results.get('animal');
            animalName = String.valueOf(animalDetails.get('name'));
            System.debug('Name: ' + animalName);
        }

        return animalName;
    }
}
