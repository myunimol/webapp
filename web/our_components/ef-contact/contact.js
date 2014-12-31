/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Polymer('ef-contact', {
	observe: {
		contacts: 'reloadContacts'
	},
	
	ready: function() {
	},
	
    reloadContacts: function() {
    	this.$.container.innerHTML = "";
    	for (var i = 0; i < this.contacts.length; i++) {
    		var element = document.createElement("ef-contactel");
    		element.contact = this.contacts[i];
    		this.$.container.appendChild(element);
    	}
    }
});
