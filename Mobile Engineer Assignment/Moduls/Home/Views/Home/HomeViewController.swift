//
//  HomeViewController.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Private Variables
    private var viewModel: HomeViewModel
    private var coordinator: HomeCoordinator
    
    
    
    //MARK: INIT
    init(coordinator: HomeCoordinator, viewModel: HomeViewModel, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
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
        setupView()
        viewModel.fetchExchanges()
    }
    
    //MARK: Privaet Methods
    private func setupView() {
        
    }
    
    //MARK: IBActions
    @IBAction func addcurencyAction(_ sender: UIButton) {
        
    }
    
}
