//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Belay, Betelhem on 10/24/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage!

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoAction: UIImageView!
    var photoViewControllerImageViewOrginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize (width: 375, height: 612)
         imageView.image = image
        
        scrollView.delegate = self
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
        
      
        
    }
    
    
    @IBAction func didTapDone(_ sender: UIButton) {
        self.doneButton.isHidden = true
        self.photoAction.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let yScroll = scrollView.contentOffset.y
        
        if yScroll < -50 {
            dismiss(animated: true, completion: nil)
            
        }else{
            self.doneButton.isHidden = false
            self.photoAction.isHidden = false
        }
        
       
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
