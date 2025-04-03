//
//  HomeCoordinator.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class HomeCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController = UINavigationController()
    var homeViewModel: HomeViewModel
    
    init() {
        let exchangeManager = ExchangeRateManager()
        let homeRepository = HomeRepository(exchangeManager: exchangeManager)
        homeViewModel = HomeViewModel(repository: homeRepository)
    }
    
    func start() {
        let homeVC = HomeViewController(coordinator: self, viewModel: homeViewModel, nibName: HomeViewController.name, bundle: nil)
        navigationController = UINavigationController(rootViewController: homeVC)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func pushToAddAsset() {
        let assetsVC = AddAssetsViewController(coordinator: self, viewModel: homeViewModel, nibName: AddAssetsViewController.name, bundle: nil)
        navigationController.pushViewController(assetsVC, animated: true)
    }
    
}
