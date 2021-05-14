({
	doInit : function(component, event, helper) {
		var action = component.get("c.getItems");
		action.setCallback(this, function(response){
			var state = response.getState();
			if(state === "SUCCESS") {
				component.set("v.items", response.getReturnValue());
			}
			else {
				console.log("Failed with state: " + state);
			}
		});
		$A.enqueueAction(action);
	},

	handleAddItem : function(component, event, helper) {

		console.log("handleAddItem -> START")
		let item = event.getParam("item");
		console.log(JSON.stringify(item));

		helper.apex(component, item)
			.then( function(result) {
				var items = component.get("v.items");
				items.push(result);
				component.set("v.items", items);
				console.log("Result" + JSON.stringify(result));
			})
			.catch(err => {
				console.log(err);
			});

		// let action = component.get("c.saveItem");
        // action.setParams({
        //     "item": item
        // });
		// helper.createItem(component, action);

	},



	clickCreateItem : function(component, event, helper) {

		// if(validCamping) {

		// 	var item = component.get("v.newItem");
		// 	helper.createItem(component, item);
			
		// 	// var newCampingItem = component.get("v.newItem");
		// 	// //helper.createCamping(component,newCampingItem);
		// 	// var campings = component.get("v.items");
		// 	// var item = JSON.parse(JSON.stringify(newCampingItem))

		// 	// campings.push(item);
		// 	// component.set("v.items", campings);

		// 	component.set("v.newItem", { 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
		// 	'Price__c': 0,'Packed__c': false });
		// }
	}
})