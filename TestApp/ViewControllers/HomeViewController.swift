//
//  HomeViewController.swift
//  TestApp
//
//  Created by Kaushal Deo on 8/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [[CollectionViewCellType]] = .init()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var array: [CollectionViewCellType] = .init()
        array.append(ButtonViewCell.self)
        array.append(PlaceViewCell.self)
        array.append(PlaceViewCell.self)
        array.append(PlaceViewCell.self)
        self.items.append(array)
        
        array = .init()
        array.append(ButtonViewCell.self)
        array.append(PlaceViewCell.self)
        array.append(PlaceViewCell.self)
        array.append(PlaceViewCell.self)
        self.items.append(array)
        
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

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = self.items[indexPath.section][indexPath.row]
        let cell = collectionView.dequeueReusableCell(type: type, for: indexPath)
        return cell
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    var insets = UIEdgeInsets.zero
        if section != 0 {
            insets.top = 20.0
        }
        return insets
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(fileURLWithPath: LogFile.current.path)
        
        let shareSheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        //shareSheet.setValue("Log", forKey: s)
        self.present(shareSheet, animated: true, completion: nil)
    }
}
