//
//  Themes.swift
//  project1
//
//  Created by хех on 27.01.2024.
//

import UIKit

protocol ThemeProtocol{
    var backgroundColor: UIColor {get}
}

class Themes{
    static var currentTheme: ThemeProtocol = BlueTheme()
}

final class BlueTheme: ThemeProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 0.3570544745, green: 0.4082327766, blue: 0.6928921729, alpha: 1)
}

final class RedTheme: ThemeProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 0.6928921729, green: 0.3093491866, blue: 0.2841979865, alpha: 1)
}

final class YellowTheme: ThemeProtocol {
    var backgroundColor: UIColor = #colorLiteral(red: 0.6832412847, green: 0.6928921729, blue: 0.2918330874, alpha: 1)
}
