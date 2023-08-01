//
//  toDoEkle.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 1.08.2023.
//

import UIKit

class ToDoEkle: UIViewController {

    @IBOutlet weak var tftodoAd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ta = tftodoAd.text {
            kaydet(toDo_ad: ta)
        }
    }
    
    func kaydet(toDo_ad:String) {
        print("To do kaydet: \(toDo_ad)")
    }
    
}
