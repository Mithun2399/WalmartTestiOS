//
//  ViewController.swift
//  WalmartTest
//
//  Created by E0070 on 09/08/24.
//  Copyright © 2024 Mithun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imageTitle: UILabel!
    
    @IBOutlet weak var imageExplanation: UITextView!
    
    @IBOutlet weak var picOfTheDay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.apiCall()
        Client.getDataFromAPI { (data) in
            
            Client.downloadImage(at: data["url"]!, completion: { (success, image) in
                
                if success == true {
                    print("got image data from URL")
                    DispatchQueue.main.async {
                        self.picOfTheDay.image = image
                        self.dateLabel.text = "\(data["date"]!)"
                        self.imageTitle.text = "\(data["title"]!)"
                        self.imageExplanation.text = "\(data["explanation"]!)"
                        
                    }
                    
                } else {
                    print ("Error getting image")
                }
                
                
            })
            
        }
    }

    func apiCall() {

    }
}

