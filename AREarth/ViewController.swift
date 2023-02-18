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
        
        // Create a new scene
//      Demo:  let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
       // let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        later for some testing
//        let text = SCNText()
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
