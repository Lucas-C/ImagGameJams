function OnCollisionEnter( collision : Collision )
{
	rigidbody.velocity = Vector3(0, 0, 0);
	
	//Destroy(gameObject);
	
	/*var contact : ContactPoint = collision.contacts[0];
	var rotation = Quaternion.FromToRotation( Vector3.up, contact.normal );
	var instantiatedExplosion : GameObject = Instantiate(
	explosion, contact.point, rotation );
	Destroy( gameObject );*/
}