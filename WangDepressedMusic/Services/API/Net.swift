//
//  Net.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/8.
//

import Foundation


class OnlineProvider<Target> where Target : Moya.TargetType {
    fileprivate let online: Observable<Bool>
    fileprivate let provider: MoyaProvider<Target>
    
    init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider<Target>.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider<Target>.neverStub,
         session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
         plugins: [PluginType] = [],
         trackInflights: Bool = false,
         online: Observable<Bool> = connectedToInternet()) {
        self.online = online
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, session: session, plugins: plugins, trackInflights: trackInflights)
    }
    
    func request(_ token: Target) -> Observable<Moya.Response>{
        let request = provider.rx.request(token)
         
        
        
        return online.take(1)
            .flatMap { _ in
                return request.filterSuccessfulStatusCodes()
                    .do(onSuccess: { (response) in
                        
                    }, onError: { (error) in
                        
                    })
            }
    }
    
}



