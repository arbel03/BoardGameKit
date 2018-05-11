//
//  BoardDataSource.swift
//  Minesweeper
//
//  Created by Arbel Israeli on 07/11/2016.
//  Copyright © 2016 arbel03. All rights reserved.
//

import Foundation

//Diamensions and info about the current board struct
public struct BoardDimensions: Decodable {
    private var cols: Int
    private var rows: Int
    
    enum CodingKeys: String, CodingKey {
        case rows = "Rows"
        case cols = "Columns"
    }
    
    public var boardSize: Int {
        get {
            return cols * rows
        }
    }
    
    public init(columns: Int, rows: Int) {
        self.cols = columns
        self.rows = rows
    }
    
    public init(squareWithDimension dimension: Int) {
        self.rows = dimension
        self.cols = dimension
    }
    
    public func getColumnCount() -> Int {
        return self.cols
    }
    
    public func getRowCount() -> Int {
        return self.rows
    }
    
    public func getRandomPosition() -> Position {
         return Position(row: Int(arc4random_uniform(UInt32(self.rows))), col: Int(arc4random_uniform(UInt32(self.cols))))
    }
    
    public func toPosition(index: Int) -> Position {
        let col = index % cols
        let row = index / cols
        return Position(row: row, col: col)
    }
}
