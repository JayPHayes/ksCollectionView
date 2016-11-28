//
//  ksMasterListCollectionViewController.swift
//  ksCollectionView
//
//  Created by Jay P. Hayes on 11/12/16.
//  Copyright © 2016 Jay P. Hayes. All rights reserved....
//


import UIKit

class ksMasterListCollectionViewController: UICollectionViewController {
    
    //Collection View Layout
    private let leftAndRightPadding: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heightAdjustment: CGFloat = 30.0
    
    
    
    
    // Datasource
    var shoppingList = ["Bread", "Ketchup", "Mayonaise", "Clorox", "Washing Power", "Rice", "Eggs", "Chicken"]
    var shoppingItems = [UIImage]()
    var selectedItem = UIImage()
    
    //MARK: - UIView Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = (collectionView!.frame.width - leftAndRightPadding) / numberOfItemsPerRow
        //let width = (CGRectWidth(collectionView!.frame) - leftAndRightPadding) / numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
//        layout.itemSize = CGSizeMake(width, width + heightAdjustment) 
        layout.itemSize = CGSize(width: width, height: width + heightAdjustment)
        
        
        for i in 1...15 {
            let item = UIImage(named: "\(i).jpg")
            print("\(i).jpg")
            shoppingItems.append(item!)
        }
    }
    
    
    //MARK: - UICollection View Datasource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    private struct StoryBoard {
        static let CellIdentifier = "cell"
        static let showDetails = "showDetails"
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.CellIdentifier, for: indexPath) as! ksMasterListCollectionViewCell
        
        cell.lblItemName.text = "Item \(indexPath.row)"
//        cell.lblItemDesc.text = "long description for item \(indexPath.row)"
        cell.imgItem.image = shoppingItems[indexPath.row]
        
        return cell
    }
    
    
    //MARK: UICollection View Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = shoppingItems[indexPath.row]
//        self.selectedItem = item
//        self.performSegue(withIdentifier: StoryBoard.showDetails, sender: item)
        
//        var cell = collectionView.cellForItemAtIndexPath(indexPath);
        let cell = collectionView.cellForItem(at: indexPath)
        
        self.self.performSegue(withIdentifier: StoryBoard.showDetails, sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == StoryBoard.showDetails {
            let detailVC = segue.destination as! ksDetailViewController
            
//            self.collectionView?.indexPathForCell(sender as! ksMasterListCollectionViewCell)
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! ksMasterListCollectionViewCell) {
                print("Index Path: \(indexPath.row)")
                print(shoppingItems[indexPath.row])
                let selectedItem = shoppingItems[indexPath.row]
                
                detailVC.itemId = indexPath.row
                detailVC.item = selectedItem
            }
            
//            detailVC.imgItem.image = selectedItem
            
        }
        
    }

    
}


























