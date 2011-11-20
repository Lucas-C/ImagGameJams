SceneHandler();
// print ("This is printed immediately");

function SceneHandler() {
	yield WaitForSeconds(5);

	Application.LoadLevel("Credits");
}
