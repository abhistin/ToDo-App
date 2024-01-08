//
//  Todo.swift
//  ToDoApp
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import Foundation
struct Todo {
    let title: String
    let isComplete: Bool
    
    init(title: String, isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
    
    func completeToggled() -> Todo {
        return Todo(title: title, isComplete: !isComplete)
    }
}
