/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Polymer('ef-contactel', {
    ready: function() {
    	this.$.contact.collapsable = this.$.collapsable;
    	this.$.contact.addEventListener('click', function() {
    		this.collapsable.toggle();
    	})
    }
});
