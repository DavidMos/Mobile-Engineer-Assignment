//
//  SettingsCoordinator.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class SettingsCoordinator: CoordinatorProtocol {
    
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController = UINavigationController()
    
    func start() {
        let settingsViewModel = SettingsViewModel()
        
        let settingsVC = SettingViewController(coordinator: self, viewModel: settingsViewModel, nibName: SettingViewController.name, bundle: nil)
        navigationController = UINavigationController(rootViewController: settingsVC)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}
