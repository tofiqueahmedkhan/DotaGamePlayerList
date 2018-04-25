//
//  PlayerTableViewCell.swift
//  DotaGamePlayerList
//
//  Created by Macbook Pro on 25/04/18.
//  Copyright © 2018 tofiqueahmedkhan. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerAttack: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
