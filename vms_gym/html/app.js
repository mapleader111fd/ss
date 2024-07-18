var statisticsmenu = {}

window.addEventListener("load", function(){
	$('.header > span').html(`${translate.menu_header}`);
	$('.stamina-text').html(`${translate.stamina_text}`);
	$('.key-x').html(`${translate.helpkeys['x']}`);
	$('.key-space').html(`${translate.helpkeys['space']}`);
	$('#strenght .stat-name').text(translate.menu_strenght);
	$('#condition .stat-name').text(translate.menu_condition);
	$('#shooting .stat-name').text(translate.menu_shooting);
	$('#driving .stat-name').text(translate.menu_driving);
	$('#flying .stat-name').text(translate.menu_flying);
	$('#notification-status .status-name').text(translate.notify_status_text);
	$('#notification-status .enabled-status-name').text(translate.notify_enabled_status_text);
	$('#notification-status .disabled-status-name').text(translate.notify_disabled_status_text);
	if (!localStorage.getItem("notify-status")) {
        localStorage.setItem(`notify-status`, 0);
    }
	$(`div [data-value=${localStorage.getItem("notify-status")}]`).addClass('status-button-active')
	$.post(`https://vms_gym/action`, JSON.stringify({action: "load", notifyStatus: localStorage.getItem("notify-status")}));
});

$('.status-button').click(function() {
    if ($(this).data('value') === 1) {
        $(`div [data-value=0]`).removeClass('status-button-active')
    } else {
        $(`div [data-value=1]`).removeClass('status-button-active')
	}
	$(this).addClass('status-button-active')
	localStorage.setItem(`notify-status`, $(this).data('value'));
	$.post(`https://vms_gym/action`, JSON.stringify({action: "notifyStatus", status: localStorage.getItem("notify-status")}));
})

window.addEventListener('message', function(event) {
  	var data = event.data
  	switch (data.action) {
		case 'load':
			if (data.statisticsmenu) {
				statisticsmenu = data.statisticsmenu
				for (const [key, value] of Object.entries(data.statisticsmenu)) {
					if (value) {
						$(`#${key}`).show();
					}
				}	
			}
			$.post(`https://vms_gym/action`, JSON.stringify({action: "notifyStatus", status: localStorage.getItem("notify-status")}));
			break
		case 'openHelpKeys':
			$('.helpInfo').fadeIn(225)
			$('.helpButtons').fadeIn(225)
			break;
		case 'closeHelpKeys':
			$('.helpInfo').fadeOut(225)
			$('.helpButtons').fadeOut(225)
			break;
		case 'update':
			if ((data.stamina).toString()) {
				var currentStamina = data.stamina >= 0.0 && data.stamina || 0.0
				$('.stamina-value').css('width', `${currentStamina}%`)
			}
			break;
		case 'openMenu':
			$('.statistics-menu').fadeIn(50)
			if (statisticsmenu.strenght && data.stats.strenght != undefined && (data.stats.strenght).toString()) {
				$('#strenght .stat-percent').text(`${(data.stats.strenght).toFixed(1)}%`);
				$('#strenght .stat-bar-value').css('width', `${data.stats.strenght}%`);
			}
			if (statisticsmenu.condition && data.stats.condition != undefined && (data.stats.condition).toString()) {
				$('#condition .stat-percent').text(`${(data.stats.condition).toFixed(1)}%`);
				$('#condition .stat-bar-value').css('width', `${data.stats.condition}%`);
			}
			if (statisticsmenu.shooting && data.stats.shooting != undefined && (data.stats.shooting).toString()) {
				$('#shooting .stat-percent').text(`${(data.stats.shooting).toFixed(1)}%`);
				$('#shooting .stat-bar-value').css('width', `${data.stats.shooting}%`);
			}
			if (statisticsmenu.driving && data.stats.driving != undefined && (data.stats.driving).toString()) {
				$('#driving .stat-percent').text(`${(data.stats.driving).toFixed(1)}%`);
				$('#driving .stat-bar-value').css('width', `${data.stats.driving}%`);
			}
			if (statisticsmenu.flying && data.stats.flying != undefined && (data.stats.flying).toString()) {
				$('#flying .stat-percent').text(`${(data.stats.flying).toFixed(1)}%`);
				$('#flying .stat-bar-value').css('width', `${data.stats.flying}%`);
			}
			break;
		case 'updateMenu':
			if (statisticsmenu.strenght && data.stats.strenght != undefined && (data.stats.strenght).toString()) {
				$('#strenght .stat-percent').text(`${(data.stats.strenght).toFixed(1)}%`);
				$('#strenght .stat-bar-value').css('width', `${data.stats.strenght}%`);
			}
			if (statisticsmenu.condition && data.stats.condition != undefined && (data.stats.condition).toString()) {
				$('#condition .stat-percent').text(`${(data.stats.condition).toFixed(1)}%`);
				$('#condition .stat-bar-value').css('width', `${data.stats.condition}%`);
			}
			if (statisticsmenu.shooting && data.stats.shooting != undefined && (data.stats.shooting).toString()) {
				$('#shooting .stat-percent').text(`${(data.stats.shooting).toFixed(1)}%`);
				$('#shooting .stat-bar-value').css('width', `${data.stats.shooting}%`);
			}
			if (statisticsmenu.driving && data.stats.driving != undefined && (data.stats.driving).toString()) {
				$('#driving .stat-percent').text(`${(data.stats.driving).toFixed(1)}%`);
				$('#driving .stat-bar-value').css('width', `${data.stats.driving}%`);
			}
			if (statisticsmenu.flying && data.stats.flying != undefined && (data.stats.flying).toString()) {
				$('#flying .stat-percent').text(`${(data.stats.flying).toFixed(1)}%`);
				$('#flying .stat-bar-value').css('width', `${data.stats.flying}%`);
			}
			break;
		case 'closeMenu':
			$('.statistics-menu').fadeOut(50)
			break;
  	}
})

document.onkeyup = function(data) {
	if (data.which == 27) {
		$.post(`https://vms_gym/action`, JSON.stringify({action: "closeMenu"}));
	}
};