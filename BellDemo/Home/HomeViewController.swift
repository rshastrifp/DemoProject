//
//  HomeViewController.swift
//  BellDemo
//
//  Created by Ronak Shastri on 2020-03-01.
//  Copyright © 2020 Ronak. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
    }

    //MARK: Load data.
    func fetchData() {
        viewModel.fetch()
        .observeOn(MainScheduler.instance)
        .subscribe(onSuccess: { [weak self] _ in
            guard let strongSelf = self else { return }
            if let date = strongSelf.viewModel.lastModifiedDate {
                strongSelf.showDate(date)
            }
        }, onError: { error in
            print(error)
        }).disposed(by: self.viewModel.disposeBag)
    }
    
    func showDate(_ date: String) {
        let formattedDate = Date().showOnlyDate(dateStr: date)
        let alert = UIAlertController(title: "Last Modified Date", message: formattedDate, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}

