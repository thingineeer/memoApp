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
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getToDoListFromCoreData() -> [MemoData] {
        var memoList: [MemoData] = []
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 정렬순서를 정해서 요청서에 넘겨주기
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                // 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    memoList = fetchedToDoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        
        return memoList
    }
}
