//
//  BoardDelegate.swift
//  BoardGameKit
//
//  Created by Arbel Israeli on 10/05/2018.
//  Copyright © 2018 Arbel Israeli. All rights reserved.
//

import UIKit

public protocol BoardDelegate {
    func boardView(didSelectPieceView pieceView: UIView)
}
