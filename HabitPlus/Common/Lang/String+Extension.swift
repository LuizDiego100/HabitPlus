//
//  String+Extension.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 27/06/2022.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        return NSPredicate(format:"SELF MATCHES %@", regEx).evaluate(with: self)
    }
}
