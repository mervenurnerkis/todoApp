//
//  toDos.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 1.08.2023.
//

import Foundation

class toDos {
    
    var toDo_id: Int?
    var toDo_ad: String?
    
    init() {
        
    }
    
    init(toDo_id: Int, toDo_ad: String) {
        self.toDo_id = toDo_id
        self.toDo_ad = toDo_ad
    }
}


