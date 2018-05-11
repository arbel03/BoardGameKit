//
//  BoardLoader.swift
//  Memory Cards
//
//  Created by Arbel Israeli on 10/05/2018.
//  Copyright © 2018 Arbel Israeli. All rights reserved.
//

import Foundation

public class LevelSetting<T: BasePiece>: Decodable where T: Decodable {
    public private(set) var shouldShuffle: Bool!
    private var boardDimensions: BoardDimensions!
    private var boardData: [T]!
    
    enum CodingKeys: String, CodingKey {
        case boardDimensions = "BoardDimensions"
        case shouldShuffle = "ShouldShuffle"
        case boardData = "BoardData"
    }
    
    public func getBoardDimensions() -> BoardDimensions {
        return self.boardDimensions
    }
    
    public func getBoardData() -> [T] {
        return self.boardData
    }
}
