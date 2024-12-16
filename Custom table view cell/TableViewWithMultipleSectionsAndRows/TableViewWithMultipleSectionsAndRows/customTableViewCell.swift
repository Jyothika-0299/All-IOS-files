//
//  customTableViewCell.swift
//  TableViewWithMultipleSectionsAndRows
//
//  Created by FCI on 27/11/24.
//

import UIKit

class customTableViewCell: UITableViewCell {
    @IBOutlet var l1 : UILabel!
    @IBOutlet var img1 : UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
