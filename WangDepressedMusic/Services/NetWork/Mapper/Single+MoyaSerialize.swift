//
//  Single+MoyaSerialize.swift
//  LXSH
//
//  Created by guxiang on 2021/6/3.
//

import Foundation
import RxSwift
import Moya
import HandyJSON

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response{
    func mapObject<T: HandyJSON>(_ type: T.Type) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.just(try response.mapObject(type))
        }
    }

    func mapArray<T: HandyJSON>(_ type: T.Type) -> Single<[T]> {
        return flatMap { response -> Single<[T]> in
            return Single.just(try response.mapArray(type) as! [T])
        }
    }
    
    func mapNilObject() -> Single<JSON> {
        return flatMap { (response) -> Single<JSON> in
            return Single.just(response.mapNilObject())
        }
    }
}


