//
//  NewViewController1ViewController.swift
//  final_project
//
//  Created by Mac08 on 2022/12/27.
//

import UIKit

class NewViewController1ViewController: UIViewController, UITextFieldDelegate {

    var db:FMDatabase!
    var resultSet:FMResultSet!
    let app :String = "food_app.sqlite"
    //var cid :Int!
    
    var numrow: Int!
    var foodindex = ["雞翅","雞腿","雞排","三角骨","鹹酥雞","薯條","雞塊","洋蔥圈","雞屁股","炸水餃","可樂","雪碧","奶茶","紅茶","綠茶","咖啡","珍珠奶茶"]
    var foodimg = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"
                    ,"10.jpg","11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg","17.jpg"]
    var pricefood = [25,30,65,50,40,30,30,35,25,35,20,20,25,20,20,35,45]
    
    @IBOutlet weak var num: UITextField!
    @IBOutlet weak var addcar: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var foodname: UILabel!
    @IBOutlet weak var img: UIImageView!
    var foodnum: Int? = 0
    var toto: Int! = 0
    var foodnum1: String = ""
    var toto1: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        num.delegate = self
        foodname.text = foodindex[numrow]
        price.text = String(pricefood[numrow])
        img.image = UIImage(named: foodimg[numrow])
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return true
    }
    
    @IBAction func backmenu(_ sender: Any) {
        performSegue(withIdentifier: "backindex", sender: nil)
    }
    
    @IBAction func eyescar(_ sender: Any) {
       performSegue(withIdentifier: "car1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "car1"{
            if let buycar = segue.destination as? NewViewController2{
                buycar.db = db
            }
        }
        if segue.identifier == "backindex"{
            if let backin = segue.destination as? NewViewController{
                backin.db = db
                //backin.countid = cid
            }
        }
    }
    
    @IBAction func addcar(_ sender: Any) {
        self.insertRecord()
        
    }
    
    func insertRecord() ->Bool{
        foodnum = Int(num.text!)
        foodnum1 = num.text!
        if (foodnum == nil){
            NSLog("input error")
        }
        else{
            toto = pricefood[numrow] * foodnum!
            toto1 = String(toto)
            let insertSQL = "INSERT INTO food_app (name,price,number,total) VALUES(?,?,?,?);"
            do{
                try db.executeUpdate(insertSQL, values: [foodindex[numrow],pricefood[numrow],foodnum1,toto1])
                
                //cid = cid! + 1
            }
            catch{
                NSLog(error.localizedDescription)
            }
        }
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
