using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MachineGun : MonoBehaviour
{
    public Projectile projectile;
    public float firerate;
    public float rotationSpeed;

    GameObject player;
    Vector3 aimAt;
    float timer;
    
    private void Awake()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        GetPlayerInitialLocation();
    }

    private void GetPlayerInitialLocation()
    {
        transform.LookAt(player.transform.position);
        //aimAt = player.transform.position;
    }

    private void ShootInstance()
    {
        Projectile p0 = Instantiate(projectile);
        Projectile p1 = Instantiate(projectile);
        p0.Init();
        p1.Init();
        p0.Shoot(transform.position + transform.forward*2 + transform.right*0.5f, transform.forward);
        p1.Shoot(transform.position + transform.forward * 2 - transform.right*0.5f, transform.forward);
    }

    private void Update()
    {
        timer += Time.deltaTime;
        if (timer >= firerate)
        {
            ShootInstance();
            timer = 0;
        }
        transform.rotation  = Quaternion.RotateTowards(transform.rotation, Quaternion.LookRotation((player.transform.position - transform.position).normalized, Vector3.up), rotationSpeed);
    }
}
