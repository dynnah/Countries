//
//  TableViewCell.swift
//  Paises
//
//  Created by IFPB on 18/12/2019.
//  Copyright © 2019 IFPB. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lbname: UILabel!
    @IBOutlet weak var lbcapital: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
