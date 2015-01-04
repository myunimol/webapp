/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Polymer('ef-contact', {
	mainContainer: null,
	contactsAtTime: 20,
	actualNumber: 0,
	
	observe: {
		contacts: 'reloadContacts'
	},
	
	ready: function() {
		this.mainContainer = document.querySelector('core-header-panel[main]');
	},
	
    reloadContacts: function() {
    	this.actualNumber = 0;
    	if (this.mainContainer == null)
    		this.ready();
    	
    	this.$.container.innerHTML = "";
    	this.update();
    },
    
    update: function() {
    	/*var addressBook = this;
    	if (!this.more()) {
			setTimeout(function() {
	    		addressBook.update();
	    	}, 1000);
    	}*/
    	
    	var element = this.oneMore();

    	var addressBook = this;
    	if (element != null)
    		setTimeout(function() {
    			addressBook.update();
    		}, 100);
    },
    
    createContact: function(i) {
    	var element = document.createElement("ef-contactel");
		element.contact = this.contacts[i];
		this.$.container.appendChild(element);
		
		return element;
    },
    
    more: function() {
    	var max = this.actualNumber + this.contactsAtTime;
    	if (max > this.contacts.length)
    		max = this.contacts.length;
    	
		for (var i = this.actualNumber; i < max; i++) {
			this.createContact(i);
			this.actualNumber++;
    	}
		
		if (this.actualNumber >= this.contacts.length)
			return true;
		else
			return false;
    },
    
    oneMore: function() {
    	if (this.contacts[this.actualNumber] == null)
    		return null;
    	
    	var i = this.actualNumber;
    	var element = this.createContact(i);
    	this.actualNumber++;
    	
    	return element
    }
});
