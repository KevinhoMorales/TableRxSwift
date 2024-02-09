//
//  ViewController.swift
//  TableRxSwift
//
//  Created by Kevin Morales on 9/2/24.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    
    let items = Observable.just(
        (0..<20).map { "\($0)" }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        title = "Rx Swift"
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpRxSwift()
    }
    
    private func setUpRxSwift() {
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "Item No. \(element)"
            }
            .disposed(by: disposeBag)
    }
}

