////
////  HotelDetailViewController.swift
////  Expedia
////
////  Created by Alberto Vega Gonzalez on 8/25/16.
////  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
////
//
//import UIKit
//import SafariServices
//import MapKit
//
//
//class HotelDetailViewController: UIViewController, SFSafariViewControllerDelegate, UIWebViewDelegate {
//    
//    @IBOutlet weak var mainStack: UIStackView!
//    @IBOutlet weak var hotelFeaturedImage: UIImageView!
//    @IBOutlet weak var hotelRatingStack: UIStackView!
//    @IBOutlet weak var addressLabel: UILabel!
//    @IBOutlet weak var hotelNameLabel: UILabel!
//    @IBOutlet weak var containerView: UIView!
//    @IBOutlet weak var directionsButton: UIButton!
//    @IBOutlet weak var callButton: UIButton!
//    private var hotelPhotosVc: HotelPhotosCollectionViewController?
//    private var longDescriptionWebView: UIWebView?
//
//
//    var selectedHotelId: String?
//    var currentHotel: Hotel? {
//        didSet {
//            self.setupFeaturedImage()
//            self.setupTextForLabels()
//            self.setupStarsRating()
//            if let longDescription = currentHotel?.longDescription {
//            self.addLongDescription(longDescription: longDescription)
//            }
//        }
//    }
//    var reviews = [Review]() {
//        didSet {
//            self.addReviews()
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.directionsButton.enabled = true
//
//        if let selectedHotelId = selectedHotelId {
//            
//            Hotel.getHotelWithId(selectedHotelId, completion: { (hotel) in
//                if let hotel = hotel {
//                self.currentHotel = hotel
//                self.hotelPhotosVc?.photos = self.currentHotel?.thumbnailImageUrlList
//                }
//            })
//            
//            Review.getReviewsByHotelId(selectedHotelId, completion: { (reviews) in
//                guard let reviews = reviews else { return }
//                self.reviews = reviews
//            })
//        }
//    }
//    
//    func setupStarsRating() {
//        guard let currentHotel = currentHotel, starRating = currentHotel.starRating else { return }
//        if let hotelRatingDouble = Double(starRating) {
//            let stars = Int(hotelRatingDouble)
//            let starImage = UIImage(named: "startrating")
//            for star in 0...stars {
//                if star > 0 {
//                let starImageView = UIImageView(image: starImage)
//                starImageView.translatesAutoresizingMaskIntoConstraints = false
//                starImageView.heightAnchor.constraintEqualToConstant(14).active = true
//                starImageView.widthAnchor.constraintEqualToConstant(14).active = true
//                hotelRatingStack.addArrangedSubview(starImageView)
//                }
//            }
//        }
//    }
//    
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//    }
//    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func setupTextForLabels() {
//        guard let currentHotel = self.currentHotel, name = currentHotel.name, address = currentHotel.address, city = currentHotel.city, state = currentHotel.hotelStateProvince else { return }
//        self.hotelNameLabel.text = name
//        self.addressLabel.text = "\(address)" + ", " + "\(city)" + ", " +  "\(state)"
//    }
//    
//    func setupFeaturedImage() {
//        if let featuredImageUrl = self.currentHotel?.featuredImageUrl {
//        Networking.sharedInstance.downloadImageAtUrl(featuredImageUrl, completionHandler: { (result) in
////            dispatch_async(dispatch_get_main_queue(), { 
//                self.hotelFeaturedImage.image = result
////            })
//        })
//    }
//    }
//
//    @IBAction func checkPricingButtonPressed(sender: AnyObject) {
//        guard let currentHotel = currentHotel, deepLink = currentHotel.deepLinkUrl else { print("unable to open safari web page hotel deepLinkUrl property is nil"); return }
//        if let url = NSURL(string: deepLink) {
//            let vc = SFSafariViewController(URL: url, entersReaderIfAvailable: false)
//            presentViewController(vc, animated: true, completion: nil)
//            
//        }
//    }
////    @IBAction func onCall(sender: AnyObject) {
////        if let phone = self.phoneNumber?.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()), url = NSURL(string: "tel://\(phone)") {
////            UIApplication.sharedApplication().openURL(url)
////        }
////    }
//    
//    
////    @IBAction func onWebSite(sender: AnyObject) {
////        if let ws = self.webSite, url = NSURL(string: ws) {
////            UIApplication.sharedApplication().openURL(url)
////        }
////    }
//    
//    func addLongDescription(longDescription: String) {
//        longDescriptionWebView = UIWebView()
//        if let longDescriptionWebView = longDescriptionWebView {
//        longDescriptionWebView.translatesAutoresizingMaskIntoConstraints = false
//        longDescriptionWebView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
//        longDescriptionWebView.delegate = self
//        longDescriptionWebView.scrollView.scrollEnabled = false
//        longDescriptionWebView.scalesPageToFit = true
//        longDescriptionWebView.contentMode = .ScaleAspectFit
//        let path = NSURL(fileURLWithPath:NSBundle.mainBundle().bundlePath )
//        longDescriptionWebView.loadHTMLString(longDescription, baseURL: path)
//        
//        // add to main stackView
//        if let aStack = self.mainStack {
//            aStack.addArrangedSubview(longDescriptionWebView)
//            longDescriptionWebView.widthAnchor.constraintEqualToAnchor(aStack.widthAnchor, multiplier: 1).active = true
////            longDescriptionWebView.heightAnchor.constraintEqualToConstant(450).active = true
//            
//         //   Constraint to the collection view
////            longDescriptionWebView.topAnchor.constraintEqualToAnchor(self.containerView.bottomAnchor, constant: 20).active = true
////            longDescriptionWebView.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: .Vertical)
////                        longDescriptionWebView.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: .Horizontal)
//            
////            cardView.bottomAnchor.constraintEqualToAnchor(textLabel.bottomAnchor, constant: 10).active = true
//            
//        }
//        }
//    }
//    func addReviews() {
//        for review in reviews {
//            
//            let cardView = UIView()
//            cardView.translatesAutoresizingMaskIntoConstraints = false
//            // Review title.
//            
//            let titleLabel = UILabel()
//            titleLabel.font = UIFont.boldSystemFontOfSize(18)
//            titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            titleLabel.text = review.title
//            cardView.addSubview(titleLabel)
//            titleLabel.topAnchor.constraintEqualToAnchor(cardView.topAnchor).active = true
//            titleLabel.leftAnchor.constraintEqualToAnchor(cardView.leftAnchor, constant: 20).active = true
//            // name
//            let nameLabel = UILabel()
//            nameLabel.font = UIFont.systemFontOfSize(12)
//            nameLabel.translatesAutoresizingMaskIntoConstraints = false
//            nameLabel.text = review.userNickName
//            cardView.addSubview(nameLabel)
//            nameLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor).active = true
//            nameLabel.leftAnchor.constraintEqualToAnchor(cardView.leftAnchor, constant: 20).active = true
//            
//            // time
//            let timeLabel = UILabel()
//            timeLabel.translatesAutoresizingMaskIntoConstraints = false
//            timeLabel.font = UIFont.systemFontOfSize(12)
//            timeLabel.textColor = UIColor.grayColor()
//            cardView.addSubview(timeLabel)
//            timeLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor).active = true
//            timeLabel.leftAnchor.constraintEqualToAnchor(nameLabel.rightAnchor, constant: 10).active = true
////            let date = NSDate(timeIntervalSince1970: NSTimeInterval(aReview["time"] as! Int))
////            let fmt = NSDateFormatter()
////            fmt.dateStyle = .ShortStyle
////            fmt.timeStyle = .NoStyle
//////            timeLabel.text = fmt.stringFromDate(date)
//            
//            
//            timeLabel.text = review.date
//            // rating
//            
//            let attrStr = NSMutableAttributedString()
//            if let rating = review.ratingOverall {
//                
//                for i in 1...5 {
//                    let attachment = NSTextAttachment()
//                    if i <= rating {
//                        // The image name is "red_star"
//                        attachment.image = UIImage(named: "startrating")
//                    } else {
//                        attachment.image = UIImage(named: "gray_star")
//                    }
//                    
//                    attrStr.appendAttributedString(NSAttributedString(attachment: attachment))
//                }
//                
//                attrStr.appendAttributedString(NSAttributedString(string: "\t"))
//                attrStr.appendAttributedString(NSAttributedString(string: review.reviewText!))
//                
//                let textLabel = UILabel()
//                textLabel.numberOfLines = 0
//                textLabel.font = UIFont.systemFontOfSize(12)
//                textLabel.translatesAutoresizingMaskIntoConstraints = false
//                cardView.addSubview(textLabel)
//                textLabel.attributedText = attrStr
//                textLabel.leftAnchor.constraintEqualToAnchor(cardView.leftAnchor, constant: 20).active = true
//                textLabel.topAnchor.constraintEqualToAnchor(timeLabel.bottomAnchor, constant: 10).active = true
//                textLabel.rightAnchor.constraintEqualToAnchor(cardView.rightAnchor, constant: -20).active = true
//                textLabel.heightAnchor.constraintEqualToConstant(40).active = true
//                cardView.bottomAnchor.constraintEqualToAnchor(textLabel.bottomAnchor, constant: 10).active = true
//                
//            }
//            
//            // add to main stack
//            if let aStack = self.mainStack {
//                aStack.addArrangedSubview(cardView)
////                cardView.heightAnchor.constraintEqualToConstant(160).active = true
////                cardView.widthAnchor.constraintEqualToAnchor(aStack.widthAnchor, multiplier: 1).active = true
//                
//            }
//        }
//        
//    }
//    @IBAction func directionsButtonTapped(sender: AnyObject) {
//        guard let currentHotel = currentHotel, hotelName = currentHotel.name, latitudeString = currentHotel.latitude, longitudeString = currentHotel.longitude, latitudeDouble = Double(latitudeString), longitudeDouble = Double(longitudeString) else { print("Hotel coordinates nil can't launc maps app"); return }
//        
//        let latitude:CLLocationDegrees =  latitudeDouble
//        let longitude:CLLocationDegrees =  longitudeDouble
//        let regionDistance:CLLocationDistance = 10000
//        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
//        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
//        let options = [
//            MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
//            MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
//        ]
//        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
//        let mapItem = MKMapItem(placemark: placemark)
//        mapItem.name = hotelName
//        mapItem.openInMapsWithLaunchOptions(options)
//
//        
//    }
//    
//    @IBAction func onClose(sender: AnyObject) {
////        self.dismissViewControllerAnimated(true, completion: nil)
//        self.navigationController?.popViewControllerAnimated(true)
//    }
//    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//     if segue.identifier == "hotelPhotos" {
//     hotelPhotosVc = segue.destinationViewController as? HotelPhotosCollectionViewController
//     
//     }
//     }
//    
//    // MARK:- UIWebViewDelegate.
//    
//    func webViewDidFinishLoad(webView: UIWebView) {
//        let textSize: Int = 90
//        
//        
//
//        if let longDescriptionWebView = longDescriptionWebView {
//        longDescriptionWebView.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '\(textSize)%%'")
//            
//            var frame = longDescriptionWebView.frame
//            frame.size.height = 1
//            longDescriptionWebView.frame = frame
//            let fittingSize = longDescriptionWebView.sizeThatFits(CGSizeZero)
//            frame.size = fittingSize
//            longDescriptionWebView.frame = frame
//            longDescriptionWebView.heightAnchor.constraintEqualToConstant(frame.size.height).active = true
//            mainStack.layoutIfNeeded()
//            mainStack.superview?.layoutIfNeeded()
//            print(fittingSize.height)
//            
//
//
//        }
//    }
//}
