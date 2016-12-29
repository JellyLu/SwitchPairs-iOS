//
//  NameCell.swift
//  SwitchPair
//
//  Created by Yangjie Lu on 10/13/16.
//  Copyright © 2016 Lu. All rights reserved.
//

import Foundation
import UIKit

class NameCell: UITableViewCell {

    static let cellIdentifier = "NameCell"

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var checkImageView: UIImageView!

    class func register(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: NameCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: NameCell.cellIdentifier)
    }

    func bind(model: NameCellModel) {
        nameLabel.text = model.name
        checkImageView.hidden = !model.isSelected
    }
}