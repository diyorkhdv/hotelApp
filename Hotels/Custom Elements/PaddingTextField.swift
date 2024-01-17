//
//  PaddingTextField.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 13/01/24.
//

import UIKit

class PaddedTextField: UITextField {
    
    // MARK: - Properties
    
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.backgroundColor = MainHotelColors.seperatorColor
        self.placeholder = "test"
        self.layer.cornerRadius = 10
    }
    
    // MARK: - Padding
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
