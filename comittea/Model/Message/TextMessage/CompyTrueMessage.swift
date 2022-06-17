//
//  CompyTrueMessage.swift
//  comittea
//
//  Created by Atyanta Awesa Pambharu on 16/06/22.
//

import Foundation

struct CompyTrueMessage: TextMessage, Codable {
    var text: String
    
    init (_ text: String) {
        self.text = text
    }
}
