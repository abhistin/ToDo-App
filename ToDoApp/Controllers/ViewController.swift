//
//  ViewController.swift
//  ToDoApp
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    let todos = [
        Todo(title: "Complete DSP Flow"),
        Todo(title: "Eat Dinner"),
        Todo(title: "Take Medicine"),
        Todo(title: "Do Coding!")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        return cell
    }
    
    
}

