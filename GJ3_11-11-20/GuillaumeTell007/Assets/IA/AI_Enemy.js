@script ExecuteInEditMode()

function Update()
{
	if (Input.GetKeyDown ("w"))
		animation.CrossFade("saut");
}
