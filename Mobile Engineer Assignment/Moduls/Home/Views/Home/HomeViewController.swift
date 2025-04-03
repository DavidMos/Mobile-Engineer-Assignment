//
//  HomeViewController.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Private Variables
    private var viewModel: HomeViewModel
    private var coordinator: HomeCoordinator
    private var cancellables = Set<AnyCancellable>()
    
    
    
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
        bideProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: Privaet Methods
    private func bideProperties() {
        viewModel.$selectedExchanges
            .receive(on: DispatchQueue.main)
            .sink { [weak self] exchanges in
                self?.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
            .store(in: &cancellables)
    }
    
    private func setupView() {
        tableView.register(UINib(nibName: ExchangeTableViewCell.name, bundle: nil), forCellReuseIdentifier: ExchangeTableViewCell.name)
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    @objc private func deleteAction(sender: UIButton) {
        let index = sender.tag
        viewModel.deselectWithId(id: viewModel.selectedExchanges[index].id)
    }
    
    //MARK: IBActions
    @IBAction func addcurencyAction(_ sender: UIButton) {
        coordinator.pushToAddAsset()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.selectedExchanges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeTableViewCell.name, for: indexPath) as? ExchangeTableViewCell {
            let exchage = viewModel.selectedExchanges[indexPath.row]
            if let img = UIImage(systemName: exchage.img) {
                cell.imgView.image = img
            } else {
                cell.imgView.image = UIImage(systemName: "circle.fill")
            }
            cell.curensyLbl.text = exchage.code
            cell.curencyDescLbl.text = exchage.description
            cell.rateLbl.text = String(format: "%.2f", exchage.rate)
            cell.lablesStackView.isHidden = false
            cell.selectBtn.isHidden = true
            cell.deletebtn.removeTarget(self, action: nil, for: .allEvents)
            cell.deletebtn.tag = indexPath.row
            cell.deletebtn.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
