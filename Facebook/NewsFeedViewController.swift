//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
     var selectedImageView: UIImageView!
     var fadeTransition: FadeTransition!
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    

    @IBAction func didGesturePhoto(_ sender: UITapGestureRecognizer) {
    
         selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "photoSegue", sender: nil)
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        
    }
    
    

 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                 let destinationViewController = segue.destination as! PhotoViewController
                //destinationViewController.imageView = self.selectedImageView.image
                
                 fadeTransition = FadeTransition()
                
                destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
                destinationViewController.transitioningDelegate = fadeTransition
                fadeTransition.duration = 1.0
                
                
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 

}
