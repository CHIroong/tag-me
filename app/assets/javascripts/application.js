// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
document.addEventListener("turbolinks:load", function() { 
    init(document.getElementById('canvas'));
});
let drag = false,
		element = null,
		mouse = {
                x: 0,
                y: 0,
                startX: 0,
                startY: 0
            };

function init(canvas) {
    canvas.addEventListener('mousedown', mouseDown, false);
    canvas.addEventListener('mouseup', mouseUp, false);
    canvas.addEventListener('mousemove', mouseMove, false);
    document.onkeydown = function(e) {
        cancel(e, canvas);
    };
}

function cancel(e, canvas) {
    var obj = window.event? event : e
    if (obj.keyCode == 90 && obj.ctrlKey)
        canvas.lastElementChild.remove(); // TODO: call DESTROY
}

function setMousePosition(e) {
    let ev = e || window.event; // Moz || IE

    if (ev.pageX) { // Moz
        mouse.x = ev.pageX + window.pageXOffset;
        mouse.y = ev.pageY + window.pageYOffset;
    } 
    else if (ev.clientX) { // IE
        mouse.x = ev.clientX + document.body.scrollLeft;
        mouse.y = ev.clientY + document.body.scrollTop;
    }
}

function mouseDown(e) {
	if (e.target.classList.contains("remove"))
        return;
    console.log("begun.");
    mouse.startX = mouse.x;
    mouse.startY = mouse.y;
    startDraw();
    drag = true;
}

function mouseUp() {
	if (drag) {
        element.innerHTML = "<span class='remove'></span>";
        element.firstElementChild.addEventListener('click', remove, false);

        console.log(mouse.x, mouse.y, mouse.startX, mouse.startY);

        drag = false;
        element = null;
        canvas.style.cursor = "default";
        console.log("finsihed.");
    }
}

function mouseMove(e) {
	setMousePosition(e);
    if (drag) {
        element.style.width = Math.abs(mouse.x - mouse.startX) + 'px';
        element.style.height = Math.abs(mouse.y - mouse.startY) + 'px';
        element.style.left = (mouse.x - mouse.startX < 0) ? mouse.x + 'px' : mouse.startX + 'px';
        element.style.top = (mouse.y - mouse.startY < 0) ? mouse.y + 'px' : mouse.startY + 'px';
    }
}

function startDraw() {
    element = document.createElement('div');
    element.className = 'rectangle'
    element.style.left = mouse.x + 'px';
    element.style.top = mouse.y + 'px';
    
    canvas.appendChild(element)
    canvas.style.cursor = "crosshair";
}

function remove(e) {
	e.target.parentElement.remove(); // TODO: call DESTROY
}