
var imgTuto1 : Texture2D;
var imgTuto2 : Texture2D;
private var state : int = 1;

function OnGUI()
{
	var backgroundStyle : GUIStyle = new GUIStyle();

	switch(state){
		case 1 :
			backgroundStyle.normal.background = imgTuto1;
			break;
		case 2 :
			backgroundStyle.normal.background = imgTuto2;
			break;
		case 3 :
			Application.LoadLevel("Game");
			break;
	}
	GUI.Label ( Rect(0, 0, Screen.width, Screen.height), "", backgroundStyle);
}

function Update()
{
	if (Input.anyKeyDown) {
		state++;
	}
}
