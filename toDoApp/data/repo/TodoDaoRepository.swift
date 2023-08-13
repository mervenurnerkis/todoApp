//
//  TodoDaoRepository.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 13.08.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository {
    var todosListe = BehaviorSubject<[toDos]>(value: [toDos]())
    
    func kaydet(toDo_ad:String) {
        print("To do kaydet: \(toDo_ad)")
    }
    
    func guncelle(toDo_id:Int, toDo_ad:String) {
        print("to Do güncelle: \(toDo_id), \(toDo_ad)")
    }
    
    func sil(toDo_id:Int) {
        print("To do Sil: \(toDo_id)")
    }
    
    func ara(aramaKelimesi:String){
        print("To Do Ara: \(aramaKelimesi)")
    }
    
    func toDoYukle() {
        var liste = [toDos]()
        let t1 = toDos(toDo_id: 1, toDo_ad: "Evi Temizlemek")
        let t2 = toDos(toDo_id: 2, toDo_ad: "Çiçekleri Sulamak")
        let t3 = toDos(toDo_id: 3, toDo_ad: "Kargoya Gitmek")
        
        liste.append(t1)
        liste.append(t2)
        liste.append(t3)
        todosListe.onNext(liste) //tetikleme
    }
}
