//
//  HeroStats.swift
//  DotaGamePlayerList
//
//  Created by Macbook Pro on 25/04/18.
//  Copyright © 2018 tofiqueahmedkhan. All rights reserved.
//

import Foundation

struct HeroStats:Decodable{
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let base_health: Int
    let img: String
}
