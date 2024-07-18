
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
                expRequiredEl.textContent = `${requiredExp} XP Required`; // Show how much XP is required
                expRequiredEl.style.display = 'block'; // Make sure it's visible
            } else {
                button.classList.remove('locked');
                button.removeAttribute('disabled');
                expRequiredEl.style.display = 'none'; // Hide the XP requirement for unlocked missions
            }
        });
    }
    
    menu["checkMissionLocks"] = checkMissionLocks;
});

window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.action === "setExperience") {
        currentExp = data.value;
        // Update the progress bar and mission locks based on the new experience value
        menu["updateProgressBar"]();
        menu["checkMissionLocks"]();
    }
});


let isMenuVisible = false;

window.addEventListener('message', (event) => {
    switch (event.data.action) {
        case 'toggleMenu':
            isMenuVisible = event.data.value;
            const menu = document.querySelector('.menu');
            menu.style.display = isMenuVisible ? 'block' : 'none';
            break;
            case 'closeUI':
                const menuClose = document.querySelector('.menu');
                menuClose.style.display = 'none';
                break;
            
    }
});

window.addEventListener('message', (event) => {
    const menu = document.querySelector('.menu');
    switch (event.data.action) {
        case 'toggleMenu':
            isMenuVisible = event.data.value;
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


const closeButton = document.querySelector('.close-btn');

closeButton.addEventListener('click', function() {
    sendMessageToServer('closeUIButtonPressed', {});
});



function sendMessageToServer(action, data) {
    fetch(`https://${GetParentResourceName()}/${action}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(data),
    }).then(response => response.json()).then(data => {
    }).catch(error => {
        console.error('Error sending message to server:', error);
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
    progressBar.classList.add('animate'); // Add the class to trigger the animation
    expNumberEl.textContent = currentExp;
}
function resetAnimation(element) {
    element.classList.remove('animate');
    // Trigger a reflow in between removing and adding the class
    void element.offsetWidth;
    element.classList.add('animate');
}

