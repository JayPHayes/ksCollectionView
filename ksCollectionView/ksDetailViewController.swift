//
//  ksDetailViewController.swift
//  ksCollectionView
//
//  Created by Jay P. Hayes on 11/12/16.
//  Copyright © 2016 Jay P. Hayes. All rights reserved.
//

import UIKit

class ksDetailViewController: UIViewController {

    var newImage: UIImage!
    var item: UIImage!
    var itemId: Int = 0
    
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgItem.image = item
        lblItemName.text = "Item \(itemId)"
        lblItemDesc.text = "long description for item \(itemId)"
        
    }




    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
 

}
