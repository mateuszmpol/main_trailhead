({ 
	// //if the form is valid
	// createItem : function (component, Item){         
    //     var action = component.get("c.saveItem");
    //     action.setParams({"item":Item});
    //     action.setCallback(this,function(response){
    //         var state = response.getState();
    //         if (component.isValid() && state === "SUCCESS") {
    //             var campings = component.get("v.items");
    //             campings.push(response.getReturnValue());
    //             component.set("v.items", campings);
    //         }
    //     });
    //    $A.enqueueAction(action);        
    // },

	//event with the item to be added, fires the event, then resets the newItem value provider with a blank sObjectType of type Camping_Item__c
	createItem: function(component, newItem) {
        console.log("addItem -> START");
        let addEvent = component.getEvent("addItem");
        addEvent.setParams({
            "item": newItem
        });
        console.log(addEvent);
        addEvent.fire();
        component.set(
            "v.newItem", { 
                'sobjectType': 'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false
            }
        );
	 },
   })