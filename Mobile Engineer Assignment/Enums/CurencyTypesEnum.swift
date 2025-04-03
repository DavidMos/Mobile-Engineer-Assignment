//
//  CurencyTypesEnum.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

enum CurencyTypesEnum: Int {
    case currency = 0
    case cripto
    
    var name: String {
        switch self {
        case .currency:
            return "CURRENCIES"
        case .cripto:
            return "CRYPTOCURRENCIES"
        }
    }
}
