//
//  RecipeViewController.swift
//  Yimek
//
//  Created by Kamil on 3.05.2017.
//  Copyright © 2017 KamilDemirtas. All rights reserved.
//

import UIKit
import Alamofire

var recipeArray = [String]()
var imgURLArray = [String]()
var decArray = [String]()
var direcArray = [String]()

class RecipeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4") as! TableViewCell4
       
        cell.recipeLabel.text = recipeArray[indexPath.row]
        
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        
        
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as URL?)!)
            cell.recipeImage.image = UIImage(data: data! as Data)
        }
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController2") as! DetailViewController2
        vc.imageRecipe = imgURLArray[indexPath.row]
        vc.recipeString = recipeArray[indexPath.row]
        vc.decString = decArray[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBOutlet weak var recipeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("selam")
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Token \(token)",
            "Accept": "application/json"
        ]
        
        
        var url = "http://46.101.227.130/api/v1/recipe/?"
        
        
        
        for item in sepetArray
        { url += "&ingridents_name=" + item }
        
        
        Alamofire.request(url,headers: headers).responseJSON {response in
            
            
            
            if  let sepetL = response.result.value as? NSArray {
                print(sepetL)
                
                
                if let resArray = sepetL as? NSArray {
                    for res in resArray{
                        if let resDict = res as? NSDictionary {
                            if let name3 = resDict.value(forKey: "title") {
                                recipeArray.append(name3 as! String)
                                print(name3)
                            }
                        }
                    }
                }
                
                
                if let resArray = sepetL as? NSArray {
                    for res in resArray{
                        if let resDict = res as? NSDictionary {
                            if let img3 = resDict.value(forKey: "image") {
                                imgURLArray.append(img3 as! String)
                                print(img3)
                            }
                        }
                    }
                }
                
                
                if let resArray = sepetL as? NSArray {
                    for res in resArray{
                        if let resDict = res as? NSDictionary {
                            if let dec3 = resDict.value(forKey: "description") {
                                decArray.append(dec3 as! String)
                                print(dec3)
                            }
                        }
                    }
                }
                
            }
            
        }

        
        
        
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
