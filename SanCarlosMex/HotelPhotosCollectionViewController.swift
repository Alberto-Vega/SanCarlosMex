//
//  HotelPhotosCollectionViewController.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 8/25/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HotelPhotosCollectionViewController: UICollectionViewController {
    
    var photos:[String]? = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    var cache = Dictionary<String,UIImage>(minimumCapacity: 26)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let photos = photos else { return 0 }
        return photos.count
    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        guard let photos = photos else { print("No photos to present on collection view"); return cell }
        let aPhoto = photos[indexPath.row]
        //        let reference = aPhoto["photo_reference"] as! String
        
        //        let url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(reference)&key= "
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        if cache[aPhoto] != nil {
            imageView.image = cache[aPhoto]
        } else {
            Networking.sharedInstance.downloadImageAtUrl(strUrl: aPhoto) { [weak imageView] (result) in
                DispatchQueue.main.async() {
                    if let result = result {
                        imageView?.image = result
                    }
                }
            }
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}
