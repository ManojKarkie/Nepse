//
//  ViewController.swift
//  Nepse
//
//  Created by Rojan on 9/8/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var Images = [#imageLiteral(resourceName: "Dashboard"),#imageLiteral(resourceName: "Floorsheet"), #imageLiteral(resourceName: "LiveTrading"),#imageLiteral(resourceName: "Portfolio"),#imageLiteral(resourceName: "watchlist"),#imageLiteral(resourceName: "CompanyProfile"),#imageLiteral(resourceName: "Indices"),#imageLiteral(resourceName: "Calculator"),#imageLiteral(resourceName: "support")]
    
    var naTitle = ["Dashboard","Floorsheet","Live Trading","Portfolio","Watchlist","Alerts","Indices","Calculator","Support"]
   
    @IBOutlet weak var mainCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Main"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.mainImage.image = Images[indexPath.row]
        cell.mainTitle.text! = naTitle[indexPath.row]
        cell.setup()
        return cell
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(Wireframe.shared.getDashboard(), animated: true)
        case 1:
            self.navigationController?.pushViewController(Wireframe.shared.getFloorsheet(), animated: true)
        case 2:
            self.navigationController?.pushViewController(Wireframe.shared.getLiveTrading(), animated: true)
        case 3:
            self.navigationController?.pushViewController(Wireframe.shared.getLogin(), animated: true)
            break
        case 4:
            self.navigationController?.pushViewController(Wireframe.shared.getWatchList(), animated: true)
        default:
            break
        }
    }
}
