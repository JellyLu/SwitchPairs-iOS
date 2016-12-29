//
//  mainViewModel.swift
//  SwitchPair
//
//  Created by Yangjie Lu on 10/13/16.
//  Copyright © 2016 Lu. All rights reserved.
//
import Foundation

class MainViewModel {
    private var allCoders: [NameCellModel] = []
    private var filterCoders: [NameCellModel] = []

    init() {
        self.allCoders = [
            NameCellModel(name: "Yang", isSelected: false),
            NameCellModel(name: "Jie", isSelected: false),
            NameCellModel(name: "Yangjie", isSelected: false)
        ]
    }

    func getCodersCount() -> Int {
        return allCoders.count
    }

    func getFilterCodersCount() -> Int {
        return filterCoders.count
    }

    func getFilterCoders(text: String) -> [NameCellModel] {
        filterCoders = allCoders.filter({($0.name as NSString).containsString(text)})
        return filterCoders
    }

    func getallCoders() -> [NameCellModel] {
        return allCoders
    }

    func getCodersCount(text: String) -> Int {
        return text == "" ? allCoders.count : filterCoders.count
    }

    func getCoders(text: String) -> [NameCellModel] {
        return text == "" ? allCoders : filterCoders
    }

    func changeCoderState(indexPath: NSIndexPath, text: String = "") {
        if text != "" {
           var coder = filterCoders[indexPath.row]
            coder.isSelected = !coder.isSelected
            allCoders.filter({$0.name == coder.name}).first?.isSelected
        }
        allCoders[indexPath.row].isSelected = !allCoders[indexPath.row].isSelected
    }

    func selectedCoders() -> [NameCellModel] {
        return allCoders.filter({ $0.isSelected })
    }

    func addCoder(coder: NameCellModel) {
        allCoders.append(coder)
    }
}