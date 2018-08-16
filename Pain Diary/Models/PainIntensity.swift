//
//  Pain.swift
//  Pain Diary
//
//  Created by Michael Large on 8/16/18.
//  Copyright © 2018 Codethebeard. All rights reserved.
//

import UIKit

struct PainIntensity {
    var name: String
    var image: UIImage
    var color: UIColor
}

extension PainIntensity {
    static let great = PainIntensity(name: "great", image: UIImage(resource: .ok), color: .great)
    static let meh = PainIntensity(name: "meh", image: UIImage(resource: .meh), color: .meh)
    static let bad = PainIntensity(name: "bad", image: UIImage(resource: .pain), color: .pain)
    static let terrible = PainIntensity(name: "terrible", image: UIImage(resource: .crying), color: .crying)
}
