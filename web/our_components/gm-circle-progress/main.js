Polymer('gm-circle-progress', {
    percentage: 0,
    numcfu: "0/180",
    observe: {
    	percentage: 'go'
    },
    
    ready: function() {
    },
    
    go: function() {
    	this.$.pieProgress.percentage = this.$.percentage;
		$(this.$.pieProgress).circleProgress({
            value: this.percentage/100,
            size: 140,
            startAngle: -Math.PI/2,
            lineCap: 'round',
            fill: {
            	color: '#0943a0'
            }
        }).on('circle-animation-progress', function(event, progress, stepValue) {
            $(this.percentage).html(parseInt(100 * stepValue) + '%');
        });
	}
});