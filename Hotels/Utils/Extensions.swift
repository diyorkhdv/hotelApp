//
//  Extensions.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 10/01/24.
//

import UIKit

extension UIViewController {
    func setupCustomBackButton() {
        // Create a custom button
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "arrow_back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Create a UIBarButtonItem with the custom button
        let customBackButton = UIBarButtonItem(customView: backButton)
        
        // Set the custom button as the leftBarButtonItem
        navigationItem.leftBarButtonItem = customBackButton
    }
    @objc func backButtonTapped() {
        // Handle the back button tap event
        navigationController?.popViewController(animated: true)
    }
    // MARK: - Alert
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") { cString.removeFirst() }
        
        if cString.count != 6 {
            self.init(hex:"ff0000") // return red color for wrong hex input
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

extension String {
    func insertSpace() -> String {
        var result = ""
        var counter = 0
        
        for char in self {
            if counter == 3 {
                result.append(" ")
                counter = 0
            }
            result.append(char)
            counter += 1
        }
        
        return result
    }
}
