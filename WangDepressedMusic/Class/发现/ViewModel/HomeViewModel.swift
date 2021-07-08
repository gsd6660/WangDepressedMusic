//
//  HomeViewModel.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/8.
//

import Foundation

class HomeViewModel : RootViewModel {
    
    override init() {
        super.init()
        loadHomeApi()
    }
    
    func loadHomeApi() -> Single<Any>{
        var parmters = [String:Any]()
        parmters.updateValue("1014307", forKey: "uid")
        parmters.updateValue("token", forKey: "6c407ae42b1c8212de7e5959ae3fd379")
        
        return Single<Any>.create { (single) -> Disposable in
            HomeAPI.NewHomeLoad(parmDic: parmters).request()
                .mapJSON()
                .subscribe { (json) in
                    single(.success(json))
                } onError: { (error) in
                    single(.error(error))
                }.disposed(by: disBg)

            return Disposables.create {}
        }
    }
    
}
