//
//  Networking.swift
//  Listen
//
//  Created by Serge Kameni on 9/24/15.
//  Copyright © 2015 Lean Goat Technology LLC. All rights reserved.
//

import UIKit

public class Networking: NSObject {
    
    private(set) var cachePath = "/dooCache"
    private(set) var urlSession:URLSession?
    private let kMaxAttempts = 3
    
    private var requests:[String:Int] = [:]
    
    public static let sharedInstance = Networking()
    
    public override init() {
        super.init()
        
        let defaultConfigObject = URLSessionConfiguration.default
        let myCache = URLCache(memoryCapacity: 128*1024, diskCapacity: 250*1024*1024, diskPath: cachePath)
        defaultConfigObject.urlCache = myCache
        defaultConfigObject.requestCachePolicy = .useProtocolCachePolicy
        
        let queue = OperationQueue()
        queue.name = "com.intratain.doo.networkHelperQueue"
        queue.maxConcurrentOperationCount = 20
        
        self.urlSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue:queue)
    }
    
    
    func downloadImageAtUrl(strUrl: String, completionHandler completion :@escaping (_ result: UIImage?) -> Void) {
        if let url = NSURL(string: strUrl) {
            
            if let count = requests[strUrl] {
                if count == kMaxAttempts {
                    DispatchQueue.main.async(execute: { () -> Void in
                        print("Image not fount at \(strUrl)")
                        completion(nil)
                    })
                    return
                }
                
                requests[strUrl] = count + 1
                print("Attempt #\(requests[strUrl]) for image at \(strUrl)")
            } else {
                requests[strUrl] = 0
            }
            
            let request = NSURLRequest(url: url as URL)
            let task = urlSession!.dataTask(with: request as URLRequest) {
                (data, response, error) -> Void in
                if data == nil {
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.downloadImageAtUrl(strUrl: strUrl, completionHandler: completion)
                    })
                    
                    return
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    let image = UIImage(data: data!)
                    if (image == nil)
                    {
                        print("Invalid data for image at \(strUrl)")
                    }
                    
                    // remove the count
                    self.requests.removeValue(forKey: strUrl)
                    completion(image)
                    
                })
            }
            task.resume()
        } else {
            completion(nil)
        }
    }
    
    
    func getJSONAtUrl(strUrl: String, completionHandler completion: @escaping (_ result: [String: AnyObject]?) -> Void) {
        let url = NSURL(string: strUrl)
        let request = NSURLRequest(url: url! as URL)
        let task = urlSession!.dataTask(with: request as URLRequest){
            (data, response, error) -> Void in
            if error == nil {
                if data == nil {
                    DispatchQueue.main.async(execute: { () -> Void in
                        completion(nil)
                    })
                    
                    return
                }
                
                // convert
                
                var obj:[String:AnyObject]? = nil
                do {
                    let res = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    if let res = res as? [String:AnyObject] {
                        obj = res
                    } else if let res = res as? [AnyObject] {
                        obj = ["array" : res as AnyObject]
                    }
                } catch {
                    
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completion(obj)
                })
            }
        }
        task.resume()
    }
    
    
    func getFileContentAtUrl(strUrl: String, completionHandler completion: @escaping (_ result: String?) -> Void) {
        let url = NSURL(string: strUrl)
        let request = NSURLRequest(url: url! as URL)
        let task = urlSession!.dataTask(with: request as URLRequest){
            (data, response, error) -> Void in
            if error == nil {
                if data == nil {
                    DispatchQueue.main.async(execute: { () -> Void in
                        completion(nil)
                    })
                    
                    return
                }
                
                // convert
                
                let obj = String(data: data!, encoding: String.Encoding.utf8)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completion(obj)
                })
            }
        }
        task.resume()
    }
}


extension FileManager {
    class func documentsDir() -> NSURL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsURL as NSURL
    }
    
    class func cachesDir() -> NSURL {
        let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        return cachesURL as NSURL
    }
    
    class func pathOfFileInCachesDirectory(fileName: String) -> String {
        let fileURL = cachesDir().appendingPathComponent(fileName)
        return fileURL!.path
    }
    
    class func pathOfFileInDocumentsDirectory(fileName: String, subDir: String?) -> String {
        var fileURL = documentsDir()
        if (subDir != nil) {
            fileURL = fileURL.appendingPathComponent(subDir!)! as NSURL
            if (!FileManager.default.fileExists(atPath: fileURL.path!)) {
                do
                {
                    try FileManager.default.createDirectory(atPath: fileURL.path!, withIntermediateDirectories: true, attributes: nil)
                } catch {}
            }
        }
        
        
        fileURL = fileURL.appendingPathComponent(fileName)! as NSURL
        return fileURL.path!
    }
}
