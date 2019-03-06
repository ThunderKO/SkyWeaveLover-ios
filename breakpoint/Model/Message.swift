//
//  Message.swift
//  breakpoint
//
//  Created by KO TING on 24/2/2019.
//  Copyright © 2019 Andy Ko. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
