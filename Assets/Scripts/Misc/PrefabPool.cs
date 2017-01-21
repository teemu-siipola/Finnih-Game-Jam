using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrefabPool : MonoBehaviour
{
    public Projectile bullet00;
    public Projectile bullet01;
    private List<Projectile> bullet00pool;
    private List<Projectile> bullet01pool;

    private void Start()
    {
        bullet00pool = new List<Projectile>();
        bullet01pool = new List<Projectile>();
        for (int i = 0; i < 100; i++)
            InsantiateBullet00();
        for (int i = 0; i < 100; i++)
            InsantiateBullet01();
    }

    //              //
    //   Bullet00   //
    //              //
    private void InsantiateBullet00()
    {
        Projectile temp = Instantiate(bullet00);
        temp.gameObject.SetActive(false);
        temp.transform.parent = transform;
        bullet00pool.Add(temp);
    }

    public Projectile GetBullet00()
    {
        if (bullet00pool.Count == 0)
            for (int i = 0; i < 20; i++)
                InsantiateBullet00();

        Projectile bulletToReturn = bullet00pool[0];
        bullet00pool.RemoveAt(0);
        bulletToReturn.gameObject.SetActive(true);
        bulletToReturn.Init();
        return bulletToReturn;
    }

    public void AddBullet00(Projectile bullet)
    {
        bullet.gameObject.SetActive(false);
        bullet00pool.Add(bullet);
    }

    //              //
    //   Bullet01   //
    //              //

    private void InsantiateBullet01()
    {
        Projectile temp = Instantiate(bullet01);
        temp.gameObject.SetActive(false);
        temp.transform.parent = transform;
        bullet01pool.Add(temp);
    }

    public Projectile GetBullet01()
    {
        if (bullet01pool.Count == 0)
            for (int i = 0; i < 20; i++)
                InsantiateBullet01();

        Projectile bulletToReturn = bullet01pool[0];
        bullet01pool.RemoveAt(0);
        bulletToReturn.gameObject.SetActive(true);
        bulletToReturn.Init();
        return bulletToReturn;
    }

    public void AddBullet01(Projectile bullet)
    {
        bullet.gameObject.SetActive(false);
        bullet01pool.Add(bullet);
    }
}
