//
//  ShadowView.swift
//  breakpoint
//
//  Created by KO TING on 24/2/2019.
//  Copyright © 2019 Andy Ko. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
    
}
