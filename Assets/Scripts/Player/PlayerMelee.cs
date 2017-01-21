using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMelee : MonoBehaviour
{

    public float lifetime;
    private float timer = 0.0f;

    private void Update()
    {
        timer += Time.deltaTime;
        if (timer > lifetime)
        GameObject.Destroy(gameObject);
    }
}
