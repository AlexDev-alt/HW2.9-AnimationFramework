//
//  Models.swift
//  HW2.9 AnimationFramework
//
//  Created by Macbook on 25.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import Foundation

struct Animation {
    
    var animationType: String
    
}

extension Animation {
    
    static func getAnimationData() -> [String] {
        
        var animationTypes = [String]()
        let animations = DataManager.shared.animationType
        
        for index in 0..<animations.count {
        
            let type = animations[index]
            animationTypes.append(type)
        }
        
        return animationTypes
    }
}


