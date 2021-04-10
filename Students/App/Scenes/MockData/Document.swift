//
//  Document.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import Foundation
import DateToolsSwift

struct Document: Hashable {
    var name: String
    var size: String
    var date: Date
    var type: DocumentType

    var formattedDate: String {
        date.timeAgoSinceNow
    }

    static var mockData = [
        Document(name: "Doc..Name.doc", size: "12 MB", date: Date(), type: .doc),
        Document(name: "Doc..Name.doc", size: "12 MB", date: Date(), type: .doc),
        Document(name: "Doc..Name.doc", size: "12 MB", date: Date(), type: .doc)
    ]
}
