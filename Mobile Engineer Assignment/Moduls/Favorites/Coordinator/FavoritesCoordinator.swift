//
//  FavoritesCoordinator.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class FavoritesCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController = UINavigationController()
    
    func start() {
        let favoritesViewModel = FavoritesViewModel()
        
        let favoritesVC = FavoritesViewController(coordinator: self, viewModel: favoritesViewModel, nibName: FavoritesViewController.name, bundle: nil)
        navigationController = UINavigationController(rootViewController: favoritesVC)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}
