//
//  toDoEkle.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 1.08.2023.
//

import UIKit

class ToDoEkle: UIViewController {

    @IBOutlet weak var tftodoAd: UITextField!
    
    var viewModel = ToDoKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ta = tftodoAd.text {
            viewModel.kaydet(toDo_ad: ta)
        }
    }
    
    
}
