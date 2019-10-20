//
//  MapsViewController.swift
//  TestApp
//
//  Created by Kaushal Deo on 10/20/19.
//  Copyright © 2019 Scorpion. All rights reserved.
//

import UIKit
import MapKit


class MapsViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapSearchView: MapSearchView!
    
    //MARK: View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(MapsViewController.handleKeyboardDidChangeState(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
            
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func handleKeyboardDidChangeState(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo, let startFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect else { return }
        guard !startFrame.isEmpty || UIDevice.current.userInterfaceIdiom != .pad else {
            // WORKAROUND for what seems to be a bug in iPad's keyboard handling in iOS 11: we receive an extra spurious frame change
            // notification when undocking the keyboard, with a zero starting frame and an incorrect end frame. The workaround is to
            // ignore this notification.
            return
        }
        
        guard let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let frame = self.view.convert(endFrame, from: self.view.window)
        let duration: TimeInterval = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
        print("Kaushal",frame, frame.minY, self.view.height)
        var height = self.mapSearchView.searchBar.height
        if let window = UIApplication.shared.keyWindow, frame.minY == self.view.height {
            height += window.safeAreaInsets.bottom
        }
        else {
            height += frame.height
        }
        self.mapSearchView.update(height: height, duration: duration)
    }
}



extension MapsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
