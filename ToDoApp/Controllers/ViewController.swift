//
//  ViewController.swift
//  ToDoApp
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var todos = [
        Todo(title: "Complete DSP Flow"),
        Todo(title: "Eat Dinner"),
        Todo(title: "Take Medicine"),
        Todo(title: "Do Coding!"),
        Todo(title: "Hi I am Abhistin Bhardwaj, working as an iOS Developer.")
    ]
    
    //MARK: - Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func editButtonPressed(_ sender: UIButton) {
        tableView.isEditing = !tableView.isEditing
    }
}

//MARK: -Conform To TableView Delegates and Datasource.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! CheckTableViewCell
        cell.delegate = self
        let todo = todos[indexPath.row]
        cell.set(title: todo.title, checked: todo.isComplete)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Complete") { action, view, complete in
            let todo = self.todos[indexPath.row].completeToggled()
            let cell = tableView.cellForRow(at: indexPath) as! CheckTableViewCell
            cell.set(checked: todo.isComplete)
            complete(true)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
}

//MARK: -Conform to CheckTableView Delegate
extension ViewController: CheckTableViewCellDelegate {
    func checkTableViewCell(_ cell: CheckTableViewCell, didChangeCheckedState checked: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let todo = todos[indexPath.row]
        let newTodo = Todo(title: todo.title, isComplete: checked)
        
        todos[indexPath.row] = newTodo
    }
    
    
}
