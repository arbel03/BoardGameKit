//
//  BoardRowExtension.swift
//  BoardGameKit
//
//  Created by Arbel Israeli on 02/05/2018.
//  Copyright © 2018 Arbel Israeli. All rights reserved.
//

import Foundation

extension UIStackView {
    class func GetBoardRow() -> UIStackView {
        let boardRow = UIStackView()
        boardRow.axis = .horizontal
        boardRow.alignment = .center
        boardRow.distribution = .fillEqually
        return boardRow
    }
}
