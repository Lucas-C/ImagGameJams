var life : int = 5;
var deadAnimation : Animation;

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
	Application.LoadLevel("GameOver");
}