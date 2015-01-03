Polymer('ss-enrolledel', {
	observe: {
		session: 'reloadSession'
	},

    reloadSession: function() {
    	var container = this.$.gwexpandible;
    	container.collapse = this.$.collapse;
		container.addEventListener('click', function() {
			this.collapse.toggle();
		})
		
		var button = this.$.enrollButton;
		button.elementId = this.session.id;
		this.$.ajaxEnroll.addEventListener('core-response', this.enrollResponse);
		button.ajax = this.$.ajaxEnroll;
		button.addEventListener('click', function() {
			this.ajax.addEventListener('core-response', this.onResponse);
			this.ajax.params = '{"id": "' + this.elementId + '"}';
			
			this.ajax.go();
		})
    },
    
    enrollResponse: function(event) {
    	if (event.details.result == 'success') {
    		//TODO: cosa fa se va bene la prenotazione
    	} else {
    		//TODO: messaggio di errore
    	}
    }
});