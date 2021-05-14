({   
    // createItem2: function(component, action) {

    //     action.setCallback(this, function(response) {
    //         let state = response.getState();
    //         if(state === "SUCCESS") {
    //             var items = component.get("v.items");
    //             items.push(response.getReturnValue());
    //             component.set("v.items", items);
    //         }
    //     });
    //     $A.enqueueAction(action);
    // },

    // createItem: function(component) {
    //     return new Promise(function(resolve, reject) {

    //         var validCamping = component.find('campingform').reduce(function(validSoFar, inputCmp) {
    //             inputCmp.showHelpMessageIfInvalid();
    //             return validSoFar & inputCmp.get('v.validity').valid;
    //         }, true);

    //         if(validCamping) {
    //             resolve((response) => {
    //                 state = response.getState();
    //                 if (state === "SUCCESS") {
    //                     var items = component.get("v.items");
    //                     items.push(response.getReturnValue());
    //                     component.set("v.items", items);

    //                     var action = component.get("c.saveItem");
    //                     action.setParams({"item": response.getReturnValue()});
                        
    //                 }
    //             });
    //         } else {
    //             reject('Bad data - check input fields');
    //         }
    //     })
    // },

    apex : function( component, item ) {
        return new Promise( $A.getCallback( function( resolve , reject ) { 
            
            var action = component.get("c.saveItem");
            action.setParams( {"item": item} );
            action.setCallback( this , function(callbackResult) {
                if(callbackResult.getState()=='SUCCESS') {
                    resolve( callbackResult.getReturnValue() );
                }
                if(callbackResult.getState()=='ERROR') {
                    console.log('ERROR', callbackResult.getError() ); 
                    reject( callbackResult.getError() );
                }
            });
            $A.enqueueAction( action );
        }));            
    },


    // createItem : function (component,Item){         
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
})