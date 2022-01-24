using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectPositionController : MonoBehaviour
{
    public Vector3 Postion = Vector3.zero;
    public bool Send = false;
    public Camera _Camera;

    void Start()
    {

    }

    void Update()
    {
       if (Send)
        {
            Send = false;
            this.gameObject.transform.position = Postion;
            float distance = (Postion - _Camera.transform.position).magnitude;
            float fixedDistance = distance / 30;
            //(0.1, 0.1, 0.1, 1.0f);
            Debug.Log("Current object to the camera distance = " + distance + " and fixed distance = " + fixedDistance);
        }
    }
}
