//
//  HomeAPI.swift
//  LXSH
//
//  Created by guxiang on 2021/6/2.
//

import Moya


enum HomeAPI {
    case NewHomeLoad(parmDic : [String:Any])
}

extension HomeAPI: TargetType{
    var baseURL: URL {
        return URL(string: "http://bd-api.kuwo.cn/api/service/category/rec")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        "".data(using: .utf8)!
    }
    
    var task: Task {        
        switch self {
            case .NewHomeLoad(let parm):
                return .requestParameters(parameters: parm, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["appuid":"132556570707",
         "channel":"appstore",
         "devid":"C0072B2A-ED2A-4C70-91E5-8D87D2BA8A55",
         "brand":"iPhone13,2",
         "plat":"ip",
         "ver":"1.2.4"]
    }
    
    
}
