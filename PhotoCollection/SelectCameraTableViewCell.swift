//
//  SelectCameraTableViewCell.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/05/24.
//

import UIKit

class SelectCameraTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cameraLabel: UILabel!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var mainBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
