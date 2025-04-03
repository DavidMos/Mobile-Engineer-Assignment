//
//  AddAssetsViewController.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit
import Combine

class AddAssetsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: Private Variables
    private var viewModel: HomeViewModel
    private var coordinator: HomeCoordinator
    private var cancellables = Set<AnyCancellable>()
    private var filteredExchanges: [ExchangeModel] = []
    
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
        bindProperties()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: Privaet Methods
    
    private func bindProperties() {
        viewModel.filteredExchangeList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] filteredList in
                self?.filteredExchanges = filteredList
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupView() {
        tableView.register(UINib(nibName: ExchangeTableViewCell.name, bundle: nil), forCellReuseIdentifier: ExchangeTableViewCell.name)
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        searchTextField.text = viewModel.searchQuery
        searchTextField.delegate = self
    }
    
    @objc private func selectExchange(sender: UIButton) {
        var tag = String(sender.tag)
        let sectionChar = tag.first
        tag.removeFirst()
        
        if let sectionChar, let sectionIndexPlusOne = Int("\(sectionChar)"), let rowIndex = Int("\(tag)"), sectionIndexPlusOne - 1 >= 0 {
            let sectionIndex = sectionIndexPlusOne - 1
            switch CurencyTypesEnum(rawValue: sectionIndex) {
            case .currency:
                viewModel.deselectWithId(id: filteredExchanges.filter { $0.type == CurencyTypesEnum.currency.name }[rowIndex].id)
            case .cripto:
                viewModel.deselectWithId(id: filteredExchanges.filter { $0.type == CurencyTypesEnum.cripto.name }[rowIndex].id)
            default:
                break
            }
            tableView.reloadRows(at: [IndexPath(row: rowIndex, section: sectionIndex)], with: .automatic)
        }
    }
    
    //MARK: IBAction
    @IBAction func backAction(_ sender: UIButton) {
        coordinator.navigationController.popViewController(animated: true)
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        coordinator.navigationController.popViewController(animated: true)
    }
    @IBAction func editingChanged(_ sender: UITextField) {
        viewModel.searchQuery = sender.text ?? ""
    }
}

extension AddAssetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return CurencyTypesEnum(rawValue: section)?.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch CurencyTypesEnum(rawValue: section) {
        case .currency:
            return filteredExchanges.filter { $0.type == CurencyTypesEnum.currency.name }.count
        case .cripto:
            return filteredExchanges.filter { $0.type == CurencyTypesEnum.cripto.name }.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeTableViewCell.name, for: indexPath) as? ExchangeTableViewCell else {
            return UITableViewCell()
        }
        
        var exchage: ExchangeModel?
        switch CurencyTypesEnum(rawValue: indexPath.section) {
        case .currency:
            exchage = filteredExchanges.filter { $0.type == CurencyTypesEnum.currency.name }[indexPath.row]
        case .cripto:
            exchage = filteredExchanges.filter { $0.type == CurencyTypesEnum.cripto.name }[indexPath.row]
        default:
            break
        }
        
        guard let exchage else { return UITableViewCell() }
        if let img = UIImage(systemName: exchage.img) {
            cell.imgView.image = img
        } else {
            cell.imgView.image = UIImage(systemName: "circle.fill")
        }
        cell.curensyLbl.text = exchage.code
        cell.curencyDescLbl.text = exchage.description
        cell.rateLbl.text = String(exchage.rate)
        cell.lablesStackView.isHidden = true
        cell.selectBtn.isHidden = false
        if exchage.isSelected {
            cell.selectBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        } else {
            cell.selectBtn.setImage(UIImage(systemName: "circle"), for: .normal)
        }
        cell.selectBtn.removeTarget(self, action: nil, for: .allEvents)
        cell.selectBtn.tag = Int("\(indexPath.section + 1)\(indexPath.row)") ?? -1
        cell.selectBtn.addTarget(self, action: #selector(selectExchange), for: .touchUpInside)
        
        cell.selectionStyle = .none
        return cell
    }
}

extension AddAssetsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
