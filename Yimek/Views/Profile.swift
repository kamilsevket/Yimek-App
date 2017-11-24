//
//  Profile.swift
//  Yimek
//
//  Created by Kamil on 2.05.2017.
//  Copyright © 2017 KamilDemirtas. All rights reserved.
//

import UIKit

class Profile: UIViewController {

    @IBOutlet weak var username: UILabel!
   
    @IBOutlet weak var ad: UILabel!
    
    @IBOutlet weak var mail: UILabel!
    
    @IBOutlet weak var soyad: UILabel!
    
    
    @IBOutlet weak var profileResmi: UIImageView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ad.text! = valueIsim
        
        username.text! = valuekullanıcı
    
        soyad.text! = valuesoyisim
        
        let imgURL2 = NSURL(string: "http://46.101.227.130"+valueImage)
        
        if imgURL2 != nil {
            let data = NSData(contentsOf: (imgURL2 as URL?)!)
            profileResmi.image = UIImage(data: data! as Data)
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
