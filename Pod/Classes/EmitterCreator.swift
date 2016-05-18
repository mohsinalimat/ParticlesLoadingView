//
//  EmitterCreator.swift
//  ParticlesLoadingView
//
//  Created by Patrick Balestra on 5/16/16.
//
//

import UIKit
import SpriteKit

public class EmitterCreator {
    
    public enum EmitterError: ErrorType {
        case EmitterNodeUnavailable
    }
    
    /// Creates a SKEmitterNode from one of the predefined particle emitter files.
    ///
    /// - throws: An error if the file could not be found.
    ///
    /// - returns: The emitter node object.
    func createEmitterNode(effect: ParticleEffect) throws -> SKEmitterNode {
        let bundleName = NSBundle(forClass: self.dynamicType).infoDictionary!["CFBundleName"] as! String
        let path = NSBundle(forClass: self.dynamicType).pathForResource(effect.rawValue, ofType: "sks", inDirectory: "\(bundleName).bundle")
        if let path = path, let emitter = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? SKEmitterNode {
            return emitter
        } else {
            throw EmitterError.EmitterNodeUnavailable
        }
    }
}

