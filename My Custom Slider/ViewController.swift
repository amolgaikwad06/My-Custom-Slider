//
//  ViewController.swift
//  My Custom Slider
//
//  Created by Amol on 5/24/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var customSlider: CustomSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSlider.minimumValue = 0
        customSlider.maximumValue = 10000
        customSlider.value = 5000
        customSlider.incrementValue = 500
    }

}

