Polymer('gm-circle-progress', {
    percentage: "0",
    numcfu: "0/180",
    ready: function() {
        $(this.$.pieProgress).asPieProgress({
            'namespace': 'pie_progress'
        });
    },
    
	publish: {
		go: function() {
			$(this.$.pieProgress).asPieProgress('go', this.percentage);
		},
	}
});