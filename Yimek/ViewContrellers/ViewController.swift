//
//  ViewController.swift
//  Yimek
//
//  Created by Kamil on 30.04.2017.
//  Copyright © 2017 KamilDemirtas. All rights reserved.
//

import UIKit
import Alamofire

var token = ""
var valuekullanıcı = "default"
var valueIsim = ""
var valuesoyisim = "default"
var valueCataName = ""
var valueImage = ""
var sepetArray = [String]()
var nameSepet:String!


class ViewController: UIViewController {
    
    @IBOutlet weak var kullanıcıadı: UITextField!
    
    @IBOutlet weak var sifre: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    
    
    
    var seguePerformed = false
    
    @IBAction func login_button(_ sender: Any) {
        
        
        let headers: HTTPHeaders = [
            
            "Accept": "application/json"
        ]
        
        let username = kullanıcıadı.text!
        let password = sifre.text!
        
        Alamofire.request("http://46.101.227.130/api/v1/auth-token/", method:.post,
                          parameters:[ "username": username, "password" : password],
                          headers: headers)
            .responseJSON {response in
                
                
                
                if  let json = response.result.value as? [String: Any] {
                    print("JSON: \(json)")
                    
                    
                    if json["user"] != nil{
                        var isim = "" as? NSDictionary
                        isim = (json["user"] as? NSDictionary)!
                        valueIsim = isim?["first_name"] as! String
                        print(valueIsim)
                        
                        
                        var soyisim = "" as? NSDictionary
                        soyisim = (json["user"] as? NSDictionary)!
                        valuesoyisim = soyisim?["last_name"] as! String
                        
                        var profileImage = " " as? NSDictionary
                        profileImage = (json["user"] as? NSDictionary)!
                        valueImage = profileImage?["profile_photo"] as! String
                        
                        var kullanıcı = "" as? NSDictionary
                        kullanıcı = (json["user"] as? NSDictionary)!
                        valuekullanıcı = kullanıcı?["username"] as! String
                        
                    }else if json["first_name"]  == nil  {
                        self.errorLabel.text! = "Geçersiz kullanızı adı ve şifre."
                    }
                    
                    if json["token"] != nil {
                        token = (json["token"] as? String)!
                        print(token)
                        
                        
                        if  token != nil {
                            if !self.seguePerformed {
                                self.seguePerformed = true
                                self.performSegue(withIdentifier: "login", sender: self)}
                        }
                        
                        
                    }else if json["token"]  == nil  {
                        
                        self.errorLabel.text! = "Geçersiz kullanızı adı ve şifre."
                    }
                    
                }
                
        }
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


class CatagoryView: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var nameArray = [String]()
    var imgURLArray = [String]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.name.text = self.nameArray[indexPath.row]
        
        
    
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //vc.imageString = imgURLArray[indexPath.row]
        vc.nameString = nameArray[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Token \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request("http://46.101.227.130/api/v1/category/",headers: headers).responseJSON {response in
            
            if  let key = response.result.value as? NSArray {
                print(key)
                
                
                if let cataArray = key as? NSArray {
                    for cata in cataArray{
                        if let cataDict = cata as? NSDictionary {
                            if let name = cataDict.value(forKey: "name") {
                                self.nameArray.append(name as! String)
                            }
                        }
                    }
                    
                    OperationQueue.main.addOperation({
                        self.tableView.reloadData()
                    })
                    
                }
                
                
                print(self.nameArray)
                
            
            }
            
            
        }
        
        
    }
    
    ///for showing next detailed screen with the downloaded info
    
}


class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tableView2: UITableView!

    @IBAction func tariflerButton(_ sender: Any) {
        
    
        
    }
    
    var nameString:String!
    
    var indiArray = [String]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.indiArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableViewCell2
        cell.name2.text = self.indiArray[indexPath.row]
        
        nameSepet = cell.name2.text!
    

        
        return cell
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        
    
        let header: HTTPHeaders = [
            "Authorization": "Token \(token)",
            "Accept": "application/json"
        ]
        
        
        Alamofire.request("http://46.101.227.130/api/v1/ingrident/?category__name="+nameString,method:.get,headers: header).responseJSON {response in
    
            if  let indiName = response.result.value as? NSArray {
                print(indiName)
                
                
                
                if let indiArray = indiName as? NSArray {
                    for indi in indiArray{
                        if let indiDict = indi as? NSDictionary {
                            if let name2 = indiDict.value(forKey: "name") {
                                self.indiArray.append(name2 as! String)
                                print(name2)
                            }
                        }
                    }

                    OperationQueue.main.addOperation({
                        self.tableView2.reloadData()
                    })

            }
                
        }
        
        }
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        self.nameLabel.text = nameString
    }
    
   
    

}


class DetailViewController2: UIViewController {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    
    @IBOutlet weak var recipeDescription: UILabel!
    
    
    
    var recipeString:String!
    var imageRecipe:String!
    var decString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    
    }
    
    
    
    func updateUI() {
        self.recipeNameLabel.text = recipeString
        self.recipeDescription.text = decString
        print(recipeString)
        //   self.dobLabel.text = dobString
        
        let imgURL = URL(string:imageRecipe)!
        
        let data = NSData(contentsOf: (imgURL))
        recipeImageView.image = UIImage(data: data! as Data)
    }
    
    
    
}





