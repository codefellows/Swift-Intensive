//
//  CircleView.swift
//  Interface Builder Designables
//
//  Created by John Clem on 6/24/14.
//  Copyright (c) 2014 Learn Swift. All rights reserved.
//

import UIKit
import CoreImage

@IBDesignable class CircleView: UIView {
    
    var defaultImageView = UIImageView()
    var originalImage : UIImage?

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var defaultImage : UIImage? {
        didSet {
            defaultImageView.removeFromSuperview()
            defaultImageView.image = defaultImage
            defaultImageView.frame = self.frame
            defaultImageView.layer.cornerRadius = self.layer.cornerRadius
            defaultImageView.layer.borderWidth = self.layer.borderWidth
            defaultImageView.layer.borderColor = self.layer.borderColor
            defaultImageView.layer.masksToBounds = true
            self.addSubview(defaultImageView)
        }
    }
    
    @IBInspectable var noirEffect : Bool {
        didSet {
            defaultImageView.removeFromSuperview()

            if noirEffect == true {
                originalImage = defaultImage
                let filteredImage = self.applyFilterWithName("CIPhotoEffectNoir", toImage:originalImage!)
                self.defaultImage = filteredImage
            } else {
                self.defaultImage = originalImage
            }
        }
    
    }
    
    func applyFilterWithName(filterName : String, toImage image: UIImage) -> UIImage? {
        
        let coreImage = image.CIImage.imageByApplyingFilter(filterName, withInputParameters: NSDictionary(object: image.CIImage, forKey: kCIInputImageKey))
        
        return UIImage(CIImage: coreImage)
    }
    
    typealias RoundView = CircleView
    
    init(frame: CGRect) {
        noirEffect = false
        super.init(frame: frame)
    }

}
