@script ExecuteInEditMode()

var gSkin: GUISkin;

var scrollingSpeed = 100;
var startPos = 800;
var spacing = 60;

var engineIcon : Texture2D;

function OnGUI()
{
	GUI.skin = gSkin;
	GUI.Label(Rect(0, 0, Screen.width, Screen.height), ""); // To fill the screen with black

	var pos = startPos;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Credits");
	pos += spacing;

	GUI.DrawTexture(Rect(Screen.width / 2 - 150, pos - Time.time * scrollingSpeed, 300, pos + 300), engineIcon);
	pos += 300;
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "LEAD DESIGNER");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Cyril Kamowski");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "LEAD PROGRAMMER");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Louis Dureuil");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "LOGISTIC COORDINATOR");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Lucas Cimon");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "SCENARISTS & INTRO PROGRAMMERS");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Heloïse Guillemaud");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Hobitiana Rabenarivo");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Dominique Lee");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "PHYSICS PROGRAMMER");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Cyril Kamowski");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Pierre Turin");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "HUD PROGRAMMER");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Benoît \"Va mourir\" Morel");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Guillaume Berard");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "3D MODELLER");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Julien Fleury");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Benoît \"Bite\" Person");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "ANIMATOR");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Julien Fleury");
	pos += spacing;
	pos += spacing;

	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "MUSIC COMPOSER");
	pos += spacing;
	GUI.Label(Rect(0, pos - Time.time * scrollingSpeed, Screen.width, spacing), "Benoît Genevaux");
	pos += spacing;
	pos += spacing;
}
