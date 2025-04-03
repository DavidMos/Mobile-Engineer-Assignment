//
//  ExchangeRateManager.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

protocol ExchangeRateManagerProtocol {
    func loadAssets() throws -> [ExchangeModel]
}

class ExchangeRateManager: ExchangeRateManagerProtocol {
    func loadAssets() throws -> [ExchangeModel] {
        return [ExchangeModel(code: "USD", description: "US Dollar", rate: 1.0, img: "dollarsign.circle.fill", type: CurencyTypesEnum.currency.name),
                ExchangeModel(code: "EUR", description: "Euro", rate: 0.9, img: "eurosign.circle.fill", type: CurencyTypesEnum.currency.name),
                ExchangeModel(code: "GBP", description: "British Pound", rate: 1.2003, img: "sterlingsign.circle.fill", type: CurencyTypesEnum.currency.name),
                ExchangeModel(code: "JPY", description: "Japanese Yen", rate: 133.65, img: "yensign.circle.fill", type: CurencyTypesEnum.currency.name),
                ExchangeModel(code: "AUD", description: "Australian Dollar", rate: 1.4500, img: "dollarsign.circle.fill", type: CurencyTypesEnum.currency.name),
                ExchangeModel(code: "BTC", description: "Bitcoin", rate: 27150.00, img: "bitcoinsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "ETH", description: "Ethereum", rate: 1800.00, img: "ethsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "LTC", description: "Litecoin", rate: 90.00, img: "ltcsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "XRP", description: "Ripple", rate: 0.50, img: "xrpsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "BCH", description: "Bitcoin Cash", rate: 300.00, img: "bchsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "ADA", description: "Cardano", rate: 0.35, img: "adasign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "DOT", description: "Polkadot", rate: 6.50, img: "dotsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "BNB", description: "Binance Coin", rate: 310.00, img: "bnbsign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "DOGE", description: "Dogecoin", rate: 0.10, img: "dogesign.circle.fill", type: CurencyTypesEnum.cripto.name),
                ExchangeModel(code: "SOL", description: "Solana", rate: 20.00, img: "solsign.circle.fill", type: CurencyTypesEnum.cripto.name)
        ]
    }
}
