//
//  FilterCalling.swift
//  ParseStarterProject
//
//  Created by Benjamin Laddin on 8/14/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class FilterCalling{
  
  class func sepiaFilterFromOriginalImage (original : UIImage, context : CIContext) -> (UIImage!){
    let image = CIImage(image: original)
    let filter = CIFilter(name: "CIPhotoEffectInstant")
    filter.setValue(image, forKey: kCIInputImageKey)
    return filteredImageFromFilter(filter, context : context)
  }
  
  class func vortexFilterFromOriginalImage (original : UIImage, context: CIContext, radius : Int, center : [Int], angle : Int ) -> UIImage! {
    let image = CIImage(image: original)
    let filter = CIFilter(name: "CITwirlDistortion")
    filter.setValue(image, forKey: kCIInputImageKey)
    filter.setValue(radius, forKey: kCIAttributeTypeDistance)
    filter.setValue(center , forKey: kCIAttributeTypePosition)
    filter.setValue(angle, forKey: kCIAttributeTypeAngle)
    return filteredImageFromFilter(filter, context: context)
  }
  
  class func colorInvertFromOriginalImage (original : UIImage, context: CIContext) ->UIImage{
    let image = CIImage(image: original)
    let filter = CIFilter(name: "CIColorInvert")
    filter.setValue(image, forKey: kCIInputImageKey)
    return filteredImageFromFilter(filter, context: context)
  }
  
  private class func filteredImageFromFilter(filter : CIFilter, context: CIContext) -> UIImage{
    let output = filter.outputImage
    let extent = output.extent()
    let CGImage = context.createCGImage(output, fromRect: extent)
    return UIImage(CGImage: CGImage)!
    
  }
  
}