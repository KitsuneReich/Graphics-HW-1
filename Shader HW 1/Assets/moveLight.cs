using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class moveLight : MonoBehaviour
{
    public bool moveX;
    public bool moveY;

    private Vector3 startPos;

    // Start is called before the first frame update
    void Start()
    {
        startPos = gameObject.transform.position;
    }

    // Update is called once per frame
    void Update() {

        if(moveX) {
            float newX = Mathf.Sin(Time.time) * 3;
            //print(gameObject.transform.position);
            gameObject.transform.position = new Vector3(newX, 0f, 0f) + startPos;
        }
        else if (moveY) {
            float newY = Mathf.Sin(Time.time) * 3;
            //print(gameObject.transform.position);
            gameObject.transform.position = new Vector3(0f, newY, 0f) + startPos;
        }
    }
}
