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
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDos", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDos.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()){
            print("Veritabanı zaten var.")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}
