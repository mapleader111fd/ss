let counterSpeed = 1000;
let activeSwitches = 4;
let counterInterval = setInterval(incrementLastDigit, counterSpeed);

function turnOffSwitch(element, lightId) {
    const isOff = element.classList.contains('off');
    const switchSoundOn = document.getElementById('switchOnSound');
    const switchSoundOff = document.getElementById('switchOffSound');

    if (isOff) {
        element.classList.remove('off');
        document.getElementById(lightId).classList.remove('red');

        activeSwitches++;

        switchSoundOn.src = 'sounds/switch_on.mp3';
        switchSoundOn.play();
    } else {
        element.classList.add('off');
        document.getElementById(lightId).classList.add('red');

        activeSwitches--;

        switchSoundOff.src = 'sounds/switch_off.mp3';
        switchSoundOff.play();
    }

    adjustCounterSpeed();

    if (activeSwitches === 0) {
        stopCounter();
    } else if (!counterInterval) {
        counterInterval = setInterval(incrementLastDigit, counterSpeed);
    }

    let switchState = isOff ? "on" : "off";
    fetch(`https://${GetParentResourceName()}/switchToggle`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ switchId: lightId, state: switchState })
    }).then(resp => resp.json()).then(resp => console.log(resp));
}




function adjustCounterSpeed() {
    counterSpeed = 1000 + (4 - activeSwitches) * 500;

    clearInterval(counterInterval);
    counterInterval = setInterval(incrementLastDigit, counterSpeed);
}

function stopCounter() {
    clearInterval(counterInterval);
}

const digits = [0, 0, 0, 0, 0, 0];

window.addEventListener('message', function(event) {
    

    const data = event.data;
    if (data.action === "showMinigame") {
        document.body.style.display = 'flex';
        document.getElementById('clipboardWrapper').style.display = 'none';
        document.getElementById('fuseBoxContainer').style.display = 'block';
        initializeDigits(data.numbers);
    } else if (data.action === "hideMinigame") {
        document.body.style.display = 'none';
        document.getElementById('fuseBoxContainer').style.display = 'none';
    }
});

function initializeDigits(numbers) {
    if (!numbers || numbers.length !== 6) {
        numbers = [0, 0, 0, 0, 0, 0];
    }

    for (let i = 0; i < numbers.length; i++) {
        digits[i] = numbers[i];
        updateDigitDisplay(i + 1, digits[i]);
    }
}


function updateDigitDisplay(digitIndex, newNumber) {
    const digitElement = document.getElementById('digit' + digitIndex).querySelector('.number');
    const currentElement = digitElement.querySelector('.current');
    const nextElement = digitElement.querySelector('.next');

    nextElement.textContent = newNumber;
    digitElement.style.transition = 'top 0.3s ease-out';
    digitElement.style.top = '-12vh';

    setTimeout(() => {
        currentElement.textContent = newNumber;
        digitElement.style.transition = 'none';
        digitElement.style.top = '0';
    }, 300);
}

function incrementLastDigit() {
    digits[5]++;
    if (digits[5] > 9) {
        digits[5] = 0;
        updatePreviousDigit(4);
    }
    updateDigitDisplay(6, digits[5]);
}

function updatePreviousDigit(digitIndex) {
    if (digitIndex < 0) return;
    digits[digitIndex]++;
    if (digits[digitIndex] > 9) {
        digits[digitIndex] = 0;
        updatePreviousDigit(digitIndex - 1);
    }
    updateDigitDisplay(digitIndex + 1, digits[digitIndex]);
}

window.onload = function() {
    initializeDigits();
};

window.addEventListener('message', function(event) {
    
    if (event.data.action === "showClipboard") {
        document.body.style.display = 'flex'; 
        document.getElementById('fuseBoxContainer').style.display = 'none'; 
        document.getElementById('clipboardWrapper').style.display = 'flex';
    } else if (event.data.action === "hideClipboard") {
        document.getElementById('clipboardWrapper').style.display = 'none';
    }
});


window.addEventListener('message', function(event) {
    
    if (event.data.action === "updateTasks") {
        updateClipboardText(
            event.data.installedLights, 
            event.data.installedSwitches, 
            event.data.installedOutlets,
            event.data.totalLights,
            event.data.totalSwitches,
            event.data.totalOutlets
        );
    }
});

function updateClipboardText(installedLights, installedSwitches, installedOutlets, totalLights, totalSwitches, totalOutlets) {
    document.getElementById('lightsText').textContent = 'LIGHTS ' + installedLights + '/' + totalLights;
    document.getElementById('switchesText').textContent = 'SWITCHES ' + installedSwitches + '/' + totalSwitches;
    document.getElementById('outletsText').textContent = 'OUTLETS ' + installedOutlets + '/' + totalOutlets;

    if (installedLights !== totalLights) {
        document.getElementById("lightsCheckbox").checked = false;
        document.getElementById('lightsCheckbox').disabled = true;
    } else {
        document.getElementById('lightsCheckbox').disabled = false;
    }
    if (installedSwitches !== totalSwitches) {
        document.getElementById("switchesCheckbox").checked = false;
        document.getElementById('switchesCheckbox').disabled = true;
    } else {
        document.getElementById('switchesCheckbox').disabled = false;
    }
    if (installedOutlets !== totalOutlets) {
        document.getElementById("outletsCheckbox").checked = false;
        document.getElementById('outletsCheckbox').disabled = true;
    } else {
        document.getElementById('outletsCheckbox').disabled = false;
    }
}


document.getElementById('closeClipboard').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/closeClipboard`, {
        method: 'POST'
    }).then(() => {
        document.getElementById('clipboardWrapper').style.display = 'none';
    }).catch(err => console.error('An error occurred', err));
});


updateClipboardText(); 


document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.checkbox-container input[type="checkbox"]');
    var checkSound = document.getElementById('checkSound');

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            if (checkbox.checked) {
                checkSound.play();
            } else {
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.checkbox-container input[type="checkbox"]');

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {

            if (!this.checked) {
                this.checked = true;
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.checkbox-container input[type="checkbox"]');
    var allCheckboxesWereChecked = false; 

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            var allChecked = Array.from(checkboxes).every(cb => cb.checked);

            if (allChecked && !allCheckboxesWereChecked) {
                fetch(`https://${GetParentResourceName()}/checkboxStatus`, {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json; charset=UTF-8'},
                    body: JSON.stringify({ allChecked: true })
                });
            }

            allCheckboxesWereChecked = allChecked; 
        });
    });
});

function checkAllCheckboxesStatus() {
    var allChecked = true;
    var checkboxes = document.querySelectorAll('.checkbox-container input[type="checkbox"]');

    checkboxes.forEach(function(checkbox) {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });

    fetch(`https://${GetParentResourceName()}/checkboxStatus`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ allChecked: allChecked })
    });
}



let currentExp = 100;
var menu = {}

document.addEventListener("DOMContentLoaded", function() {
    const progressBar = document.querySelector('.progress-bar');
    const progressBar2 = document.querySelector('.progressCircle');
    const expNumberEl = document.querySelector('.exp-number');
    const missionButtons = document.querySelectorAll('.mission');

    

    function updateProgressBar() {
        const percentage = (currentExp / 100) * 100;
        progressBar2.style.setProperty("--progress", `${percentage}deg`)
        progressBar.style.width = `${percentage}%`;
        expNumberEl.textContent = currentExp;
    }
    menu["updateProgressBar"] = updateProgressBar;

    function checkMissionLocks() {
        missionButtons.forEach(button => {
            const requiredExp = parseInt(button.getAttribute('data-exp'), 10);
            const expRequiredEl = button.querySelector('.exp-required');
            if (currentExp < requiredExp) {
                button.classList.add('locked');
                button.setAttribute('disabled', true);
                expRequiredEl.textContent = `${requiredExp} XP Required`;
                expRequiredEl.style.display = 'block';
            } else {
                button.classList.remove('locked');
                button.removeAttribute('disabled');
                expRequiredEl.style.display = 'none'; 
            }
        });
    }
    
    menu["checkMissionLocks"] = checkMissionLocks;
});

window.addEventListener('message', function(event) {
    
    const data = event.data;
    if (data.action === "setExperience") {
        currentExp = data.value;
        menu["updateProgressBar"]();
        menu["checkMissionLocks"]();
    }
});


document.addEventListener('DOMContentLoaded', function() {
    const menu = document.querySelector('.menu');
    const closeButton = document.querySelector('.close-btn');

    closeButton.addEventListener('click', function() {
        menu.classList.remove('visible');
        setTimeout(() => {
            menu.style.display = 'none';
            sendMessageToServer('menuClosed');
        }, 300);
    });

    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case 'toggleMenu':
                const isMenuVisible = event.data.value;
                if (isMenuVisible) {
                    menu.style.display = 'block';
                    setTimeout(() => {
                        menu.classList.add('visible');
                    }, 10);
                } else {
                    menu.classList.remove('visible');
                    setTimeout(() => {
                        menu.style.display = 'none';
                    }, 300);
                }
                break;
                
            case 'closeUI':
                menu.classList.remove('visible');
                setTimeout(() => {
                    menu.style.display = 'none';
                }, 300);
                break;
        }
    });
});

function sendMessageToServer(action, data = {}) {
    fetch(`https://${GetParentResourceName()}/${action}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(data),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Response not OK');
        }
        return response.text();
    })
    .then(data => {
        const jsonData = JSON.parse(data);
    })
    .catch(error => {
    });
}




document.querySelectorAll('.mission').forEach(button => {
    button.addEventListener('click', function() {
        let missionType = this.getAttribute('data-mission');
        sendMessageToServer('startMission', { missionType: missionType });
    });
});

function updateProgressBar() {
    const percentage = (currentExp / 100) * 100;
    progressBar2.style.setProperty("--progress", `${percentage}deg`);
    progressBar.style.width = `${percentage}%`;
    progressBar.classList.add('animate');
    expNumberEl.textContent = currentExp;
}
function resetAnimation(element) {
    element.classList.remove('animate');
    void element.offsetWidth;
    element.classList.add('animate');
}


document.addEventListener('DOMContentLoaded', function() {
    const fuseBoxButton = document.querySelector('[data-mission="house-fuse-box"]');
    const backBtn = document.querySelector('.back-btn');
    const missionButtons = document.querySelectorAll('.missions .mission:not(.tier-mission)');
    const tierButtonsContainer = document.querySelector('.tier-buttons');
    const tierButtons = tierButtonsContainer.querySelectorAll('.tier-mission');

    fuseBoxButton.addEventListener('click', function() {
        tierButtonsContainer.style.display = 'flex';
        backBtn.style.display = 'block';
        missionButtons.forEach(btn => btn.style.display = 'none');
    });

    backBtn.addEventListener('click', function() {
        tierButtonsContainer.style.display = 'none';
        backBtn.style.display = 'none';

        missionButtons.forEach(btn => {
            btn.style.display = 'flex';
        });
    });
    missionButtons.forEach(button => {
        button.addEventListener('click', function() {
            let missionType = this.getAttribute('data-mission');
            sendMessageToServer('missionButtonClicked', { missionType: missionType });
        });
    });
    
    tierButtons.forEach(button => {
        button.addEventListener('click', function() {
            let tierType = this.getAttribute('data-tier');
            sendMessageToServer('tierButtonClicked', { tierType: tierType });
        });
    });
});

