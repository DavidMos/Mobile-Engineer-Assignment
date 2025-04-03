//
//  MainCoordinator.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController = UINavigationController()
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeCoordinatr = HomeCoordinator()
        homeCoordinatr.start()
        childCoordinators.append(homeCoordinatr)
        
        let favoritesCoordinatr = FavoritesCoordinator()
        favoritesCoordinatr.start()
        childCoordinators.append(favoritesCoordinatr)
        
        let settingsCoordinatr = SettingsCoordinator()
        settingsCoordinatr.start()
        childCoordinators.append(settingsCoordinatr)
        
        
        let initView = MainViewController(vc: [homeCoordinatr.navigationController, favoritesCoordinatr.navigationController, settingsCoordinatr.navigationController], nibName: MainViewController.name, bundle: nil)
        navigationController = UINavigationController(rootViewController: initView)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}
