//
//  ViewController.swift
//  toDoApp
//
//  Created by Merve Nur Nerkis on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    var toDoListe = [toDos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        let t1 = toDos(toDo_id: 1, toDo_ad: "Evi Temizlemek")
        let t2 = toDos(toDo_id: 2, toDo_ad: "Çiçekleri Sulamak")
        let t3 = toDos(toDo_id: 3, toDo_ad: "Kargoya Gitmek")
        
        toDoListe.append(t1)
        toDoListe.append(t2)
        toDoListe.append(t3)
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? toDos {
                let gidilecekVC = segue.destination as! ToDoDetay
                gidilecekVC.toDo = toDo
            }
        }
    }
    
}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("To Do Ara: \(searchText)")
    }
}

extension Anasayfa: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let todo = toDoListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "todoHucre") as! ToDoHucre
        
        hucre.labelTodo.text = todo.toDo_ad
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDoListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            contextualAction,view,bool in
            let toDo = self.toDoListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(toDo.toDo_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                print("To Do Sil: \(toDo.toDo_id!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
