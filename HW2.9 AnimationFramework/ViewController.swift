//
//  ViewController.swift
//  HW2.9 AnimationFramework
//
//  Created by Macbook on 25.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import Spring

class ViewController: UIViewController {
        
    private let animations = Animation.getAnimationData()
    private var index = 0
    
    //MARK: - IBOutlests
    @IBOutlet var textLabel: SpringLabel!
    
    @IBOutlet var viewLabel: SpringView!
    
    @IBOutlet var buttonLabel: SpringButton!
    @IBOutlet var randomAnimationButtonLabel: SpringButton!
    @IBOutlet var resetButtonLabel: SpringButton!
    
    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    //MARK: - IBActions
    @IBAction func runAnimationButton() {
        animator()
    }
    
    @IBAction func randomAnimationButton(_ sender: SpringButton) {
        index = Int.random(in: 0..<animations.count)
        
        animator()
        
    }
    
    @IBAction func resetButton() {
        
        index = 0
        textLabel.text = "Animation"
        buttonLabel.setTitle("Go",
                             for: .normal)
        
        buttonLabel.isHidden = false
        resetButtonLabel.isHidden = true
        
    }
    
    //MARK: - Private methods
    private func animator() {
        if index < animations.count - 1 {
            
            viewLabel.animation = animations[index]
            getRandomConfigAnimation()
            getDescription(with: animations[index], for: textLabel)
            
            viewLabel.animate()
            index += 1
            
        } else {
            textLabel.text = "the end"
            buttonLabel.isHidden = true
            resetButtonLabel.isHidden = false
        }
        
        buttonLabel.setTitle("next animation type \(animations[index])",
            for: .normal)
    }
    
    private func getDescription(with name: String, for label: SpringLabel) {
        viewLabel.animation = name
        textLabel.text = """
        Name: \(name.description)
        Duration: \(String(format: "%.2f", viewLabel.duration))
        Force: \(String(format: "%.2f", viewLabel.force))
        Velocity: \(String(format: "%.2f", viewLabel.velocity))
        Damping: \(String(format: "%.2f", viewLabel.damping))
        """
    }
    
    private func getRandomConfigAnimation() {
        viewLabel.duration = CGFloat(Double.random(in: 1.0...2.5))
        viewLabel.force = CGFloat((Double.random(in: 0.0...1.5)))
        viewLabel.velocity = CGFloat(Double.random(in: 0.0...1.5))
        viewLabel.damping = CGFloat(Double.random(in: 0.0...1.5))
        
    }
  
    private func setUI() {
           viewLabel.layer.cornerRadius = 10
           
           buttonLabel.layer.cornerRadius = 10
           randomAnimationButtonLabel.layer.cornerRadius = 10
           resetButtonLabel.layer.cornerRadius = 10
           
           textLabel.text = "Animation"
           buttonLabel.setTitle("animation type \(animations[index])",
               for: .normal)
           
           resetButtonLabel.isHidden = true
       }
    
}

