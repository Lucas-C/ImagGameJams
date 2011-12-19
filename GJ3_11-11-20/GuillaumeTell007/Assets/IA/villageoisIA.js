var state : String = "waiting"; // waiting or running
var player : Transform;

var distanceDetection: int = 3;
var speed: float = 3;

function Awake() {
   animation["course"].wrapMode = WrapMode.Loop;
   animation["marche"].wrapMode = WrapMode.Loop;
   setStateWaiting();
}

function Update () {
	updateState();
	updatePos();
}

function updateState() {
	if (playerClose() && state == "waiting") {
		setStateRunning();
	} //else if (!playerClose() && state == "running") {
		//setStateWaiting();
	//}
}

function updatePos() {
	if (state == "waiting") {
		return;
	}
	// we are running
	var t : Vector3 = churchPos() - transform.position;
	t.Normalize();
	t = t * speed * Time.deltaTime;
	transform.Translate(t);
	transform.rotation = Quaternion.identity;
	if (t.z > 0)
		transform.rotation.eulerAngles.y += Mathf.Atan(t.x / t.z) * 360 / (2 * Mathf.PI);
	else
		transform.rotation.eulerAngles.y += 180 + Mathf.Atan(t.x / t.z) * 360 / (2 * Mathf.PI);
}

function setStateWaiting() {
	state = "waiting";
	animation.CrossFade("Immobile");
}

function setStateRunning() {
	state = "running";
	animation.CrossFade("course");
}

function playerClose() {
	var playpos : Vector2 = new Vector2(player.position.x, player.position.z);
	var mypos : Vector2 = new Vector2(transform.position.x, transform.position.z);
	return (mypos - playpos).magnitude < distanceDetection;
}

function churchPos() {
// 	return Vector3(900, 40, 740);
	return player.position;
}
