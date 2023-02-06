//
//  NewViewController.swift
//  final_project
//
//  Created by Mac08 on 2022/12/20.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var db:FMDatabase!
    var resultSet:FMResultSet!
    let app :String = "food_app.sqlite"
    //var countid: Int! = 0
    
    var state:Int! = 0

    var info  = [["雞翅","雞腿","雞排","三角骨","鹹酥雞","薯條","雞塊","洋蔥圈","雞屁股","炸水餃","可樂","雪碧","奶茶","紅茶","綠茶","咖啡","珍珠奶茶"]]
    var infoimg = [["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"
    ,"10.jpg","11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg","17.jpg"]]
    
    var pricefood = [[25,30,65,50,40,30,30,35,25,35,20,20,25,20,20,35,45]]
    
    @IBOutlet weak var mtableview: UITableView!
    @IBOutlet weak var tit: UILabel!
    var titl:String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:mTableCellTableViewCell = mtableview.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! mTableCellTableViewCell
        cell.foodname.text = info[indexPath.section][indexPath.row]
        cell.img.image = UIImage(named: infoimg[indexPath.section][indexPath.row])
        cell.price.text = String(pricefood[indexPath.section][indexPath.row]) + "元"
        return cell
    }
    
    @IBAction func watchcar(_ sender: Any) {
        performSegue(withIdentifier: "car2", sender: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "fooddata", sender: nil)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fooddata"{
            if let fddata = segue.destination as? NewViewController1ViewController{
                let selectIndexPath = self.mtableview.indexPathForSelectedRow
                if let selectRow = selectIndexPath?.row{
                    fddata.numrow = selectRow
                    fddata.db = db
                    //fddata.cid = countid
                    
                }
                
                
                
            }
        }
        if segue.identifier == "car2"{
            if let car = segue.destination as? NewViewController2{
                car.db = db
            }
            
        }
    }

    @IBAction func turnback(_ sender: Any) {
        if(db.open() == true){
            let SQLcmd = "DROP TABLE IF EXISTS food_app;"
            db.executeStatements(SQLcmd)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tit.text = titl
        mtableview.delegate = self
        mtableview.dataSource = self
        mtableview.allowsSelection = true
        mtableview.allowsMultipleSelection = false
        self.dbtableCreate()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func dbtableCreate(){
        if(db.open() == true){
            let SQLcmd = "CREATE TABLE IF NOT EXISTS food_app(id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL ,price integer NOT NULL,number text NOT NULL,total text NOT NULL);"
            db.executeStatements(SQLcmd)
        }
    }
    
    

    /*
    // MARK: - Naviga
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
