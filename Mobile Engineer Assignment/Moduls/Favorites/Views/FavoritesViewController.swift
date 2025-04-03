//
//  FavoritesViewController.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class FavoritesViewController: UIViewController {

    //MARK: Private Variables
    private var viewModel: FavoritesViewModel
    private var coordinator: FavoritesCoordinator
    
    
    
    //MARK: INIT
    init(coordinator: FavoritesCoordinator, viewModel: FavoritesViewModel, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
