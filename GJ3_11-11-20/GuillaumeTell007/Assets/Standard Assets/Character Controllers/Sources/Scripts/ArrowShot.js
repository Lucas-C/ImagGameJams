
var projectile : Rigidbody;
var speed = 20;
function Update()
{
	if( Input.GetButtonDown( "Fire1" ) )
	{
		var position : Vector3 = transform.position;
		var rotation : Quaternion = transform.rotation;
		var instantiatedProjectile : Rigidbody = Instantiate(projectile, position, rotation);
		instantiatedProjectile.velocity = transform.TransformDirection( Vector3( 0, 0, speed ) );
		Physics.IgnoreCollision( instantiatedProjectile.collider, transform.root.collider );
	}
}