//
//  ViewController.swift
//  Video_Player_Controller_Swift4
//
//  Created by DeEp KapaDia on 23/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func Play(_ sender: UIButton) {
        
        
        //Get Path by name string
        if let filepath = Bundle.main.url(forResource: "sample", withExtension: "mp4") {
            
            //fetching a path of URL
            let video = AVPlayer(url: filepath)
            
            
            //Video controller for video play pause etc....
            let videocotroller = AVPlayerViewController()
            
            //fatch video Path into the controller
            videocotroller.player = video
            
            
            //Present on screen....
            present(videocotroller, animated: true, completion: {
                //Direct Play when burtton i click on button
                video.play()
                
            }
            )
            
        }
        
    }
    
}

