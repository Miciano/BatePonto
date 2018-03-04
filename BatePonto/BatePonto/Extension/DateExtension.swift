//
//  DateExtension.swift
//  BatePonto
//
//  Created by Fabio Miciano on 26/02/2018.
//  Copyright © 2018 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    func forString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.timeZone = TimeZone(identifier: "America/Sao_Paulo")
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
