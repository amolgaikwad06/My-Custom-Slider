//
//  CustomSlider.swift
//  My Custom Slider
//
//  Created by Amol on 5/24/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    var label: UILabel
    var labelXMin: CGFloat?
    var labelXMax: CGFloat?
    var labelText: ()->String = { "" }
    
    //Add Buttons
    var decBtn: UIButton?
    var incBtn: UIButton?
    
    //Increment decrement
    public var incrementValue: Float = 1.0
    
    //Initializer
    required public init?(coder aDecoder: NSCoder) {
        label = UILabel()
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(onValueChanged(sender:)), for: .valueChanged)
    }
    
    func setup(){
        labelXMin = frame.origin.x + 16
        labelXMax = frame.origin.x + self.frame.width - 14
        let labelXOffset: CGFloat = labelXMax! - labelXMin!
        let valueOffset: CGFloat = CGFloat(self.maximumValue - self.minimumValue)
        let valueDifference: CGFloat = CGFloat(self.value - self.minimumValue)
        let valueRatio: CGFloat = CGFloat(valueDifference/valueOffset)
        let labelXPos = CGFloat(labelXOffset*valueRatio + labelXMin!)
        label.frame = CGRect(x: labelXPos, y: self.frame.origin.y - 25, width: 200, height: 25)
        label.text = self.value.description
        self.superview!.addSubview(label)
        
        //Add Buttons
        decBtn = UIButton(type: .system) as UIButton
        decBtn?.setTitle("-", for: UIControlState.normal)
        decBtn!.titleLabel!.font = UIFont.systemFont(ofSize: 30)
        decBtn?.frame = CGRect(x: self.frame.origin.x - 25, y: self.frame.origin.y+2, width: 25, height: 25)
        decBtn!.titleEdgeInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        decBtn!.layer.cornerRadius = 12
        decBtn!.layer.borderWidth = 1
        decBtn!.layer.borderColor = UIColor.gray.cgColor
        
        self.superview!.addSubview(decBtn!)
        
        incBtn = UIButton(type: .system) as UIButton
        incBtn?.setTitle("+", for: UIControlState.normal)
        incBtn!.titleLabel!.font = UIFont.systemFont(ofSize: 30)
        incBtn?.frame = CGRect(x: self.frame.origin.x + self.frame.width, y: self.frame.origin.y+2, width: 25, height: 25)
        incBtn!.layer.cornerRadius = 12
        incBtn!.layer.borderWidth = 1
        incBtn!.layer.borderColor = UIColor.gray.cgColor
        
        self.superview!.addSubview(incBtn!)
        
        //Actions
        decBtn?.addTarget(self, action: #selector(decrement), for: .touchDown)
        incBtn?.addTarget(self, action: #selector(increment), for: .touchDown)
    }
    
    func updateLabel(){
        label.text = labelText()
        let labelXOffset: CGFloat = labelXMax! - labelXMin!
        let valueOffset: CGFloat = CGFloat(self.maximumValue - self.minimumValue)
        let valueDifference: CGFloat = CGFloat(self.value - self.minimumValue)
        let valueRatio: CGFloat = CGFloat(valueDifference/valueOffset)
        let labelXPos = CGFloat(labelXOffset*valueRatio + labelXMin!)
        label.frame = CGRect(x: labelXPos - label.frame.width/2, y: self.frame.origin.y - 25, width: 200, height: 25)
        label.textAlignment = NSTextAlignment.center
        self.superview!.addSubview(label)
    }
    public override func layoutSubviews() {
        labelText = { self.value.description }
        setup()
        updateLabel()
        super.layoutSubviews()
        super.layoutSubviews()
    }
    func onValueChanged(sender: CustomSlider){
        updateLabel()
    }
    
    //Increment Decrement functions
    func increment(sender: UIButton){
        self.value += Float(incrementValue)
        updateLabel()
    }
    func decrement(sender: UIButton){
        self.value -= Float(incrementValue)
        updateLabel()
    }
    
}
