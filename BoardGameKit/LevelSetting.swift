//
//  BoardLoader.swift
//  Memory Cards
//
//  Created by Arbel Israeli on 10/05/2018.
//  Copyright © 2018 Arbel Israeli. All rights reserved.
//

import Foundation

public class LevelSetting: Decodable {
    public private(set) var shouldShuffle: Bool!
    private var boardDimensions: BoardDimensions!
    
    enum CodingKeys: String, CodingKey {
        case boardDimensions = "BoardDimensions"
        case shouldShuffle = "ShouldShuffle"
    }
    
    public init(dimensions: BoardDimensions, shouldShuffle: Bool) {
        self.boardDimensions = dimensions
        self.shouldShuffle = shouldShuffle
    }
    
    public func getBoardDimensions() -> BoardDimensions {
        return self.boardDimensions
    }
}
