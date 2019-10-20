//
//  ActionsViewController.swift
//  TestApp
//
//  Created by Kaushal Deo on 10/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit


enum ActionType: CaseIterable {
    case poi
    case poiImage
    case poiSearch
    case popup
    case popupImage
    case popupImageAndText
    case health
    case predictions
    case location
    
    var title: String {
        switch self {
        case .poi:
            return "Send POI"
        case .poiImage:
            return "POI with Image"
        case .poiSearch:
            return "Search POI"
        case .popup:
            return "Generic pop-up"
        case .popupImage:
            return "Image pop-up"
        case .popupImageAndText:
            return "Arrival pop-up"
        case .health:
            return "Show Health"
        case .predictions:
            return "Show Predictions"
        case .location:
            return "Show vehicle location"
        }
    }
}



class ActionsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var actionHeaderView: ActionHeaderView!
    
    var actions = ActionType.allCases
    
    //MARK: View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension ActionsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: ActionViewCell.self, for: indexPath)
        cell.nameLabel.text = self.actions[indexPath.row].title
        return cell
    }
}


extension ActionsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
