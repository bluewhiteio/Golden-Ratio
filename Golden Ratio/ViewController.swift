//
//  ViewController.swift
//  Golden Ratio
//
//  Created by Som, Mal on 8/29/15.
//  Copyright (c) 2015 Som, Mal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var toggleState = 1
    @IBAction func swapRatio(sender: AnyObject) {
        
        if toggleState == 1 {
            toggleState = 2
            imageView.image = UIImage(named:"gratioland")
        } else {
            toggleState = 1
            imageView.image = UIImage(named:"gratio")
        }
    
        
        
        
    }
    
    var v : JMBackgroundCameraView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        v = JMBackgroundCameraView(frame: view.bounds, position: DevicePosition.Back)
        view.addSubview(v)
        view.sendSubviewToBack(v)
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

