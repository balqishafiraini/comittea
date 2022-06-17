//
//  Chapter.swift
//  comittea
//
//  Created by Atyanta Awesa Pambharu on 16/06/22.
//

import Foundation
import UIKit

class Chapter: Codable {
    
    var title: String
    var intro: String
    var logo: String
    var messages: [Message]
    var lastMessageIndex: Int
    
    init(_ title: String, _ intro: String, _ logo: String, _ messages: [Message]) {
        self.title = title
        self.intro = intro
        self.logo = logo
        self.messages = messages
        self.lastMessageIndex = 0
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.intro = try container.decode(String.self, forKey: .intro)
        self.logo = try container.decode(String.self, forKey: .logo)
        let wrappers = try container.decode([MessageWrapper].self, forKey: .messages)
        self.messages = wrappers.map { $0.message }
        self.lastMessageIndex = try container.decode(Int.self, forKey: .lastMessageIndex)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.intro, forKey: .intro)
        try container.encode(self.logo, forKey: .logo)
        let wrappers = messages.map { MessageWrapper($0) }
        try container.encode(wrappers, forKey: .messages)
        try container.encode(self.lastMessageIndex, forKey: .lastMessageIndex)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case intro
        case logo
        case messages
        case lastMessageIndex
    }
}

fileprivate struct MessageWrapper: Codable {
    let message: Message
    
    enum CodingKeys: String, CodingKey {
        case base, payload
    }
    
    enum Base: Int, Codable {
        case narrationMessage
        case compyConversationMessage
        case userConversationMessage
        case compyTrueMessage
        case compyFalseMessage
        case singleChoiceMessage
        case multiSelectMessage
        case reorderMessage
    }
    
    init(_ message: Message) {
        self.message = message
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base = try container.decode(Base.self, forKey: .base)
        
        switch base {
        case .narrationMessage:
            self.message = try container.decode(NarrationMessage.self, forKey: .payload)
        case .compyConversationMessage:
            self.message = try container.decode(CompyConversationMessage.self, forKey: .payload)
        case .userConversationMessage:
            self.message = try container.decode(UserCoversationMessage.self, forKey: .payload)
        case .compyTrueMessage:
            self.message = try container.decode(CompyTrueMessage.self, forKey: .payload)
        case .compyFalseMessage:
            self.message = try container.decode(CompyFalseMessage.self, forKey: .payload)
        case .singleChoiceMessage:
            self.message = try container.decode(SingleChoiceMessage.self, forKey: .payload)
        case .multiSelectMessage:
            self.message = try container.decode(MultiSelectMessage.self, forKey: .payload)
        case .reorderMessage:
            self.message = try container.decode(ReorderMessage.self, forKey: .payload)
        default:
            break
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch message {
        case let payload as NarrationMessage:
            try container.encode(Base.narrationMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as CompyConversationMessage:
            try container.encode(Base.compyConversationMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as UserCoversationMessage:
            try container.encode(Base.userConversationMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as CompyTrueMessage:
            try container.encode(Base.compyTrueMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as CompyFalseMessage:
            try container.encode(Base.compyFalseMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as SingleChoiceMessage:
            try container.encode(Base.singleChoiceMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as MultiSelectMessage:
            try container.encode(Base.multiSelectMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        case let payload as ReorderMessage:
            try container.encode(Base.reorderMessage, forKey: .base)
            try container.encode(payload, forKey: .payload)
        default:
            break
        }
    }
    
}
