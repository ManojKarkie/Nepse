//
//  PersistenceType.swift
//  HoursAndPay
//
//  Created by Lizan Pradhanang on 9/15/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//


import Foundation
import RealmSwift

let realm = try! Realm()

protocol RealmPersistenceType {
    var realmObject: Realm {get}
    
    func save(models: [Object])
    
    func deleteAll()
    
    func deleteAll<T: Object>(ofType: T.Type)
    
    func fetch<T: Object>() -> [T]
    
    func fetch<T: Object>(filter: String) -> [T]
    
    func fetch<T: Object>(format: String, args: Any...) -> [T]
    
    func fetch<T: Object>(primaryKey: Any) -> T?
    
    func update(action: @escaping ()->())
    
}

extension RealmPersistenceType {
    var realmObject: Realm {
        return realm
    }
    
    func save(models: [Object]) {
        try! self.realmObject.write {
            realmObject.add(models, update: true)
        }
    }
    
    func deleteAll() {
        try! realmObject.write {
            realmObject.deleteAll()
        }
    }
    
    func deleteAll<T: Object>(ofType: T.Type) {
        let objects: [T] = self.fetch()
        
        realmObject.beginWrite()
        do {
            realmObject.delete(objects)
            try realmObject.commitWrite()
        } catch {
            if realmObject.isInWriteTransaction { realmObject.cancelWrite() }
        }
    }
    
    func fetch<T: Object>() -> [T] {
        let values = realmObject.objects(T.self)
        return Array(values)
    }
    
    func fetch<T: Object>(filter: String) -> [T] {
        let values = realmObject.objects(T.self).filter(filter)
        return Array(values)
    }
    
    func fetch<T: Object>(format: String, args: Any...) -> [T] {
        let predicate =  NSPredicate(format: format, argumentArray: args)
        let values = realmObject.objects(T.self).filter(predicate)
        return Array(values)
    }
    
    func fetch<T: Object>(primaryKey: Any) -> T? {
        return realmObject.object(ofType: T.self, forPrimaryKey: primaryKey)
    }
    
    func update(action: @escaping ()->()){
        try! realmObject.write {
            action()
        }
        
    }
}


