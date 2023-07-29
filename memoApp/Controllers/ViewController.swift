//
//  ViewController.swift
//  memoApp
//
//  Created by 이명진 on 2023/07/26.
//

import UIKit

final class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let memoManager = CoreDataManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 서치바
        setupNavBar()
        // 테이블뷰
        
    }
    
    // 뷰에 다시 접근할떄 항상 새로고침
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    // MARK: - 네비게이션바
    
    func setupNavBar() {
        self.title = "메모장"
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func plusButtonTapped() {
        performSegue(withIdentifier: "MemoCell", sender: nil)
    }
    
    
    // MARK: - 테이블뷰
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    
    

}









extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoManager.getToDoListFromCoreData().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        let memoData = memoManager.getToDoListFromCoreData()
        cell.memoData = memoData[indexPath.row]
        
        cell.updateButtonPressed = { [weak self] (senderCall) in
            self?.performSegue(withIdentifier: "MemoCell", sender: indexPath)
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
}


extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MemoCell", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemoCell" {
            
            let detailVC = segue.destination as! DetailViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.memoData = memoManager.getToDoListFromCoreData()[indexPath.row]
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

