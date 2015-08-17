//
//  GalleryViewController.swift
//  ParseStarterProject
//
//  Created by Benjamin Laddin on 8/14/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Photos

protocol ImageSelectedDelegate : class{
  func controllerDidSelectImage(UIImage) -> (Void)
}

class GalleryViewController : UIViewController{
  var fetchResult : PHFetchResult!
  let cellSize = CGSize(width: 100, height: 100)
  var desizedFinalImageSize : CGSize!
  var scale : CGFloat = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
}
