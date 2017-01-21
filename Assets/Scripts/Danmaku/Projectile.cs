using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public float speed;
    public float lifetime;
    public Vector3 direction;
    protected PrefabPool pool;
    protected float timer;

    private void Awake()
    {
       // pool = GameObject.FindGameObjectWithTag("Pool").GetComponent<PrefabPool>();
    }
    public virtual void Init()
    {
        timer = 0;
    }

    public virtual void Shoot(Vector3 _position, Vector3 _direction)
    {
        transform.position = _position;
        direction = _direction;
    }

    
    protected virtual void Update()
    {
        timer += Time.deltaTime;
        if (timer >= lifetime)
            Destroy();
    }

    protected void Destroy()
    {
        GameObject.Destroy(gameObject);
    }
}
