var damage:int = 2;

class Damage
{
	var damage:int;
	var object:GameObject;
}

function OnCollisionEnter( collision : Collision )
{
	rigidbody.velocity = Vector3(0, 0, 0);
	rigidbody.isKinematic = true;
	var dmg:Damage = new Damage();
	dmg.damage = damage;
	dmg.object = gameObject;
	collision.collider.SendMessageUpwards("ApplyDamage", dmg, SendMessageOptions.DontRequireReceiver);
}