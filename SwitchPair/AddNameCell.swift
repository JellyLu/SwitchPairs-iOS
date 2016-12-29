//
//  AddNameCell.swift
//  SwitchPair
//
//  Created by Yangjie Lu on 10/16/16.
//  Copyright © 2016 Lu. All rights reserved.
//

import Foundation
import UIKit

class AddNameCell: UITableViewCell {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var nameText: UITextField!
    static let cellIdentifier = "AddNameCell"

    @IBAction func add() {
        print(nameText.text)
    }

    class func register(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: AddNameCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: AddNameCell.cellIdentifier)
    }
}