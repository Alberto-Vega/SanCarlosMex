//
//  HotelsViewController.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 8/19/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import CoreLocation
import UIKit

class HotelsViewController: UIViewController, UITableViewDelegate, UISearchControllerDelegate {

    @IBOutlet weak var hotelSearchBar: UISearchBar!
    @IBOutlet weak var hotelTableView: UITableView!
    @IBOutlet weak var sortedByLabel: UILabel!
    
    let searchController = UISearchController()
    let popoverOptions = PopoverOptions(items: ["sort by distance", "sort by rating", "sort by class"], images: [nil])
    
    var popover: Popover!
    var optionsTable:UITableView!
    var backButton: UIBarButtonItem?
    
    var hotels = [Hotel]() {
        didSet {
            DispatchQueue.main.async(execute: { () -> Void in
                self.hotelTableView.reloadData()
            })
        }
    }
    
    var selectedHotelId:String?
    
    var cache = Dictionary<String,UIImage>(minimumCapacity: 26)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelSearchBar.delegate = self
        print("Locality was set on second vc")
        
        ExpediaAPI.searchHotelsBy(city: "San Carlos Nuevo Guaymas".condensedWhitespace, checkInDate: "2016-12-01", checkOutDate: "2016-12-03", room: "2") { (success, data) in
//            print(data!)
            guard let data = data else { print("data returned in the closure is nil"); return }
            if let hotelResults = ExpediaJSONService.parseHotelSearchByCity(JSON: data) {
                DispatchQueue.main.async {
                    if self.hotels.isEmpty {
                        self.hotels = hotelResults
                    } else {
                        self.hotels.removeAll()
                        self.hotels = hotelResults
                    }
                }
            }
        }
        
        
        setupTableView()
        setupPopoverTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.hotelTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func backButtonPressed(sender:UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Helper Functions
    
    func setupPopoverTableView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130))
        tableView.delegate = self.popoverOptions
        tableView.dataSource = self.popoverOptions
        tableView.separatorStyle = .none
        
        tableView.isScrollEnabled = false
        self.optionsTable = tableView
    }
    
    func setupTableView() {
        self.hotelTableView.delegate = self
        self.hotelTableView.dataSource = self
        self.hotelTableView.rowHeight = UITableViewAutomaticDimension
        self.hotelTableView.estimatedRowHeight = 160

        
        let nib = UINib(nibName: "HotelSearchTableViewCell", bundle: nil)
        
        hotelTableView.register(nib, forCellReuseIdentifier: "HotelSearchTableViewCell")
    }
    
    // MARK: - Navigation
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HotelDetailViewController" {
//            let hotelDetailViewController = segue.destination as! HotelDetailViewController
//            hotelDetailViewController.selectedHotelId = self.selectedHotelId
        }
    }
}

// MARK: - Table View Data Source

extension HotelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hotels.count
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "HotelSearchTableViewCell", for: indexPath as IndexPath) as! HotelSearchTableViewCell
        let hotel = hotels[indexPath.row]
        cell.hotelName.text = hotel.name
        if let starRating = hotel.starRating {
            cell.hotelStarRating.text = "\(starRating) of 5 stars"
        }
        
        if let distance = hotel.distance {
            //            cell.hotelDistanceLabel.text = "\(distance)"
            cell.hotelDistanceLabel.text = String(format: "%.1f", distance) + " miles"
        }
        
        if let imageUrl = hotel.thumbnailImageUrl, let id = hotel.id {
            if cache[id] != nil {
                cell.hotelThumbnail.image = cache[id]
            } else {
                Networking.sharedInstance.downloadImageAtUrl(strUrl: imageUrl, completionHandler: { (result) in
                    if let result = result {
                        DispatchQueue.main.async {
                            cell.hotelThumbnail.image = result
                            self.cache[id] = result
                        }
                    }
                })
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedHotelId = hotels[indexPath.row].id
        performSegue(withIdentifier: "HotelDetailViewController", sender: nil)
    }
    
    @IBAction func onMoreOptions(sender:AnyObject) {
        //        let but = sender as! MoreOptionsButton
        
        //        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 130))
        //        tableView.delegate = self.popoverOptions
        //        tableView.dataSource = self.popoverOptions
        //        tableView.separatorStyle = .None
        //
        //        tableView.scrollEnabled = false
        //        let popover = Popover(options: [], showHandler: nil, dismissHandler: nil)
        
        self.popoverOptions.selectedIndex = sender.tag
        
        popover = Popover(options: [], showHandler: nil, dismissHandler: nil)
        
        popoverOptions.onSelectItem = { index in
            print("popover index = \(index)")
            self.popover.dismiss()
            
            switch index {
            case 0: // sort by distance
                //                self.hotels.sortInPlace({ ($0.distance < $1.distance)})
                self.hotelTableView.reloadData()
                self.sortedByLabel.text = "hotels by distance."
                break
                
            case 1: // sort by star rating.
                
                //                self.hotels.sortInPlace({ ($0.starRating > $1.starRating)})
                self.hotelTableView.reloadData()
                self.sortedByLabel.text = "hotels by star rating."
                
                break
            case 2: // sort by class.
                //                self.hotels.sortInPlace({ ($0.hotelGuestRating > $1.hotelGuestRating)})
                self.hotelTableView.reloadData()
                self.sortedByLabel.text = "hotels by guest rating."
                
                break
            default:
                break
            }
        }
        //        popover.show(self.optionsTable, fromView: sender as! UIView)
    }
}

// MARK: - Search Bar Delegate Protocol.

extension HotelsViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        //        let autocompleteController = GMSAutocompleteViewController()
        //        autocompleteController.delegate = self
        
        //        self.presentViewController(autocompleteController, animated: true, completion: nil)
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

// MARK: - GMSAutocompleteVC Delegate Protocol.

//extension HotelsViewController: GMSAutocompleteViewControllerDelegate {
//    // Handle the user's selection.
//    func viewController(viewController: GMSAutocompleteViewController, didAutocompleteWithPlace place: GMSPlace) {
//        print("Place name: ", place.name)
//        print("Place address: ", place.formattedAddress)
//        print("Place attributions: ", place.attributions)
//
//        ExpediaAPI.searchHotelsBy(place.name.condensedWhitespace, checkInDate: "2017-12-01", checkOutDate: "2017-12-03", room: "2") { (success, data) in
//            print(data)
//            guard let data = data else { print("data returned in the closure is nil"); return }
//            if let hotelResults = ExpediaJSONService.parseHotelSearchByCity(data) {
//                dispatch_async(dispatch_get_main_queue()) {
//
//                if self.hotels.isEmpty {
//                    self.hotels = hotelResults
//                } else {
//                    self.hotels.removeAll()
//                    self.hotels = hotelResults
//                }
//                }
//            }
//        }
//        hotelSearchBar.text = place.name
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//
//    func viewController(viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: NSError) {
//        // TODO: handle the error.
//        print("Error: ", error.description)
//    }
//
//    // User canceled the operation.
//    func wasCancelled(viewController: GMSAutocompleteViewController) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//
//    // Turn the network activity indicator on and off again.
//    func didRequestAutocompletePredictions(viewController: GMSAutocompleteViewController) {
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//    }
//
//    func didUpdateAutocompletePredictions(viewController: GMSAutocompleteViewController) {
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//    }
//
//}

class PopoverOptions: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var items:[String] = []
    private var images:[UIImage?] = []
    
    init(items:[String], images:[UIImage?]) {
        self.items = items
        self.images = images
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.selectionStyle = .none
        cell!.textLabel!.text = items[indexPath.row]
        if self.images.isEmpty != false {
            if let img = self.images[indexPath.row] {
                cell!.imageView?.image = img
            }
        }
        return cell!
    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//        
//        cell?.selectionStyle = .none
//        cell!.textLabel!.text = items[indexPath.row]
//        if self.images.isEmpty != false {
//            if let img = self.images[indexPath.row] {
//                cell!.imageView?.image = img
//            }
//        }
//        return cell!
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectItem?(indexPath.row)
    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        onSelectItem?(indexPath.row)
//    }
    var selectedIndex:Int?
    var onSelectItem:((_ index:Int)->Void)?
}

extension String {
    var condensedWhitespace: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: "%20")
    }
}
