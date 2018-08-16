//
//  UIImage+PainIntensity.swift
//  Pain Diary
//
//  Created by Michael Large on 8/16/18.
//  Copyright © 2018 Codethebeard. All rights reserved.
//

import UIKit

enum PainImageResource: String {
    case ok
    case meh
    case pain
    case crying
}

extension UIImage {
    convenience init(resource: PainImageResource) {
        self.init(named: resource.rawValue)!
    }
}
