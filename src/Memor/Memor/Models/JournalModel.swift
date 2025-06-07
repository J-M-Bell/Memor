//
//  JournalModel.swift
//  JournalApp
//
//  Created by Justin Bell on 4/4/25.
//

import Foundation
import FirebaseFirestore

/// A struct model for holding journal entry data.
struct JournalModel: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var entrydata: String
    
    /// A method that determining if the journal entry is empty
    /// - Returns: Bool - whether entry is empty or not
    func isEmpty() -> Bool {
        return title.isEmpty && entrydata.isEmpty
    }
}
