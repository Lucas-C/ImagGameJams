var target : Transform;

var life : int = 2;
	

private var dead = false;
function ApplyDamage(damage:int)
{
	if (life <= 0)
		return;
	life -= damage;
	if (life <= 0) {
		Die();
		dead = true;
	}
}

function Die()
{
	//Destroy(GameObject);
}

