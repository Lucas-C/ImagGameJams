SceneHandler();
// print ("This is printed immediately");

function SceneHandler() {
	print("Scene 01");

	yield WaitForSeconds(2);

	Application.LoadLevel("Credits");

	print("Scene 02");
}
