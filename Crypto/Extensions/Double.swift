//
//  Double.swift
//  Crypto
//
//  Created by Alexey Strelnikov on 15.11.2022.
//

import Foundation
import SwiftUI


extension Double {
    
    /// Converts a Double into a currency wiith 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    ///
    /// ```
    private var currencyFormater2: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.locale = .current
        formater.currencyCode = "usd"
        formater.currencySymbol = "$"
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        
        
        
        return formater
    }
    
    /// Converts a Double into a Currency as  a String wiith 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.34"
    /// Convert 0.123456 to "$0.12"
    ///
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormater2.string(from: number) ?? "$0.00"
    }
    
    
    
    /// Converts a Double into a currency wiith 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    ///
    /// ```
    private var currencyFormater6: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.locale = .current
        formater.currencyCode = "usd"
        formater.currencySymbol = "$"
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 6
        
        
        
        return formater
    }
    
    /// Converts a Double into a Currency as  a String wiith 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    ///
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormater6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a Currency as  a String representation
    /// ```
    /// Convert 1.2345 to "1.23"
    ///
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    /// Converts a Double into a Currency as  a String representation with percent sign
    /// ```
    /// Convert 1.2345 to "1.23%"
    ///
    /// ```
    func asPercentString() -> String {
        return asNumberString()+"%"
    }
}
