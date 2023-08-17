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
    
    let db:FMDatabase?
    
    init() {
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDos.sqlite")
        db  =  FMDatabase(path: veritabaniURL.path)
    }
    
    func kaydet(toDo_ad:String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO toDos (name) VALUES (?)", values: [toDo_ad])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(toDo_id:Int, toDo_ad:String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE toDos SET name = ? WHERE id = ?", values: [toDo_ad,toDo_id])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(toDo_id:Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM toDos WHERE id = ?", values: [toDo_id])
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi:String){
        db?.open()
        var liste = [toDos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE name like '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let ad = result.string(forColumn: "name")!
                
                let todo = toDos(toDo_id: id, toDo_ad: ad)
                liste.append(todo)
            }
            
            todosListe.onNext(liste)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func toDoYukle() {
        db?.open()
        var liste = [toDos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let ad = result.string(forColumn: "name")!
                
                let todo = toDos(toDo_id: id, toDo_ad: ad)
                liste.append(todo)
            }
            
            todosListe.onNext(liste)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
