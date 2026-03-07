const dessin = document.getElementById("dessin");
const ctx = dessin.getContext("2d");

// ctx.fillStyle = "black";
// ctx.fillRect(100, 100, 100, 100);

const img = new Image(); // Create new img element

img.onload = () => {
    ctx.drawImage(img, 0, 0);
};
img.src = "/2_Web/images/chat.jpeg"; // Set source path



const animation = document.getElementById("animation");
const ctx2 = animation.getContext("2d");


const avion = new Image();
const canvasXSize = 500;
const canvasYSize = 500;
const dx = 1;
const dy = 1;
var x = 0;
var y = 0;

function init() {
    avion.src = "/2_Web/images/paper-plane-svgrepo-com.svg";
    window.requestAnimationFrame(draw);
}

function draw() {
    ctx2.clearRect(0, 0, 500, 500);
    if (x > canvasXSize) {
        ctx2.translate(-canvasXSize, -canvasYSize);
        x = 0;
        y = 0;
        ctx2.drawImage(avion, 0, 0, 50, 50);
    } else {
        ctx2.translate(dx, dy);
        ctx2.drawImage(avion, 0, 0, 50, 50);
        x = x + dx;
    }


    window.requestAnimationFrame(draw);
}

init();