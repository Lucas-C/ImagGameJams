var projectile : Rigidbody;
var speed = 20;
var xShift = -0.02;
var yShift = 0.05;

function Update()
{
	if( Input.GetButtonDown( "Fire1" ) )
	{
		var position : Vector3 = transform.position;
		var rotation : Quaternion = transform.rotation;
		rotation.eulerAngles.x += projectile.rotation.eulerAngles.x;
		rotation.eulerAngles.y += projectile.rotation.eulerAngles.y;
		rotation.eulerAngles.z += projectile.rotation.eulerAngles.z;
		var instantiatedProjectile : Rigidbody = Instantiate(projectile, position, rotation);
		instantiatedProjectile.velocity = transform.TransformDirection( Vector3(xShift, yShift, 1) * speed );
		Physics.IgnoreCollision( instantiatedProjectile.collider, transform.root.collider );
	}
}
