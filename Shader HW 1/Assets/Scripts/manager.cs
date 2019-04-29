using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class manager : MonoBehaviour
{
    //Function to change the scene
    public void changeScene(string name) {
        SceneManager.LoadScene(name);
    }

    //Function to quit the application
    public void Quit() {
        Application.Quit();
    }
}
