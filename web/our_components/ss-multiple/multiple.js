/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Polymer('ss-multiple', {
	actualNumber: 0,
	elementName: "",
	elementProperty: "",
	timeWait: 100,
	
	observe: {
		elements: 'reloadElements'
	},
	
	ready: function() {
	},
	
    reloadElements: function() {
    	this.actualNumber = 0;
    	
    	this.$.container.innerHTML = "";
    	this.update();
    },
    
    update: function() {
       	var element = this.oneMore();

    	var elementHandler = this;
    	if (element != null)
    		setTimeout(function() {
    			elementHandler.update();
    		}, this.timeWait);
    },
    
    createElement: function(i) {
    	var element = document.createElement(this.elementName);
		element[this.elementProperty] = this.elements[i];
		this.$.container.appendChild(element);
		
		return element;
    },
    
    oneMore: function() {
    	if (this.elements[this.actualNumber] == null)
    		return null;
    	
    	var i = this.actualNumber;
    	var element = this.createElement(i);
    	this.actualNumber++;
    	
    	return element
    }
});
