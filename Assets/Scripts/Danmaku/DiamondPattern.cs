using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DiamondPattern : MonoBehaviour
{
    public Projectile projectile;
    public float cooldown;
    public float singleShotInterval;
    public int maxWidth;
    public float distanceBetweenProjectile;
    float timer;
    bool canShoot = true;
    int index;
    GameObject player;

    private void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        StartCoroutine(ShotFinished(1));
    }
    private void Update()
    {
        if (!canShoot)
            return;
        timer += Time.deltaTime;
        if (timer < singleShotInterval)
            return;

        timer = 0;
        ShootRow();
    }

    void ShootRow()
    {
        if (index == 0)
            transform.LookAt(player.transform, Vector3.up);
        if (index > 2 * maxWidth)
        {
            StartCoroutine(ShotFinished(cooldown));
            return;
        }

        int rowWidth = maxWidth - Mathf.Abs(maxWidth - index);
        for (int i = -rowWidth; i <= rowWidth; i++)
        {
            Projectile p = Instantiate(projectile);
            p.Init();
            p.Shoot(transform.position + transform.forward + (transform.right * i * distanceBetweenProjectile), transform.forward);
        }
        index++;
    }

    IEnumerator ShotFinished(float seconds)
    {
        canShoot = false;
        index = 0;
        yield return new WaitForSeconds(seconds);
        canShoot = true;
    }
}
