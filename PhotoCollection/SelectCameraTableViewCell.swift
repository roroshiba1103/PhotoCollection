//
//  SelectCameraTableViewCell.swift
//  PhotoCollection
//
//  Created by 安部瞳 on 2023/05/24.
//

import UIKit

class SelectCameraTableViewCell: UITableViewCell {
    
    //let cameraArray: Array = ["Canon", "Nikon", "SONY", "FUJIFILM", "Panasonic", "OLYMPUS", "PENTAX", "LEICA", "Hasselblad"]
    
    @IBOutlet weak var cameraLabel: UILabel!
    @IBOutlet weak var cameraImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
