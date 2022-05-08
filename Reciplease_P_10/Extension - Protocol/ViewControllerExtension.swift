//
//  ViewControllerExtension.swift
//  Reciplease_P_10
//
//  Created by Dusan Orescanin on 28/03/2022.
//

import UIKit

extension UIViewController {
    
    // MARK: - ALERT METHODS
    
    // Creation of an alert with message for the user
    func createAlert(message: String) {
        let alertVC = UIAlertController(title: "Alert !", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    // Method to attribute the timing
    func intTimeToString(time: Int?) -> String {
        /// Initiliaze a string value
        var timeText = ""

        // Check if time is not nil using optional binding
        if let recipeTime = time {
            /// if time is 0
            if recipeTime == 0 {
                timeText = "?"
            } else if recipeTime < 60 {
                /// If time is less than 1h
                timeText = String(Int(recipeTime)) + "min"
            } else {
                /// If time is more than 1h
                let hours: Int = recipeTime / 60
                /// let roundedHours: Int = Int(hours.rounded(.down))
                let minutes: Int = recipeTime - (hours * 60)
                if minutes < 10 {
                    timeText = String(hours) + "h0" + String(minutes)
                } else {
                    timeText = String(hours) + "h" + String(minutes)
                }
            }
        } else {
            /// If time is nill
            timeText = "?"
        }
        return timeText
    }

}
