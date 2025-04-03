//
//  CoordinatorProtocol.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] {get set}
    var navigationController: UINavigationController {get set}
    func start()
}
