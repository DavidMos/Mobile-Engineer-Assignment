//
//  ExchangeTableViewCell.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var curensyLbl: UILabel!
    @IBOutlet weak var curencyDescLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var lablesStackView: UIStackView!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var deletebtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
