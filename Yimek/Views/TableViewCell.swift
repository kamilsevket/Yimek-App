//
//  TableViewCell.swift
//  Yimek
//
//  Created by Kamil on 1.05.2017.
//  Copyright © 2017 KamilDemirtas. All rights reserved.
//

import UIKit



class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    

}


class TableViewCell2: UITableViewCell {
    
    
    
    @IBOutlet weak var name2: UILabel!
    

    @IBAction func sepetEkle(_ sender: Any) {
        

        sepetArray.append(name2.text!)
        print(sepetArray)
        
        
    
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}



class TableViewCell3: UITableViewCell {
    
    
    @IBOutlet weak var sepetLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}




class TableViewCell4: UITableViewCell {
    
    
    @IBOutlet weak var recipeLabel: UILabel!
    

    @IBOutlet weak var recipeImage: UIImageView!
    
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}


