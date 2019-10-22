//
//  Queue.swift
//  Queue
//
//  Created by Mohamed Arafa on 7/1/19.
//  Copyright © 2019 SolxFy. All rights reserved.
//


//Queue Protocol
protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
}

//Queue Array
struct QueueArray<T>:Queue {
    private var array: [T] = []
    var isEmpty: Bool{
        return array.isEmpty
    }
    var peek: T?{
        return array.first
    }
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}


//Queue Stack
struct QueueStack<T>:Queue {
    private var dequeueStack : [T] = []
    private var enqueueStack : [T] = []
    
    var isEmpty: Bool{
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var peek:T?{
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
        
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty{
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
    
}
