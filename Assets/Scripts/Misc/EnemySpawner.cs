using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemySpawner : MonoBehaviour
{
    public CircleChildren firestorm;
    public DiamondPattern diamondTurret;
    public BasicTurret basicTurret;
    public MachineGun machineGun;

    public float initialWaveCooldown;

    float timer;
    Vector2 upperBounds = new Vector2(50.7f, -25.55f);
    Vector2 lowerBounds = new Vector2(-38.31f, 20.19f);

    private void Start()
    {
        Wave4();
    }

    private Vector3 RandomLocation()
    {
        float x = Random.Range(lowerBounds.x, upperBounds.x);
        float z = Random.Range(lowerBounds.y, upperBounds.y);
        return new Vector3(x, 0, z);
    }

    private void Update()
    {
        timer += Time.deltaTime;
        if (timer > initialWaveCooldown)
        {
            int rnd = Random.Range(0, 4);
            switch(rnd)
            {
                case 0: Wave1(); break;
                case 1: Wave2(); break;
                case 2: Wave3(); break;
                case 3: Wave4(); break;
            }
            timer = 0;
        }
    }

    private void RandomTurret()
    {
        int rnd = Random.Range(0, 3);
        switch (rnd)
        {
            case 0: Instantiate(diamondTurret, RandomLocation(), Quaternion.identity); break;
            case 1: Instantiate(machineGun, RandomLocation(), Quaternion.identity); break;
            case 2: Instantiate(basicTurret, RandomLocation(), Quaternion.identity); break;
        }
    }

    private void Wave1()
    {
        Instantiate(machineGun, new Vector3(-23.5f, 0, -18.5f), Quaternion.identity);
        Instantiate(machineGun, new Vector3(-23.5f, 0, 10.5f), Quaternion.identity);
        Instantiate(machineGun, new Vector3(32.5f, 0, 10.5f), Quaternion.identity);
        Instantiate(machineGun, new Vector3(32.5f, 0, -18.5f), Quaternion.identity);
        Instantiate(basicTurret, Vector3.zero, Quaternion.identity);
        initialWaveCooldown = 10;
    }

    private void Wave2()
    {
        Instantiate(diamondTurret, new Vector3(9.0f, 0, -9.0f), Quaternion.identity);
        Instantiate(diamondTurret, new Vector3(-9f, 0, -9.0f), Quaternion.identity);
        Instantiate(diamondTurret, new Vector3(0, 0, 6.6f), Quaternion.identity);
        initialWaveCooldown = 5;
    }

    private void Wave3()
    {
        Instantiate(basicTurret, new Vector3(0.0f, 0, 14.0f), Quaternion.identity);
        Instantiate(basicTurret, new Vector3(0.0f, 0, -14.0f), Quaternion.identity);
        Instantiate(basicTurret, new Vector3(0.0f, 0, 14.0f), Quaternion.identity);
        initialWaveCooldown = 5f;
    }

    private void Wave4()
    {
        Instantiate(basicTurret, new Vector3(-25f, 0, -2f), Quaternion.identity);
        Instantiate(diamondTurret, new Vector3(28f, 0, -15.0f), Quaternion.identity);
        Instantiate(diamondTurret, new Vector3(28f, 0, 11), Quaternion.identity);
        initialWaveCooldown = 6.5f;
    }
}
