({
	clickCreateItem : function(component, event, helper) {

		console.log("clickCreateItem -> START")

		var validCamping = component.find('campingform').reduce(function(validSoFar, inputCmp) {
			// Displays error messages for invalid fields
			inputCmp.showHelpMessageIfInvalid();
			return validSoFar & inputCmp.get('v.validity').valid;
		}, true);
		
		if(validCamping) {
			console.log("validCamping -> TRUE")
			var newItem = component.get("v.newItem");
			console.log(newItem);
			helper.createItem(component, newItem);
		}
	}
})