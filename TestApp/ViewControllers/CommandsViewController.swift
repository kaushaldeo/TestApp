//
//  CommandsViewController.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/22/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout


struct Section {
    let header: String
    var items: [Row]
}

struct Row {
    let type: CollectionViewCellType
    let value: Int
}

class CommandsViewController: UICollectionViewController {
    
    var sections = [Section]()
    
    
    func updateData() {
        
        var section = Section(header: "Vehicle", items: [
            Row(type: VehicleLocationViewCell.self, value: 0),
            Row(type: VehicleViewCell.self, value: 0)
        ])
        self.sections.append(section)
        
        //Generic pop configuration
        section = Section(header: "Generic Popup", items: [
            Row(type: PopupViewCell.self, value: 0)
        ])
        self.sections.append(section)
        
        //Health
        section = Section(header: "Health", items:  [
            Row(type: HealthViewCell.self, value: 0)
        ])
        self.sections.append(section)
        
        //Recent
        section = Section(header: "Recent Destinations", items: Array(repeating: 0, count: 3).map({ Row(type: PlaceViewCell.self, value: $0) }))
        self.sections.append(section)
        
        //Predictions
        section = Section(header: "Predictions", items: Array(repeating: 0, count: 3).map({ Row(type: PlaceViewCell.self, value: $0) }))
        self.sections.append(section)
        
        
        
    }
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.updateData()
        self.collectionView.reloadData()
    }
    
    // MARK: Collection view data source
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = self.sections[indexPath.section].items[indexPath.row].type
        let cell = collectionView.dequeueReusableCell(type: type, for: indexPath)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterView", for: indexPath)
            return footerView
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableHeaderView(type: CommandHeaderView.self, for: indexPath)
            headerView.nameLabel.text = self.sections[indexPath.section].header
            return headerView
        default:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Cell", for: indexPath)
            return headerView
        }
    }
    
    /*
     // MARK: Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CommandsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height = section == collectionView.numberOfSections - 1 ? 0 : 4
        return CGSize(width: 0, height: height)
    }
}
