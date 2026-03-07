

function creer_personnage(nom, classe, xp) {
    return {
        nom: nom,
        classe: classe,
        xp: xp,
        gagner_xp: function(gain_xp) {
            this.xp += gain_xp;
        },
        HTML_du_perso : function() {
            var nouveau_li = document.createElement('li');
            var nouveau_texte = document.createTextNode(
                this.nom + ' (' + this.classe + ', niveau ' + this.xp + ')'
            );
            nouveau_li.appendChild(nouveau_texte);
            nouveau_li.setAttribute('class', this.classe);
            return nouveau_li;
        }
    }
}


var troupe = [
    creer_personnage('Bastien', 'guerrier', 1000),
    creer_personnage('Nicole', 'voleur', 500),
    creer_personnage('Matteo', 'magicien', 100)
];


function ajouter_li_perso(li_du_perso) {
    var element_liste_des_persos = document.getElementById('liste_des_personnages');
    element_liste_des_persos.appendChild(li_du_perso);
}

for (var i = 0; i < troupe.length; i++) {
    perso = troupe[i];

    nouveau_li = troupe[i].HTML_du_perso();
    ajouter_li_perso(nouveau_li);
}


function ajouter_personnage() {
    var nom_du_personnage = document.getElementById('nom_personnage').value;
    var classe_du_personnage = document.getElementById("classe_personnage").value;

    var nouveau_perso = creer_personnage(nom_du_personnage, classe_du_personnage, 0);
    console.log(nouveau_perso.HTML_du_perso());
    var li_du_perso = nouveau_perso.HTML_du_perso();
    ajouter_li_perso(li_du_perso);
    console.log(li_du_perso);
}


// Récupérer un rectangle
const signal_canvas = document.getElementById("signal");
const ctx_signal = signal_canvas.getContext("2d");

ctx_signal.fillStyle = "green";
ctx_signal.fillRect(0, 0, 100, 100);


const dessin = document.getElementById("dessin");
const ctx = dessin.getContext("2d");


// ---------- Dessiner et placer des rectangles
// ctx.fillStyle = "black";
// ctx.fillRect(0, 0, 100, 100);
// ctx.fillRect(0, 400, 100, 100);
// ctx.fillRect(400, 400, 100, 100);
// ctx.fillRect(400, 0, 100, 100);
// ctx.fillRect(200, 200, 100, 100);

// -------- Creer un damier
// for (var i = 0; i < 5; i++) {
//     for (var j = 0; j < 5; j++) {

//         if ((i+j) % 2 == 0) {
//             ctx.fillStyle = "white";
//         } else {
//             ctx.fillStyle = "black";
//         }

//         x = i * 100;
//         y = j * 100;
//         ctx.fillRect(x, y, 100, 100);
//     }
// }



ctx.beginPath();
ctx.moveTo(250, 100);
ctx.lineTo(100, 250);
ctx.lineTo(250, 400);
ctx.lineTo(400, 250);
//ctx.lineTo(250, 100);
ctx.closePath();
ctx.stroke();

//ctx.fillStyle = "red";
//ctx.fill();


ctx.beginPath();
ctx.arc(250, 250, 50, 0, 2*Math.PI, true);
ctx.fillStyle = "red";
ctx.fill();
ctx.stroke()