using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StraigthBullet : Projectile
{
    public override void Init()
    {
        base.Init();
    }

    public override void Shoot(Vector3 _position, Vector3 _direction)
    {
        base.Shoot(_position, _direction);
    }

    protected override void Update()
    {
        transform.position = transform.position + direction * speed * Time.deltaTime;
        base.Update();
    }

}
