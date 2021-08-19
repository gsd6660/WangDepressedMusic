//
//  ViewModelType.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/18.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype OutPut
    
    func transform(input:Input) -> OutPut
}
