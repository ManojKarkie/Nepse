//
//  ViewController.swift
//  Nepse
//
//  Created by Rojan on 9/8/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var Images = [UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3"),UIImage(named:"4"),UIImage(named:"5"),UIImage(named:"6"),UIImage(named:"7"),UIImage(named:"8"),UIImage(named:"9")]
    
    var naTitle = ["Dashboard","Floorsheet","Live Trading","Portfolio","Watchlist","Alerts","Indices","Calculator","Support"]
   
    @IBOutlet weak var mainCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            appdelegate?.window?.rootViewController = LGSideMenuWireframe().getMainView()
        default:
            break
        }
    }
}