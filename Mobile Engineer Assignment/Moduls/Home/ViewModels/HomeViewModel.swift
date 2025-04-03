//
//  HomeViewModel.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import Foundation
import Combine

final class HomeViewModel {
    
    //MARK:
    var repository: HomeRepositoryProtocol
    var cancellables = Set<AnyCancellable>()
    private var timer: AnyCancellable?
    
    // Publishers
    @Published var exchanges: [ExchangeModel] = []
    @Published var cryptoExchanges: [ExchangeModel] = []
    @Published var currencyExchanges: [ExchangeModel] = []
    @Published var selectedExchanges: [ExchangeModel] = []
    @Published var errorStr: String = ""
    
    @Published var searchQuery: String = ""
    
    var filteredExchangeList: AnyPublisher<[ExchangeModel], Never> {
        return Publishers.CombineLatest($exchanges, $searchQuery).map { exchanges, query in
            guard !query.isEmpty else { return exchanges }
            return exchanges.filter { $0.code.lowercased().contains(query.lowercased()) || $0.description.lowercased().contains(query.lowercased()) }
        }.eraseToAnyPublisher()
    }
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
        fetchExchanges()
    }
    
    //MARK: Privaet Methods
    
    func deselectWithId(id: String) {
        if let findedIndex = exchanges.firstIndex(where: { $0.id == id }) {
            exchanges[findedIndex].toggleSelection()
        }
        saveData()
        sortExchanges()
    }
    
    // Core Data is best approach for saving data, because it is more accurate and user defaults is limited in storage size, i only have a 2-3 hours to manage this task that's why i didn't make saving proces with core data
    private func saveData() {
        var dataArray = [Data]()
        for exchange in exchanges {
            do {
                try dataArray.append(JSONEncoder().encode(exchange))
            } catch {
                // handle encoding error
            }
        }
        UserDefaults.standard.set(dataArray, forKey: UserDefaultsKeys.exchanges.rawValue)
    }
    
    private func fetchExchanges() {
        do {
            exchanges = try repository.fetchExchanges()
            saveData()
            sortExchanges()
            startTimer()
        } catch {
            // we can handle here diferent type of errors like network errors or encoding or decoding erros
            errorStr = error.localizedDescription
        }
    }
    
    private func sortExchanges() {
        cryptoExchanges = exchanges.filter({ $0.type == CurencyTypesEnum.cripto.name})
        currencyExchanges = exchanges.filter({ $0.type == CurencyTypesEnum.currency.name})
        selectedExchanges = exchanges.filter({ $0.isSelected })
    }

    private func startTimer() {
        timer = Timer.publish(every: 3.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateRates()
            }
    }
    
    private func updateRates() {
        for index in exchanges.indices {
            // Simulate a small random change in the rate.
            let randomFactor = Double.random(in: 0.81...1.91)
            exchanges[index].rate = randomFactor
        }
        sortExchanges()
    }
}
