
/* Example level loader */
private var bw = 300;
private var bh = 50;
private var mw = 350;
private var mh = 190;
private var offx = 10;
private var offy = 10;

var gSkin : GUISkin;

function OnGUI () {

	if (gSkin) {
		GUI.skin = gSkin;
	} else {
		Debug.Log("Gui Skin missing");
	}
	var sw = Screen.width;
	var sh = Screen.height;
	var mx = (sw - mw) / 2;
	var my = (sh - mh) / 2;
	GUI.Box (Rect (mx, my, mw, mh), "");

	var currentY = my + offy;
	if (GUI.Button(Rect((sw - bw) / 2, currentY, bw, bh), "Nouveau jeu")) {
		Application.LoadLevel("intro");
	}
	currentY += bh + offy;
	if (GUI.Button(Rect((sw - bw) / 2, currentY, bw, bh), "Crédits")) {
		Application.LoadLevel("Credits");
	}
	currentY += bh + offy;
	if (GUI.Button(Rect((sw - bw) / 2, currentY, bw, bh), "Quitter")) {
		Application.Quit();
	}
}

