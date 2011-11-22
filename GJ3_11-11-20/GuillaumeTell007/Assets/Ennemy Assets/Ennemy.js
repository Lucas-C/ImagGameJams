
var player : Transform;

private var speed : float = 0.02;
private var deltaAngle : float = 1;
private var updateCount : int = 0;
private var rotate : float = 0;
function FixedUpdate()
{
	if (CanSeePlayer())
	{
		var angle : float = ((player.eulerAngles - transform.eulerAngles).y + 360) % 360;
		if (180 - deltaAngle < angle && angle < 180 + deltaAngle)
			rotate = 0.1;
		else
			rotate = 1;
		
		rotate = angle < 180 ? -rotate : rotate;
	}
	else if (++updateCount == 100)
	{
		updateCount = 0;
		rotate = Random.Range(-0.5, 0.5);
	}

	transform.Translate(Vector3(0, 0, speed));
	transform.Rotate(0, rotate, 0);
}

function CanSeePlayer () : boolean {
	var playerDirection : Vector3 = (player.position - transform.position);
	var hit : RaycastHit;
	Physics.Raycast (transform.position, playerDirection, hit, playerDirection.magnitude);
	if (hit.collider && hit.collider.transform == player) {
		return true;
	}
	return false;
}


/*** Life ***/

var life : int = 2;

private var dead = false;
function ApplyDamage(a_dmg:Damage)
{
	if (life <= 0)
		return;
	life -= a_dmg.damage;
	if (life <= 0) {
		Die();
		dead = true;
	}
	
	if(a_dmg.object != null)
	{
		Destroy(a_dmg.object);
	}
}

function Die()
{
	Destroy(gameObject);
}

