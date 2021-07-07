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
        return URL(string: "https://www.oneoff.net/index.php")!
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
        var parmetars = [String:Any]()
        parmetars["m"] = "api"
        parmetars["c"] = "apimap"
        
        
        switch self {
            case .NewHomeLoad(let parm):
                for (key,value) in parm.reversed() {
                    parmetars[key] = value
                }
                return .requestParameters(parameters: parmetars, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
