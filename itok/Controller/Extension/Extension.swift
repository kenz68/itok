//
//  Extension.swift
//  itok
//
//  Created by Quoc Le on 3/7/20.
//  Copyright © 2020 IceTeaViet. All rights reserved.
//

import Foundation

extension UIView {
    func rouded() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
}
