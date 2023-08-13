//
//  TodoKayitViewModel.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 13.08.2023.
//

import Foundation

class ToDoKayitViewModel {
    var krepo = TodoDaoRepository()
    
    func kaydet(toDo_ad:String) {
        krepo.kaydet(toDo_ad: toDo_ad)
    }
}
