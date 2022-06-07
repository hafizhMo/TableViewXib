//
//  Member.swift
//  TableViewXib
//
//  Created by Hafizh Mo on 06/06/22.
//

import Foundation

struct Member {
    let name: String
    let zodiac: String
    let image: String
//    let gen: MemberGen
}

struct MemberSection {
    let title: String
    let list: [Member]
}

enum MemberGen: String {
    case first = "1st Generation"
    case second = "2nd Generation"
}
