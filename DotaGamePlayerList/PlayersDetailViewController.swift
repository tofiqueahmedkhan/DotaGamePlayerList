//
//  PlayersDetailViewController.swift
//  DotaGamePlayerList
//
//  Created by Macbook Pro on 24/04/18.
//  Copyright © 2018 tofiqueahmedkhan. All rights reserved.
//

import UIKit

class PlayersDetailViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerAttributeLabel: UILabel!
    @IBOutlet weak var playerAttackLabel: UILabel!
    @IBOutlet weak var playerHealthLabel: UILabel!
    
    // MARK: - Constant & Variable
    
    var hero:HeroStats?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameLabel.text = hero?.localized_name
        playerAttackLabel.text = hero?.attack_type
        playerAttributeLabel.text = hero?.primary_attr
        playerHealthLabel.text = "\((hero?.base_health)!)"
    }


}
