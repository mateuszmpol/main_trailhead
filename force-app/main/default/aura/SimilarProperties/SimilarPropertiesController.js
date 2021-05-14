({
    doInit : function(component, event, helper) {
        var spinner = component.find("spinner");
        $A.util.removeClass(spinner, "slds-hide");

        var action = component.get("c.findProperties");
        // action.setParams({
        //     recordId: component.get("v.recordId"),
        //     priceRange: "100000"
        // });
        action.setParams({
            recordId: component.get("v.recordId"),
            beds: component.get("v.property.fields.Beds__c.value"),
            price: component.get("v.property.fields.Price__c.value"),
            searchCriteria: component.get("v.searchCriteria"),
            priceRange: parseInt(component.get("v.priceRange"), 10)
        });
        
        console.log("Record ID: " + JSON.stringify(action.getParams()));
        
        action.setCallback(this, function(response){
            var similarProperties = response.getReturnValue();

            console.log(JSON.stringify(similarProperties));
            
            component.set("v.similarProperties", similarProperties);
            $A.util.addClass(spinner, "slds-hide");
        });
        $A.enqueueAction(action);
    }
})