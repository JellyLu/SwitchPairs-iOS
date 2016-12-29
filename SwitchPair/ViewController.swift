//
//  ViewController.swift
//  SwitchPair
//
//  Created by Yangjie Lu on 10/13/16.
//  Copyright © 2016 Lu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    private var mainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NameCell.register(self.tableView)

    }

    @IBAction func switchPair() {
        let viewModel: SwitchViewModel = SwitchViewModel()
        viewModel.bind(mainViewModel.selectedCoders())
        

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let switchViewController = storyboard.instantiateViewControllerWithIdentifier("SwitchViewController") as! SwitchViewController
        switchViewController.bindViewModel(viewModel)
        self.presentViewController(switchViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: tabelView delegate & data source
    func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.row == mainViewModel.getCodersCount() {
            let cell: AddNameCell = tableView.dequeueReusableCellWithIdentifier(AddNameCell.cellIdentifier, forIndexPath: indexPath) as! AddNameCell
            return cell
        } else {
            let cell: NameCell = tableView.dequeueReusableCellWithIdentifier(NameCell.cellIdentifier, forIndexPath: indexPath) as! NameCell
            cell.bind(mainViewModel.getCoders(searchBar.text ?? "")[indexPath.row])
            return cell
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.getCodersCount(searchBar.text ?? "") + 1
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == mainViewModel.getCodersCount() {
            let name = (tableView.cellForRowAtIndexPath(indexPath) as! AddNameCell).nameText.text ?? ""
            let coder = NameCellModel(name: name, isSelected: false)
            mainViewModel.addCoder(coder)
        } else {
            mainViewModel.changeCoderState(indexPath, text: searchBar.text ?? "")
        }
        tableView.reloadData()
    }

    //MARK: Search Bar Delegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        mainViewModel.getFilterCoders(searchText)
        tableView.reloadData()
    }

}

