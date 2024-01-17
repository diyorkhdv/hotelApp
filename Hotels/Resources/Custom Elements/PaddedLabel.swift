//
//  PaddedLabel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 14/01/24.
//

import UIKit

class PaddedLabel: UILabel {
    // Padding values
    let horizontalPadding: CGFloat = 10.0
    let verticalPadding: CGFloat = 5.0

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += 2 * horizontalPadding
        contentSize.height += 2 * verticalPadding
        return contentSize
    }

    override func drawText(in rect: CGRect) {
        let paddedRect = rect.insetBy(dx: horizontalPadding, dy: verticalPadding)
        super.drawText(in: paddedRect)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }

    private func setupLabel() {
        // Customize label appearance
        backgroundColor = MainHotelColors.featureBackgroundColor
        textColor = MainHotelColors.grayColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
        numberOfLines = 1
        // Add any additional configurations as needed
    }
}
