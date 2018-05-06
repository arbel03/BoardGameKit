//
//  Board.swift
//  Minesweeper
//
//  Created by Arbel Israeli on 17/11/2016.
//  Copyright © 2016 arbel03. All rights reserved.
//

import Foundation

open class BaseBoard<T: BasePiece> {
    //Tiles array
    private var board: [[T]]
    //Board dimensions
    private var dimensions: BoardDimensions

    public init(dimensions: BoardDimensions) {
        self.board = [[T]]()
        self.dimensions = dimensions
        
        for _ in 0 ..< self.dimensions.getRowCount() {
            var row = [T]()
            for _ in 0 ..< self.dimensions.getColumnCount() {
                row.append(T())
            }
            board.append(row)
        }
    }
 
    public subscript(_ row: Int, _ column: Int) -> T {
        return getPiece(forPosition: Position(row: row, col: column))!
    }
    
    public func getPiece(forIndex index: Int) -> T? {
		return getPiece(forPosition: dimensions.toPosition(index: index))
    }
	
    public func getPiece(forPosition position: Position) -> T? {
		if position.getColumn() >= 0 && position.getColumn() < dimensions.getColumnCount() && position.getRow() >= 0 && position.getRow() < dimensions.getRowCount() {
			return board[position.getRow()][position.getColumn()]
		}
		return nil
	}

    public func setPiece(atPosition position: Position, piece: T) {
        board[position.getRow()][position.getColumn()] = piece
    }
    
    public func getBoardDimensions() -> BoardDimensions {
        return self.dimensions
    }
}
