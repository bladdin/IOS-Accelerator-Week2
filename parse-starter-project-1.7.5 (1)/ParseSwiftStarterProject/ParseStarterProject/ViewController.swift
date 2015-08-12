//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
  
  @IBOutlet weak var alertButton: UIButton!
  
  @IBOutlet weak var imageView: UIImageView!
  
  let picker : UIImagePickerController = UIImagePickerController()
  
  
  let alert = UIAlertController(title: "Button Clicked", message: "Yes the button was clicked", preferredStyle: UIAlertControllerStyle.Alert)
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
      let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert) -> Void in
        println("Alert Canceled")
      }
      
      let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive) { (alert) -> Void in
        println("Alert destroyed")
      }
     
    let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default) { (alert) -> Void in
        println("Confirm")
      }
      
    let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) { (alert) -> Void in
      self.presentViewController(self.picker, animated: true, completion: nil)
      
    }
      
    let colorInvertAction = UIAlertAction(title: "Color Invert", style: UIAlertActionStyle.Default) { (alert) -> Void in
      let image = CIImage(image: self.imageView.image)
      let invertFiter = CIFilter(name: "CIColorInvert")
      invertFiter.setValue(image, forKey: kCIInputImageKey)
      
      let context = CIContext(options: nil)
      
      let options = [kCIContextWorkingColorSpace : NSNull()]
      let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
      let gpuContext = CIContext(EAGLContext: eaglContext, options: options)
      
      let outputImage = invertFiter.outputImage
      let extent = outputImage.extent()
      let cgImage = gpuContext.createCGImage(outputImage, fromRect: extent)
      let finalImage = UIImage(CGImage: cgImage)
      self.imageView.image = finalImage
    }
      
     let sepiaAction = UIAlertAction(title: "Sepia", style: UIAlertActionStyle.Default) { (alert) -> Void in
      let image = CIImage(image: self.imageView.image)
      let sepiaFilter = CIFilter(name: "CIPhotoEffectInstant")
      sepiaFilter.setValue(image, forKey: kCIInputImageKey)
      
      let context = CIContext(options: nil)
      
      let options = [kCIContextWorkingColorSpace : NSNull()]
      let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
      let gpuContext = CIContext(EAGLContext: eaglContext, options: options)
      
      let outputImage = sepiaFilter.outputImage
      let extent = outputImage.extent()
      let cgImage = gpuContext.createCGImage(outputImage, fromRect: extent)
      let finalImage = UIImage(CGImage: cgImage)
      self.imageView.image = finalImage
      }
    
    let colorMapAction = UIAlertAction(title: "Cosmic Effect", style: UIAlertActionStyle.Default) { (alert) -> Void in
      let image = CIImage(image: self.imageView.image)
      let heatMapFilter = CIFilter(name: "CITwirlDistortion")
      heatMapFilter.setValue(image, forKey: kCIInputImageKey)
      
      let context = CIContext(options: nil)
      
      let options = [kCIContextWorkingColorSpace : NSNull()]
      let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
      let gpuContext = CIContext(EAGLContext: eaglContext, options: options)
      
      let outputImage = heatMapFilter.outputImage
      let extent = outputImage.extent()
      let cgImage = gpuContext.createCGImage(outputImage, fromRect: extent)
      let finalImage = UIImage(CGImage: cgImage)
      self.imageView.image = finalImage
    }
      
    let uploadAction = UIAlertAction(title: "Upload", style: UIAlertActionStyle.Default) { (alert) -> Void in
      let post = PFObject(className: "Post")
      post["text"] = "image posts"
      
      if let image = self.imageView.image,
      data = UIImageJPEGRepresentation(image, 1.0){
        let file = PFFile(name: "post.jpeg", data: data)
        post["image"] = file
      }
      post.saveInBackgroundWithBlock({ (succeed, error) -> Void in
        if error != nil{
          println("Error durring save")
        }
      })
      }
      
      alert.addAction(uploadAction)
      alert.addAction(cameraAction)
      alert.addAction(colorInvertAction)
      alert.addAction(sepiaAction)
      //alert.addAction(colorMapAction)
      
      
      self.picker.delegate = self
      self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
      
      
      
      
      
      //if let popover = self.popoverPresentationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func buttonPressed(sender: AnyObject) {
    
//    alert.modalPresentationStyle = UIModalPresentationStyle.Popover
//    
//    
//    if let popover = alert.popoverPresentationController{
//      popover.sourceView = view
//      popover.sourceRect = alertButton.frame
//      
//    }

    self.presentViewController(alert, animated: true, completion : nil)
    
  }
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[NSObject : AnyObject]) {
    let image: UIImage = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
    self.imageView.image = image
    self.picker.dismissViewControllerAnimated(true, completion: nil)
    
    
  }
  
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    self.picker.dismissViewControllerAnimated(true, completion: nil)
    println("picker canceled")
  }
  
  
  
  
}

