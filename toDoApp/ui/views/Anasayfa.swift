//
//  ViewController.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDetay(_ sender: Any) {
        let toDo = toDos(toDo_id: 1, toDo_ad: "Ödev yapmak")
        performSegue(withIdentifier: "toDetay", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? toDos {
                let gidilecekVC = segue.destination as! ToDoDetay
                gidilecekVC.toDo = toDo
            }
        }
    }
    
}

