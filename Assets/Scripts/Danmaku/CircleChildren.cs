using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CircleChildren : MonoBehaviour
{
    public float radius;
    public float rotationSpeed;
    public float growthRate;

    private float circleTimer;
    private float r;

    private void Awake()
    {
        if (growthRate != 0)
            r = 0.1f;
        else r = radius;
    }

    private void Update()
    {
        if (growthRate != 0 && r < radius)
            r += Time.deltaTime * growthRate;

        int index = 0;
        float startingPos;
        circleTimer += rotationSpeed * Time.deltaTime;
        foreach (Transform child in transform)
        {
            if (child.parent != transform)
                break;

            index++;
            startingPos = ((float)index / (float)transform.childCount )*2*Mathf.PI;

            Vector3 newPos = Vector3.zero;
            newPos.x = Mathf.Cos(circleTimer + startingPos) * r;
            newPos.z = Mathf.Sin(circleTimer + startingPos) * r;

            child.localPosition = newPos;
        }
    }
}