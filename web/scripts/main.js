function standardPolymerLoad() {
	setMenuAction();
}

function setMenuAction() {
	var navicon = document.getElementById('navicon');
	drawerPanel = document.getElementById('drawerPanel');
	navicon.addEventListener('click', function() {
		drawerPanel.togglePanel();
	});
}

document.addEventListener("polymer-ready", standardPolymerLoad);