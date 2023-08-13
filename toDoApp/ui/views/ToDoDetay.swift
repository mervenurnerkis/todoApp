//
//  toDoDetay.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 1.08.2023.
//

import UIKit

class ToDoDetay: UIViewController {

    @IBOutlet weak var tftoDoAd: UITextField!
    
    var toDo: toDos?
    
    var viewModel = TodoDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = toDo {
            tftoDoAd.text = t.toDo_ad
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ta = tftoDoAd.text, let t = toDo {
            viewModel.guncelle(toDo_id: t.toDo_id!, toDo_ad: ta)
        }
    }
    

}
