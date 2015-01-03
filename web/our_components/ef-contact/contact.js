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
		this.mainContainer = document.getElementById('mainContainer');
	},
	
    reloadContacts: function() {
    	this.actualNumber = 0;
    	if (this.mainContainer == null)
    		this.ready();
    	
    	this.$.container.innerHTML = "";
    	this.more();
    	
    	this.mainContainer.addressBookElement = this;
    	this.mainContainer.addEventListener('scroll', function() {
    		var actual = this.scrollTop;
    		var total = this.scrollHeight - this.clientHeight;
    		var percent = actual / total;
    		
    		if (total - actual <= 100) {
    			this.addressBookElement.more();
    		}
    	});
    },
    
    more: function() {
    	var max = this.actualNumber + this.contactsAtTime;
    	if (max > this.contacts.length)
    		max = this.contacts.length;
    		for (var i = this.actualNumber; i < max; i++) {
    		var element = document.createElement("ef-contactel");
    		element.contact = this.contacts[i];
    		this.$.container.appendChild(element);
    		this.actualNumber++;
    	}
    }
});
