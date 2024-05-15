//
//  Date+Extension.swift
//  MyTask
//
//  Created by Darshan on 15/05/24.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let result = dateFormatter.string(from: self)
        return result
    }
}
