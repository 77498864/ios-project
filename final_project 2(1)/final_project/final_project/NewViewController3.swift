//
//  NewViewController3.swift
//  final_project
//
//  Created by EB209 on 2023/1/4.
//

import UIKit

class NewViewController3: UIViewController {

    var info  = ["雞翅","雞腿","雞排","三角骨","鹹酥雞","薯條","雞塊","洋蔥圈","雞屁股","炸水餃","可樂","雪碧","奶茶","紅茶","綠茶","咖啡","珍珠奶茶"]
    var infoimg = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"
    ,"10.jpg","11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg","17.jpg"]
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var img: UIImageView!
    var numrow:Int!
    var id:Int!
    var fname:String = ""
    var fprice: Int!
    var fnumber:String = ""
    var ftotal:String = ""
    var db:FMDatabase!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = fname
        price.text = String(fprice)
        number.text = fnumber
        total.text = ftotal
        for index1 in 0...16{
            if fname == info[index1]{
                img.image = UIImage(named: infoimg[index1])
                break
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func de(_ sender: Any) {
        let deleteSQL = "DELETE FROM food_app WHERE id = ?;"
        do{
            try db.executeUpdate(deleteSQL, values:[id])
        }
        catch{
            NSLog(error.localizedDescription)
        }    }
    
    
    @IBAction func ba(_ sender: Any) {
        performSegue(withIdentifier: "bback", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bback"{
            if let sd = segue.destination as? NewViewController2{
                sd.db = db
            }
            
        }
        if segue.identifier == "delete1"{
            if let ssd = segue.destination as? NewViewController2{
                ssd.db = db
            }
            
        }
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
