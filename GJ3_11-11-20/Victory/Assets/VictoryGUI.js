@script ExecuteInEditMode()

var gSkin: GUISkin;
var backdrop: Texture2D;

function OnGUI()
{
	GUI.skin = gSkin;
		 
	var backgroundStyle : GUIStyle = new GUIStyle();
	backgroundStyle.normal.background = backdrop;
	GUI.Label ( Rect( ( Screen.width - (Screen.height * 2)) * 0.75, 0,
		Screen.height * 2, Screen.height), "", backgroundStyle);
	 
	 
	GUI.Label (Rect( (Screen.width/2), Screen.height -360,
		0, 0), "Victory", "lblVictory");
		
	if (GUI.Button( Rect( (Screen.width/2)-70, Screen.height -160, 140, 70), "Retour menu"))
		Application.LoadLevel("Menu");
}