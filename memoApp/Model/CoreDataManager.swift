//
//  CoreDataManager.swift
//  memoApp
//
//  Created by 이명진 on 2023/07/29.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    
    // 싱글톤
    static let shared = CoreDataManager()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 임시저장소 context
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔티티 이름 (코어데이터에 저장된 객체)
    let modelName: String = "MemoData"
}
