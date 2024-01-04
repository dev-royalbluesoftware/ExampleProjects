//
//
// ExampleCoreData
// Movie+Convenience.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 



import CoreData

extension Movie {
    @discardableResult
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.name = name
        self.id = UUID()
    }
}


