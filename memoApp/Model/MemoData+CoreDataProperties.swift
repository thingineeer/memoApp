//
//  MemoData+CoreDataProperties.swift
//  memoApp
//
//  Created by 이명진 on 2023/07/26.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64
    
    
    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = self.date else {return ""}
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }

}

extension MemoData : Identifiable {

}
