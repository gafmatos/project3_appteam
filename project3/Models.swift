//
//  Models.swift
//  project3
//
//  Created by Gabriel Matos on 27/10/26.
//

import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
}
