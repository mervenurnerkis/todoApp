//
//  AnasayfaViewModel.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 13.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var krepo = TodoDaoRepository()
    var todosListe = BehaviorSubject<[toDos]>(value: [toDos]())
    
    init(){
        todosListe = krepo.todosListe
    }
    
    func sil(toDo_id:Int) {
        krepo.sil(toDo_id: toDo_id)
        toDoYukle()
    }
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func toDoYukle() {
        krepo.toDoYukle()
    }
}
