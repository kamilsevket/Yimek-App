//
//  SepetViewController.swift
//  Yimek
//
//  Created by Kamil on 3.05.2017.
//  Copyright © 2017 KamilDemirtas. All rights reserved.
//

import UIKit

class SepetViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell5") as! TableViewCell3
        
        cell.sepetLabel.text = sepetArray[indexPath.row]
        
        
        return cell
    }
    
    
    @IBOutlet weak var sepetTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OperationQueue.main.addOperation({
            self.sepetTable.reloadData()

        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
