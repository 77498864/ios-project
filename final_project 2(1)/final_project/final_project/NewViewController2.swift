//
//  NewViewController2.swift
//  final_project
//
//  Created by Mac08 on 2023/1/3.
//

import UIKit

class NewViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NameAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: mmTableViewCell = mtabview.dequeueReusableCell(withIdentifier: "mycell1", for: indexPath) as! mmTableViewCell
        cell.id = idAry[indexPath.row]
        cell.name.text = NameAry[indexPath.row]
        cell.price.text = String(priceAry[indexPath.row])
        cell.number.text = numberAry[indexPath.row]
        cell.total.text = totalAry[indexPath.row]
        
        
        return cell
    }
    
    var idAry = Array<Int>()
    var NameAry = Array<String>()
    var priceAry = Array<Int>()
    var totalAry = Array<String>()
    var numberAry = Array<String>()
    var db:FMDatabase!
    var resultSet:FMResultSet!
    let app :String = "food_app.sqlite"
    var total2: String!
    var total3: Int? = 0

    @IBAction func checkout(_ sender: Any) {
        if(db.open() == true){
            let SQLcmd = "DROP TABLE IF EXISTS food_app;"
            db.executeStatements(SQLcmd)
        }
    }
    
    @IBOutlet weak var pricetotal: UILabel!
    @IBOutlet weak var mtabview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mtabview.delegate = self
        mtabview.dataSource = self
        resultSet = self.dbQuery()
        pricetotal.text = String(total3!)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func backmenu1(_ sender: Any) {
        performSegue(withIdentifier: "backm", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backm"{
            if let sss = segue.destination as? NewViewController{
                sss.db = db
            }
            
        }
        if segue.identifier == "delete"{
            if let aaaa = segue.destination as? NewViewController3{
                let selectindexpath = self.mtabview.indexPathForSelectedRow
                if let selectrow = selectindexpath?.row{
                    aaaa.db = db
                    aaaa.numrow = selectrow
                    aaaa.fname = NameAry[selectrow]
                    aaaa.fprice = priceAry[selectrow]
                    aaaa.fnumber = numberAry[selectrow]
                    aaaa.ftotal = totalAry[selectrow]
                    aaaa.id = idAry[selectrow]
                    
                }
                
                
            }
            
        }
        
    }
    

    func dbQuery() -> FMResultSet{
        var fmResultSet: FMResultSet!
        
        do{
            fmResultSet = try db.executeQuery("SELECT * FROM food_app", values: nil)
            while fmResultSet.next(){
                idAry.append(Int(fmResultSet.int(forColumn: "id")))
                NameAry.append(fmResultSet.string(forColumn: "name")!)
                priceAry.append(Int(fmResultSet.int(forColumn: "price")))
                numberAry.append(fmResultSet.string(forColumn: "number")!)
                totalAry.append(fmResultSet.string(forColumn: "total")!)
                total2 = fmResultSet.string(forColumn: "total")
                total3 = total3! + Int(total2)!
            }
        }
        catch{
            NSLog(error.localizedDescription)
        }
        
        return fmResultSet
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "delete", sender: nil)
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
