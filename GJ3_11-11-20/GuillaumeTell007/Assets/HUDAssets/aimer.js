
var aimerPicture : Texture2D;


function OnGUI () {
	var x = (Screen.width - aimerPicture.width) / 2;
	var y = (Screen.height - aimerPicture.height) / 2;
	GUI.DrawTexture(Rect(x, y, aimerPicture.width, aimerPicture.height), aimerPicture);
}