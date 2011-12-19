var apple1 : Texture2D;
var apple2 : Texture2D;
var apple3 : Texture2D;
var apple4 : Texture2D;
var apple5 : Texture2D;
var appleback: Texture2D;

var HUDLivesMax = 5;
var offX = 10;
var offY = 10;
private var compteur = 0;

function OnGUI () {
	var saveColor = GUI.color;
	GUI.color = Color(1, 1, 0.3, 0.5);
	GUI.DrawTexture(Rect(offX, offY, appleback.width, appleback.height), appleback);
	GUI.color = saveColor;
	var playerLives = GetComponent(PlayerController).life; // Replace by the real value
	var image: Texture2D;
	switch(playerLives) {
	case 1:
		image = apple1;
		break;
	case 2:
		image = apple2;
		break;
	case 3:
		image = apple3;
		break;
	case 4:
		image = apple4;
		break;
	case 5:
		image = apple5;
		break;
	default:
		print("default FAILED in OnGUI() [HudLifeBar.js]");
		break;
	}
	if (image != null)
		GUI.DrawTexture(Rect(offX, offY, image.width, image.height), image);
}
