//
//  MapperParameterType.swift
//  LXSH
//
//  Created by guxiang on 2021/6/2.
//

import UIKit


public protocol MapperKeyValueType{
    var successValue: String{get set}
    
    var statusCodeKey: String{get set}
    
    var msgStrKey: String{ get set }
    
    var modelKey: String{ get set }

}

public struct DefaultMapperKeyValue: MapperKeyValueType{
    public var successValue: String = "200"
    
    public var statusCodeKey: String = "code"
    
    public var msgStrKey: String = "message"
    
    public var modelKey: String = "data"
    
    
}


