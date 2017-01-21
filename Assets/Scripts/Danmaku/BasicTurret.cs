using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasicTurret : MonoBehaviour
{
    public float fireCooldown;

    private PrefabPool pool;
    public Projectile bullet;
    public Vector3[] Wave0Positions;
    public Vector3[] Wave1Positions;
    private float timer;
    private int phase = 0;

    void Start()
    {
        //pool = GameObject.FindGameObjectWithTag("Pool").GetComponent<PrefabPool>();
    }

    private void Update()
    {
        timer += Time.deltaTime;
        if (timer >= fireCooldown)
            ShootNextWave();
    }

    private void ShootNextWave()
    {
        timer = 0;
        switch (phase)
        {
            case 0: ShootWave0(); phase = 1; break;
            case 1: ShootWave1(); phase = 0; break;
        }

    }

    private void ShootWave0()
    {
        Projectile p;
        for (int i = 0; i < 8; i++)
        {
            Vector3 pos = transform.position + Wave0Positions[i];
            Vector3 dir = Wave0Positions[i];
            p = Instantiate(bullet);
            p.Init();
            p.Shoot(pos, dir);
        }
    }

    private void ShootWave1()
    {
        Projectile p;
        for (int i = 0; i < 8; i++)
        {
            Vector3 pos = transform.position + Wave1Positions[i];
            Vector3 dir = Wave1Positions[i];
            p = Instantiate(bullet);
            p.Init();
            p.Shoot(pos, dir);
        }
    }
}
