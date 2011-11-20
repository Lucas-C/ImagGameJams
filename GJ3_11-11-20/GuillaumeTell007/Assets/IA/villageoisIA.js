
var state : String = "waiting"; // waiting or running
var player : Transform;

var distanceDetection: int = 3;
var speed: float = 3;

function Update () {
	var transf : Transform = GetComponent(Transform);
	transf.rotation = Quaternion.identity;
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
}

function setStateWaiting() {
	state = "waiting";
}

function setStateRunning() {
	state = "running";
}

function playerClose() {
	var playpos : Vector2 = new Vector2(player.position.x, player.position.z);
	var mypos : Vector2 = new Vector2(transform.position.x, transform.position.z);
	return (mypos - playpos).magnitude < distanceDetection;
}

function churchPos() {
	return Vector3(900, 40, 740);
}

