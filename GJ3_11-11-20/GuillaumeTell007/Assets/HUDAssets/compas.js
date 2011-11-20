
var compasBackground: Texture2D;
var compasPic: Texture2D; // rotate
var compasLid : Texture2D;


function OnGUI () {
	var x1 = 10;
	var y1 = Screen.height - (compasPic.height + 10);
	var x2 = 10;
	var y2 = Screen.height - (compasLid.height + 10);
	var pivotPoint : Vector2;
	pivotPoint = Vector2(x1 + compasPic.width / 2,y1 + compasPic.height/2);
	var rotAngle = -Camera.mainCamera.transform.rotation.eulerAngles.y;
	var saveColor = GUI.color;
	GUI.color = Color(0.5, 0.25, 0, 0.5);
	GUI.DrawTexture(Rect(x2, y2, compasBackground.width, compasBackground.height), compasBackground);
	GUI.color = saveColor;
	GUIUtility.RotateAroundPivot (rotAngle, pivotPoint); 
	GUI.DrawTexture(Rect(x1, y1, compasPic.width, compasPic.height), compasPic);
	GUIUtility.RotateAroundPivot (-rotAngle, pivotPoint); 	
	GUI.DrawTexture(Rect(x2, y2, compasLid.width, compasLid.height), compasLid);
}