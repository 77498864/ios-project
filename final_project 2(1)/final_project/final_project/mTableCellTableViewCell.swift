//
//  mTableCellTableViewCell.swift
//  final_project
//
//  Created by Mac08 on 2022/12/20.
//

import UIKit

class mTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var foodname: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
