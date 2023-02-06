//
//  ViewController.swift
//  final_project
//
//  Created by Mac08 on 2022/12/20.
//

import UIKit

class ViewController: UIViewController {

    
    var db:FMDatabase!
    var dbb: FMDatabase!
    var resultSet:FMResultSet!
    let app :String = "food_app.sqlite"

    @IBOutlet weak var btn22: UIButton!
    @IBOutlet weak var bnt1: UIButton!
    var nextpage:Int! = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.databaseCreste()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newval = segue.destination as! NewViewController
        if(nextpage == 2){
            newval.titl = "內用"
            newval.state = nextpage
            newval.db = dbb
        }
        else if(nextpage == 3){
            newval.titl = "外帶"
            newval.state = nextpage
            newval.db = dbb
        }
        else{
            
        }
    }
    
    func databaseCreste(){
        var homeDir = NSHomeDirectory()
        let documentPath = homeDir + "/" + "Documents"
        db = FMDatabase.init(path:documentPath + "/" + app)
        dbb = db
    }
    
    @IBAction func btn1click(_ sender: Any) {
        nextpage = 2
    }
    
    @IBAction func btn2click(_ sender: Any) {
        nextpage = 3
    }
}

