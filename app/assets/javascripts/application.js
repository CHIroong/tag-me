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
    let bg = document.getElementById("bg")
    canvas.style.height = bg.scrollHeight + "px";
    canvas.style.width = bg.scrollWidth + "px";

    canvas.addEventListener('mousedown', mouseDown, false);
    canvas.addEventListener('mouseup', mouseUp, false);
    canvas.addEventListener('mousemove', mouseMove, false);
    
    document.addEventListener('keydown', function(e) {
        cancel(e, canvas);
    }, false);

    Array.from(document.querySelectorAll(".remove")).forEach(addRemover);
    Array.from(document.querySelectorAll(".color")).forEach(addColorer);

    function setMousePosition(e) {
        let ev = e || window.event; // Moz || IE

        if (ev.pageX) { // Moz
            mouse.x = ev.pageX; // + window.pageXOffset
            mouse.y = ev.pageY; // + window.pageYOffset;
        } 
        else if (ev.clientX) { // IE
            mouse.x = ev.clientX + document.body.scrollLeft;
            mouse.y = ev.clientY + document.body.scrollTop;
        }
    }

    function mouseDown(e) {
        if (e.target.classList.contains("btn"))
            return;
        console.log("begun.");
        console.log(e.pageX, e.pageY, window.pageXOffset, window.pageYOffset);
        mouse.startX = mouse.x;
        mouse.startY = mouse.y;
        startDraw();
        drag = true;
    }

    function mouseUp() {
        if (drag) {
            element.innerHTML = "<span class='btn remove'></span><span class='btn color'></span>";
            addRemover(element.firstElementChild);
            addColorer(element.lastElementChild);

            // TODO: POST piece
            canvas.removeEventListener('keydown', callColor, false);
            canvas.addEventListener('keydown', callColor, false);

            drag = false;
            canvas.style.cursor = "default";
            console.log("finsihed.");
            // element = null;
        }
    }

    function mouseMove(e) {
        e.preventDefault();
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

    function addRemover(ele) {
        ele.addEventListener('click', remove, false);
    }

    function addColorer(ele) {
        ele.addEventListener('click', function() {
            color(parseInt(ele.classList[2].charAt(3)), ele.parentElement);
        }, false);
    }

    function remove(e) {
        e.target.parentElement.remove(); // TODO: call DESTROY
    }

    function cancel(e, canvas) {
        var obj = window.event? event : e
        if (obj.keyCode == 90 && obj.ctrlKey && canvas.lastElementChild)
            canvas.lastElementChild.remove(); // TODO: call DESTROY
    }

    function color(i, ele) {
        let colors = ["bg-0", "bg-1", "bg-2", "bg-3", "bg-4"],
            j = (i+1) % 5;

        colors.forEach(function(c) {
            ele.classList.remove(c);
            ele.lastElementChild.classList.remove(c);
        })

        ele.classList.add(colors[i]);
        ele.lastElementChild.classList.add(colors[j]);
    }

    function callColor(e) {
        var obj = window.event? event : e
        if (obj.keyCode >= 49 && obj.keyCode <= 53) {
            switch(obj.keyCode) {
                case 49:
                    color(0, element);
                    break;
                case 50:
                    color(1, element);
                    break;
                case 51:
                    color(2, element);
                    break;
                case 52:
                    color(3, element);
                    break;
                case 53:
                    color(4, element);
                    break;
            }
        }
    }
}