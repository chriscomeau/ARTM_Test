//
//  String+Extension.swift
//  ARTM
//
//  Created by Chris Comeau on 2025-02-03.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    
    func localized(with arguments: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: arguments)
    }

}
