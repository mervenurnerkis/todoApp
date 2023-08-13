//
//  TodoDetayViewModel.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 13.08.2023.
//

import Foundation

class TodoDetayViewModel {
    var krepo = TodoDaoRepository()
    
    func guncelle(toDo_id:Int, toDo_ad:String) {
        krepo.guncelle(toDo_id: toDo_id, toDo_ad: toDo_ad)
    }
}
