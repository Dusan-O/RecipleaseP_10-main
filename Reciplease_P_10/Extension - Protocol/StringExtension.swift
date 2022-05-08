//
//  StringExtension.swift
//  Reciplease_P_10
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import Foundation
import UIKit

extension String {
    /// Check if the text content only letters
    var isNumeric: Bool {
        return self.trimmingCharacters(in: .letters) != String() ? true : false
    }
}
