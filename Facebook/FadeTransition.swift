//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
     var blackblurView: UIView!
    var imageView: UIImageView!
  
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        //UIImageView = UIImageView()
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        var photoViewController = toViewController as! PhotoViewController
        
         // containerView.addSubview(UIImageView)
        let frame = containerView.convert(newsFeedViewController.selectedImageView.frame, from: newsFeedViewController.selectedImageView.superview)
       // let destinationImageFrame = photoViewController.imageView.frame
        
        
        
      blackblurView = UIView()
        //  blackView.frame = CGRect(x: 0, y: 0, width: toViewController.view.frame.size.width, height: toViewController.view.frame.size.height)
        
        blackblurView.frame = CGRect(x: 3, y: 3, width: toViewController.view.frame.size.width, height: toViewController.view.frame.size.height)
        
        
        toViewController.view.alpha = 0
        
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        //  toViewController.view.transform = CGAffineTransform(scaleX: 2.0, y: 3.0)
        
        
        
        blackblurView.backgroundColor = UIColor(white: 0, alpha: 0)
        fromViewController.view.addSubview(blackblurView)
        
        
        
        
//       let destinationImageFrame = photoViewController.imageView.frame
//        photoViewController.imageView.frame = newsFeedViewController.selectedImageView.frame

        
        
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
//            photoViewController.imageView.frame = destinationImageFrame
            self.blackblurView.backgroundColor = UIColor(white: 0, alpha: 0.8)
            
           // self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
         //   imageView.transform = view.transform.scaledBy(x: 0.5, y: 0.5)
            
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            photoViewController = PhotoViewController()
            
            newsFeedViewController.selectedImageView.isHidden = false
            //photoViewController.ImageView.isHidden = false
            self.blackblurView.removeFromSuperview()
            
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        fromViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        fromViewController.view.alpha = 1
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            
            
            fromViewController.view.alpha = 0
            
            
            self.blackblurView.frame.origin = CGPoint(x: -self.blackblurView.frame.size.width, y: -self.blackblurView.frame.size.height)

        
//        fromViewController.view.alpha = 1
//        UIView.animate(withDuration: duration, animations: {
//            toViewController.view.alpha = 0
            
            //var destinationImageFrame = toViewController.ImageView.frame
            //toViewController.ImageView.frame = NewsFeedViewController.selectedImageView.frame
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
