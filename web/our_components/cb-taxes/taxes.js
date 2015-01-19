Polymer('cb-taxes', {
	ready: function() {
		this.super();
		this.elementName = "cb-taxesel";
		this.elementProperty = "tax";
    },

	observe: {
		taxes : "reloadTaxes"
	},
	
	reloadTaxes: function() {
		this.elements = this.taxes;
	}
});