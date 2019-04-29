using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouseInput : MonoBehaviour
{
    Renderer render;
    // Start is called before the first frame update
    void Start()
    {
        //Grab the renderer component for shader access
        render = GetComponent<Renderer>();
        print(render.material.shader.name);
    }


    //Function to increase the amount of blur steps in the shader on button mouse click
    public void Increase()
    {
        print("Clicked Increase");
        float i = render.material.GetFloat("_Steps");
        i += 5;
        render.material.SetFloat("_Steps", i);
    }

    //Function to decease the amount of blur steps in the shader on button mouse click
    public void Decrease()
    {
        print("Clicked Decrease");
        float i = render.material.GetFloat("_Steps");
        i -= 5;
        render.material.SetFloat("_Steps", i);
    }
}
