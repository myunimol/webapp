Polymer('fp-recordbookexam', {
    ready: function() {},
    
    observe: {
    	details: 'detailsReloaded'
    },
    
    detailsReloaded: function() {
    	this.spin(false);
    },
    
    spin: function(status) {
    	this.$.fprecordbookSpinner.active = status;
    }
});