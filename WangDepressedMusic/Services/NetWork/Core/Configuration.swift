//
//  Configuration.swift
//  LXSH
//
//  Created by guxiang on 2021/6/2.
//

import Moya

public extension Network{
    class Configuration {
        public static var `default` : Configuration = Configuration()
        
        public var addHeaders: (TargetType) -> [String: String] = { _ in [:]}
        
        public var replacingTask: (TargetType) -> Task = {$0.task}
        
        public var timeoutInterval: TimeInterval = 60
        
        public var plugins: [PluginType] = [NetworkLoggerPlugin()]
        
        public var mapperKeyValue: MapperKeyValueType = DefaultMapperKeyValue()
        
        public var logEnable: Bool = true
        
        public init(){}
    }
}
