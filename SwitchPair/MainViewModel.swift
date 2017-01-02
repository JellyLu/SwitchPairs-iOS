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
            NameCellModel(name: "J", isSelected: true),
            NameCellModel(name: "BearClaw", isSelected: true),
            NameCellModel(name: "Zhen", isSelected: true),
            NameCellModel(name: "Yu", isSelected: true),
            NameCellModel(name: "Wen", isSelected: true),
            NameCellModel(name: "Evan", isSelected: true),
            NameCellModel(name: "Siyang", isSelected: true),
            NameCellModel(name: "Funfun", isSelected: true),
            NameCellModel(name: "Bobo", isSelected: false)
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
            filterCoders[indexPath.row].isSelected = !filterCoders[indexPath.row].isSelected
            allCoders = allCoders.map({
                if ($0.name == filterCoders[indexPath.row].name) {
                    return filterCoders[indexPath.row]
                }
                return $0
            })
        } else {
            allCoders[indexPath.row].isSelected = !allCoders[indexPath.row].isSelected
        }
    }

    func selectedCoders() -> [NameCellModel] {
        return allCoders.filter({ $0.isSelected })
    }

    func addCoder(coder: NameCellModel) {
        allCoders.append(coder)
    }
}
