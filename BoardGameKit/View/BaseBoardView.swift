//
//  BaseBoardView.swift
//  Minesweeper
//
//  Created by Arbel Israeli on 30/03/2018.
//  Copyright © 2018 arbel03. All rights reserved.
//

import UIKit

open class BaseBoardView<T, V: BasePieceView>: UIStackView where V.Piece == T, V: UIView {
	private var dimensions: BoardDimensions?
	
    public var delegate: BoardDelegate? = nil

    public override init(frame: CGRect) {
		super.init(frame: frame)
		
		axis = .vertical
        alignment = .fill
        distribution = .fillEqually
        isUserInteractionEnabled = true
	}
	
    required public init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func getPieceView(forPosition position: Position) -> V {
		return (self.arrangedSubviews[position.getRow()] as! UIStackView).arrangedSubviews[position.getColumn()] as! V
	}
    
    @objc private func pieceViewTapped(tapGesture: UITapGestureRecognizer) {
        // TODO: return base piece view
        guard let position = dimensions?.toPosition(index: tapGesture.view!.tag) else {
            fatalError("Must call setBoard(board:) first.")
        }
        
        let row = self.arrangedSubviews[position.getRow()] as! UIStackView
        delegate?.boardView(didSelectPieceView: row.arrangedSubviews[position.getColumn()])
    }
	
	public func setBoard(board: BaseBoard<T>) {
		self.dimensions = board.getBoardDimensions()
		
        for row in 0 ..< self.dimensions!.getRowCount() {
			let newRow = UIStackView.GetBoardRow()
			
			for col in 0 ..< self.dimensions!.getColumnCount() {
				let pieceView = V(frame: CGRect.zero)
                pieceView.isUserInteractionEnabled = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pieceViewTapped))
                pieceView.addGestureRecognizer(tapGesture)
                // Set tag of tile
                pieceView.tag = row * self.dimensions!.getColumnCount() + col
                newRow.addArrangedSubview(pieceView)
			}
			self.addNewRow(newBoardRow: newRow)
		}
        
        updateBoardView(board: board)
	}
	
	public func updateBoardView(board: BaseBoard<T>) {
        guard let dimensions = self.dimensions else {
            fatalError("Must call setBoard(board:) first.")
        }
        // This function updates the board view given a GameBoard
		for row in 0 ..< dimensions.getRowCount() {
			for col in 0 ..< dimensions.getColumnCount() {
				let pos = Position(row: row, col: col)
                let piece = board.getPiece(forPosition: pos)
				getPieceView(forPosition: pos).updateView(piece: piece!)
			}
		}
	}
	
	public func resetBoardView() {
        // This function removes all BoardViews from the board
		for row in self.arrangedSubviews as! [UIStackView] {
			for pieceView in row.arrangedSubviews as! [BasePieceView] {
				pieceView.clearView()
			}
		}
	}

	public func addNewRow(newBoardRow boardRow: UIStackView) {
		// If board is not squared, panic
        precondition(boardRow.arrangedSubviews.count == self.dimensions?.getColumnCount(), "All rows in a board must have the same amount of GameViewPieces.")
		
        boardRow.isUserInteractionEnabled = true
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

