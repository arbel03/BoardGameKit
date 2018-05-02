//
//  BoardDelegate.swift
//  Minesweeper
//
//  Created by Ido Czesler on 11/11/2016.
//  Copyright © 2016 arbel03. All rights reserved.
//

import Foundation

//Simple position struct ofor confort
public struct Position {
    private var col: Int
    private var row: Int
    
    public init(row: Int, col: Int){
        self.row = row
        self.col = col
    }
    
    public func getRow() -> Int {
        return self.row
    }
    
    public func getColumn() -> Int {
        return self.col
    }
}

extension Position: Equatable {
	public static func ==(lhs: Position, rhs: Position) -> Bool {
		return lhs.getColumn() == rhs.getColumn() && lhs.getRow() == rhs.getRow()
	}
}
