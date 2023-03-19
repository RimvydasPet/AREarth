//
//  ViewController.swift
//  AREarth
//
//  Created by Rimvydas on 2023-02-16.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
    
//        later for some testing
//        let text = SCNText()
//        Create a new scene
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")!
        
        sphere.materials = [material]
        
        let node = SCNNode()
         
        node.position = SCNVector3(x: 0, y: 0.1, z: -1)
        
        node.geometry = sphere
        
        // Set the scene to the view
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        let randomY = Float(arc4random_uniform(4) + 1) * (Float.pi/2)
        
        node.runAction(
            SCNAction.rotateBy(
                x: 0,
                y: CGFloat(randomY * 100000),
                z: 0,
                duration: 100000)
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        // check if supports AR on device
//        print("Session is supported = \(ARConfiguration.isSupported)")
//        print("Session is supported = \(ARWorldTrackingConfiguration.isSupported)")
        

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

  
}
