//
//  OverlayViewController.swift
//  Golden Ratio
//
//  Created by Tischuk, Christopher on 9/6/15.
//  Copyright (c) 2015 Som, Mal. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {
    var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }
}
