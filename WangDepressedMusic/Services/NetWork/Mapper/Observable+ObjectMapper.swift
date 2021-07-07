//
//  Observable+ObjectMapper.swift
//  LXSH
//
//  Created by guxiang on 2021/6/3.
//

import Foundation
import Moya
import HandyJSON
import SwiftyJSON

public extension Response{
    
    func mapObject<T:HandyJSON>(_ type:T.Type) throws -> T {
        let jsonData = JSON(data)
        guard let json = jsonData.dictionaryObject else {
            throw NetworkError.responseSerializationException(.jsonSerializationFailed(nil))
        }
        guard let data = json[Network.Configuration.default.mapperKeyValue.modelKey] else {
            throw NetworkError.responseSerializationException(.dataNotFound)
        }
        guard let objet = JSONDeserializer<T>.deserializeFrom(dict: data as? [String:Any]) else {
            throw NetworkError.ResponseSerializationException.objectFailed
        }
        return objet
    }
    
    func mapArray<T:HandyJSON>(_ type:T.Type) throws -> T {
        let jsonData = JSON(data)
        guard let json = jsonData.dictionaryObject else {
            throw NetworkError.responseSerializationException(.jsonSerializationFailed(nil))
        }
        guard let data = json[Network.Configuration.default.mapperKeyValue.modelKey] else {
            throw NetworkError.responseSerializationException(.dataNotFound)
        }
        guard let array = data as? [[String: Any]] else {
            throw NetworkError.ResponseSerializationException.objectFailed
        }
        return JSONDeserializer<T>.deserializeModelArrayFrom(array: array) as! T
    }
    
    // MARK: -没有对象时解析方法
    func mapNilObject() -> JSON{
        let jsonData = JSON(data)
        
        return jsonData
    }
    
    
}
