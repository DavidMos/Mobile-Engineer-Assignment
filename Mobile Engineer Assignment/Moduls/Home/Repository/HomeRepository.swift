//
//  HomeRepository.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import Foundation

protocol HomeRepositoryProtocol {
    func fetchExchanges() throws -> [ExchangeModel]
    var exchangeManager: ExchangeRateManagerProtocol { get set }
}

class HomeRepository: HomeRepositoryProtocol {
    
    var exchangeManager: ExchangeRateManagerProtocol
    
    init(exchangeManager: ExchangeRateManagerProtocol) {
        self.exchangeManager = exchangeManager
    }
    
    func fetchExchanges() throws -> [ExchangeModel] {
        if let dataArray: [Data] = UserDefaults.standard.array(forKey: UserDefaultsKeys.exchanges.rawValue) as? [Data] {
            var result = [ExchangeModel]()
            for data in dataArray {
                try result.append(JSONDecoder().decode(ExchangeModel.self, from: data))
            }
            return result
        } else {
            return try exchangeManager.loadAssets()
        }
    }
}
