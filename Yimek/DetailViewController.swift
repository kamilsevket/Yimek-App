//
//  DetailViewController.swift
//  Yimek
//
//  Created by Kamil on 3.05.2017.
//  Copyright © 2017 KamilDemirtas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    var nameString:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI() {
        self.nameLabel.text = nameString
        //self.dobLabel.text = dobString
        
        //let imgURL = URL(string:imageString)
        
       // let data = NSData(contentsOf: (imgURL)!)
        //self.imageView.image = UIImage(data: data as! Data)
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
