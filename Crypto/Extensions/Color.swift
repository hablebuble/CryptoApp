//
//  Color.swift
//  Crypto
//
//  Created by Alexey Strelnikov on 15.11.2022.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
}


struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
