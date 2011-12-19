import System.IO;

var fileName = "Intro/intro/dialog.txt";
var lines;
var imgTellSurpris : Texture2D;
var imgVerrSurpris : Texture2D;
var imgTell : Texture2D;
var imgVerr : Texture2D;
var castle : Texture2D;
var histoire : Texture2D;
var txtSkin: GUISkin;
var blackscreen: Texture2D;

private var state : int = -1;
private var initTime = 0;

function OnGUI()
{
	var backgroundStyle : GUIStyle = new GUIStyle();

	if (state == -1){
		var scrollingSpeed = 80;
		var pos = 300;

		if (initTime == 0)
			initTime = Time.time;

		backgroundStyle.normal.background = blackscreen;
		GUI.Label ( Rect(0, 0, Screen.width, Screen.height), "", backgroundStyle);
		GUI.Label ( Rect ( Screen.width/2-200, pos - (Time.time - initTime) * scrollingSpeed, 400, 1200), histoire);

		if(pos - (Time.time - initTime) * scrollingSpeed + 800 < 0)
			state = 0;
	}
	else{
		backgroundStyle.normal.background = castle;
		GUI.Label ( Rect(0, 0, Screen.width, Screen.height), "", backgroundStyle);

		if(state == 0){
			var sr = new StreamReader(Application.dataPath + "/" + fileName);
		    var fileContents = sr.ReadToEnd();
		    sr.Close();

		    lines = fileContents.Split("\n"[0]);
		}

		if(2 * state < lines.length){
			GUI.skin = txtSkin;
			if( state % 2 == 1) {
				if (state == 3){
					backgroundStyle.normal.background = imgTellSurpris;
				}
				else{
					backgroundStyle.normal.background = imgTell;
				}
				GUI.Label ( Rect(0, 0, Screen.width/2, Screen.height), "", backgroundStyle);
				GUI.Label ( Rect(Screen.width/2, 0, Screen.width/2, Screen.height), lines[2*state], "txt");
			}
			else{
				if (state == 0){
					backgroundStyle.normal.background = imgVerrSurpris;
				}
				else{
					backgroundStyle.normal.background = imgVerr;
				}
				GUI.Label ( Rect(Screen.width/2, 0, Screen.width/2, Screen.height), "", backgroundStyle);
				GUI.Label ( Rect( 0, 0, Screen.width/2, Screen.height), lines[2*state], "txt");
			}
		}
		else
			Application.LoadLevel("tutoriel");
	}
}

function Update()
{
	if (Input.anyKeyDown) {
		state++;
	}
}
