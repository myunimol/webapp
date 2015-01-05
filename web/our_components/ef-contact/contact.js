/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Polymer('ef-contact', {
	ready: function() {
		this.super();
		this.elementName = "ef-contactel";
		this.elementProperty = "contact";
	},

	observe: {
		contacts : "reloadContacts"
	},
	
	reloadContacts: function() {
		this.elements = this.contacts;
	}
});
