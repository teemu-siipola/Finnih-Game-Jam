using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public enum E_PlayerState
{
    Normal,
    Blinking
}

public class PlayerMovement : MonoBehaviour
{
    public PlayerMelee melee;
    public float movementSpeed;
    public float dashingSpeed;
    public float blinkDuration;
    public float blinkDistance;
    public float blinkCooldown;
    public float meleeCooldown;
    public float meleeDistance;
    private Vector3 movementDirection;
    private Vector3 lookDirection;
    private Rigidbody rb;
    private Collider col;
    private Transform meleeLocation;
    private E_PlayerState state = E_PlayerState.Normal;

    private bool canBlink;
    private bool canMelee = true;
    private float currentSpeed;


    private float lastFrameDashInput = 0;
    private float lastFrameBlinkInput = 0;
    private float timer = 0;
    private bool dashing;
    private Vector3 blinkAnchor;
    private Vector3 blinkDestination;
    private Vector3 positionToLerpTo;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        col = GetComponent<Collider>();
        meleeLocation = transform.FindChild("MeleeLocation");
        blinkAnchor = Vector3.zero;
        canBlink = true;
    }

    private void StateNormal()
    {
        state = E_PlayerState.Normal;
        col.enabled = true;
        rb.useGravity = true;
        timer = 0;
    }

    private void StateBlink()
    {
        state = E_PlayerState.Blinking;
        col.enabled = false;
        rb.useGravity = false;

        canBlink = false;
        StartCoroutine(ICooldownBlink(blinkCooldown));
        blinkAnchor = rb.position;
        blinkDestination = blinkAnchor + transform.forward * blinkDistance;
        positionToLerpTo = rb.position;
    }

    private void Melee()
    {
        if (!canMelee)
            return;
        canMelee = false;
        Instantiate(melee, meleeLocation.position, Quaternion.identity);
        melee.transform.LookAt(transform.forward);
        StartCoroutine(ICooldownMelee(meleeCooldown));
    } 

    private void BoundToArea()
    {
        float posX = rb.position.x;
        float posZ = rb.position.z;
        Mathf.Clamp(posX, -38.31f, 50.7f);
        Mathf.Clamp(posZ, -25.55f, 20.19f);
        rb.MovePosition(new Vector3(posX, rb.position.y, posZ));

        Vector3 pos = rb.position;
        if (pos.x > 50.7f)
            pos.x = 50.7f;
        else if (pos.x < -38.31f)
            pos.x = -38.31f;
        if (pos.z > 20.19f)
            pos.z = 20.19f;
        else if (pos.z < -25.55f)
            pos.z = -25.55f;
        rb.MovePosition(pos);
    }

    private void Update()
    {
        switch (state)
        {
            case E_PlayerState.Blinking: UpdateBlinking(); break;
            default: UpdateMovement(); break;
        }
    }

    private void UpdateMovement()
    {
        movementDirection.x = Input.GetAxis("L_XAxis_1");
        movementDirection.z = Input.GetAxis("L_YAxis_1");
        movementDirection.Normalize();

        lookDirection.x = Input.GetAxis("R_XAxis_1");
        lookDirection.z = Input.GetAxis("R_YAxis_1");
        lookDirection.Normalize();
        if (lookDirection == Vector3.zero)
        {
            lookDirection = movementDirection;
        }
        else
        {
            meleeLocation.position = transform.position + lookDirection * meleeDistance;
            Melee();
        }

        if (Input.GetAxis("RB_1") > lastFrameDashInput || lastFrameDashInput == 1)
            currentSpeed = dashingSpeed;
        else currentSpeed = movementSpeed;
        lastFrameDashInput = Input.GetAxis("RB_1");

        float blinkInput = Input.GetAxis("LB_1");
        if (blinkInput >= lastFrameBlinkInput)
            if (Input.GetAxis("LB_1") > 0.0f && canBlink)
                StateBlink();

        lastFrameBlinkInput = blinkInput;
    }

    private void UpdateBlinking()
    {
        movementDirection = Vector3.zero;
        timer += Time.deltaTime;
        float percentage = timer / blinkDuration;
        percentage = Mathf.Clamp01(percentage);
        Vector3.Lerp(blinkAnchor, blinkDestination, percentage);
        positionToLerpTo = blinkAnchor + (blinkDestination - blinkAnchor) * percentage;
        if (percentage >= 1)
            StateNormal();
    }

    private void FixedUpdate()
    {
        switch (state)
        {
            case E_PlayerState.Normal:
                Vector3 newPosition = rb.position + movementDirection * currentSpeed; //transform.forward * currentSpeed;
                if (lookDirection != Vector3.zero)
                    rb.MoveRotation(Quaternion.LookRotation(lookDirection, Vector3.up));
                rb.MovePosition(newPosition);
                BoundToArea();
                break;
            case E_PlayerState.Blinking:
                rb.MovePosition(positionToLerpTo);
                break;
        }
    }

    IEnumerator ICooldownBlink(float seconds)
    {
        yield return new WaitForSeconds(seconds);
        canBlink = true;
    }

    IEnumerator ICooldownMelee(float seconds)
    {
        yield return new WaitForSeconds(seconds);
        canMelee = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.transform.tag == "Projectile" && state != E_PlayerState.Blinking)
            SceneManager.LoadScene(0);
    }
}
