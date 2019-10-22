//
//  Stack.swift
//  DataStructures
//
//  Created by Mohamed Arafa on 7/1/19.
//  Copyright © 2019 SolxFy. All rights reserved.
//

struct Stack<Element> {
    
    // Storage
    private var storage : [Element] = []
    
    func peek() -> Element?{
        return storage.last
    }
    
    var isEmpty:Bool{
        return peek() == nil
    }
    
    // Push
    mutating func push(_ element : Element){
        
        storage.append(element)
    }

    // Pop
    @discardableResult //that is mean we dont need this value from return
    mutating func pop() -> Element?{
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible{
    var description: String {
        return storage
            .map {"\($0)"}
            .joined(separator: " ")
    }
    
}
