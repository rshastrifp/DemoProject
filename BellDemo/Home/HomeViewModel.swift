//
//  HomeViewModel.swift
//  BellDemo
//
//  Created by Ronak Shastri on 2020-03-01.
//  Copyright © 2020 Ronak. All rights reserved.
//

import Foundation
import RxSwift

typealias Success = () -> Void

class HomeViewModel {
    var disposeBag = DisposeBag()
    var lastModifiedDate: String?
        
    //I have created one example of RxSwift as well.
    //This can also be done with @escaping completion handeler.
    //I did that at TsnApi() level. 
    func fetch() -> Single<String> {
        return Single.create { observer in
            TsnApi().fetchData(api: TsnApi(), success: { (tsnResponseModel) in
                self.lastModifiedDate = tsnResponseModel.lastModifiedDateTime
                observer(.success(tsnResponseModel.lastModifiedDateTime))
            }) { (error) in
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
}
