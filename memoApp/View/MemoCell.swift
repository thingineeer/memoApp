//
//  MemoCellTableViewCell.swift
//  memoApp
//
//  Created by 이명진 on 2023/07/29.
//

import UIKit

final class MemoCell: UITableViewCell {

    
    @IBOutlet weak var memoBackground: UIView!
    @IBOutlet weak var memoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    // ToDoData를 전달받을 변수 (전달 받으면 ==> 표시하는 메서드 실행) ⭐️
    var memoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 (셀(자신)을 전달)
    var updateButtonPressed: (MemoCell) -> Void = { (sender) in }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func basicUI() {
        memoBackground.clipsToBounds = true
        memoBackground.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
    }
    
    
    func configureUIwithData() {
        memoTextLabel.text = memoData?.memoText
        dateTextLabel.text = memoData?.dateString
        guard let colorNum = memoData?.color else {return}
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        memoBackground.backgroundColor = color.backgoundColor
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
