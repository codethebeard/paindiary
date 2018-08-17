//
//  PainEntry.swift
//  Pain Diary
//
//  Created by Michael Large on 8/16/18.
//  Copyright © 2018 Codethebeard. All rights reserved.
//

import Foundation

class PainEntry {
    var intensity: PainIntensity
    var notes: String?
    var timestamp: Date

    init(intensity: PainIntensity, notes: String?, timestamp: Date) {
        self.intensity = intensity
        self.notes = notes
        self.timestamp = timestamp
    }
}
