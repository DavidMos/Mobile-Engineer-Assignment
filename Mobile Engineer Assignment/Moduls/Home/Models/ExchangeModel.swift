//
//  ExchangeModel.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import Foundation

struct ExchangeModel: Codable {
    var id: String = UUID().uuidString
    let code: String
    let description: String
    var rate: Double
    var img: String
    var type: String
    var isSelected: Bool = false
    
    mutating func toggleSelection() {
        isSelected = !isSelected
    }
}
