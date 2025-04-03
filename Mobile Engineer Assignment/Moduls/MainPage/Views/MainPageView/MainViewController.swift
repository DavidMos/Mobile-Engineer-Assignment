//
//  MainViewController.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var homeImgView: UIImageView!
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var favoriteImgView: UIImageView!
    @IBOutlet weak var favoriteLbl: UILabel!
    @IBOutlet weak var settingsImgView: UIImageView!
    @IBOutlet weak var settingsLbl: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    
    private var vc: [UIViewController]
    private var vcIndex: Int = 0
    private var pageViewController = UIPageViewController()
    
    //MARK: Init
    init(vc: [UIViewController], nibName: String?, bundle: Bundle?) {
        self.vc = vc
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Privaet Methods
    
    private func setupView() {
        guard let pageView = pageViewController.view else {return}
        addChild(pageViewController)
        contentView.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        pageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        pageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        pageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        pageViewController.didMove(toParent: self)
        
        if !vc.isEmpty {
            pageViewController.setViewControllers([vc[vcIndex]], direction: .forward, animated: false)
        }
    }

    //MARK: IBActions
    
    @IBAction func tabAction(_ sender: UIButton) {
        
        homeImgView.tintColor = .lightGray
        homeLbl.textColor = .lightGray
        favoriteImgView.tintColor = .lightGray
        favoriteLbl.textColor = .lightGray
        settingsImgView.tintColor = .lightGray
        settingsLbl.textColor = .lightGray
        
        switch TabBarElementsEnum(rawValue: sender.tag) {
        case .home:
            homeImgView.tintColor = .black
            homeLbl.textColor = .black
        case .favorites:
            favoriteImgView.tintColor = .black
            favoriteLbl.textColor = .black
        case .settings:
            settingsImgView.tintColor = .black
            settingsLbl.textColor = .black
        default:
            break
        }
        
        pageViewController.setViewControllers([vc[sender.tag]], direction: .forward, animated: false)
    }
    
}
