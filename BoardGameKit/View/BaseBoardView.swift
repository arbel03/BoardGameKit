//
//  BaseBoardView.swift
//  Minesweeper
//
//  Created by Arbel Israeli on 30/03/2018.
//  Copyright © 2018 arbel03. All rights reserved.
//

import UIKit

class BaseBoardView<T, V: BasePieceView>: UIStackView where V.Piece == T, V: UIView {
	private var dimensions: BoardDimensions!
	
    public override init(frame: CGRect) {
		super.init(frame: frame)
		
		axis = .vertical
		alignment = .fill
		distribution = .equalSpacing
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func getPieceView(forPosition position: Position) -> V {
		return (self.arrangedSubviews[position.getRow()] as! UIStackView).arrangedSubviews[position.getColumn()] as! V
	}
	
	public func setBoard(board: BaseBoard<T>) {
		self.dimensions = board.getBoardDimensions()
		
		for row in 0 ..< self.dimensions.getRowCount() {
			let newRow = UIStackView.GetBoardRow()
			
			for col in 0 ..< self.dimensions.getColumnCount() {
				let pieceView = V(frame: CGRect.zero)
				// Set tag of tile
				pieceView.tag = row * self.dimensions.getColumnCount() + col
				// Set the aspect ratio of the PieceView - 1:1
				pieceView.widthAnchor.constraint(equalTo: pieceView.heightAnchor, multiplier: 1).isActive = true
				newRow.addArrangedSubview(pieceView)
			}
			self.addNewRow(newBoardRow: newRow)
		}
	}
	
	public func updateBoardView(board: BaseBoard<T>) {
        // This function updates the board view given a GameBoard
		for row in 0..<self.dimensions.getRowCount() {
			for col in 0..<self.dimensions.getColumnCount() {
				let pos = Position(row: row, col: col)
				getPieceView(forPosition: pos).updateView(piece: board.getPiece(forPosition: pos)!)
			}
		}
	}
	
	public func resetBoardView() {
        // This function removes all BoardViews from the board
		for row in 0..<self.dimensions.getRowCount() {
			for col in 0..<self.dimensions.getColumnCount() {
				let pos = Position(row: row, col: col)
				getPieceView(forPosition: pos).clearView()
			}
		}
	}
	
	public func addNewRow(newBoardRow boardRow: UIStackView) {
		// If board is not squared, panic
		precondition(boardRow.arrangedSubviews.count == self.dimensions.getColumnCount(), "All rows in a board must have the same amount of GameViewPieces.")
		
		self.addArrangedSubview(boardRow)
		// Add equal height constraint for the new row
		if self.arrangedSubviews.count > 1 {
			let firstRow = self.arrangedSubviews[0]
			boardRow.heightAnchor.constraint(equalTo: firstRow.heightAnchor).isActive = true
		}
	}
	
	public func clearBoardView() {
		for row in self.arrangedSubviews {
			row.removeFromSuperview()
		}
	}
}

