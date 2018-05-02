//
//  BasePieceView.swift
//  Minesweeper
//
//  Created by Arbel Israeli on 30/03/2018.
//  Copyright © 2018 arbel03. All rights reserved.
//

import UIKit

protocol BasePieceView {
	associatedtype Piece: BasePiece
	
	func updateView(piece: Piece)
	func clearView()
}

