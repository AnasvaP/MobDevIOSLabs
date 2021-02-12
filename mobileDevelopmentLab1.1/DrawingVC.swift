//
//  drawingVC.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 09.02.2021.
//

import UIKit

class DrawingVC: UIViewController {

    @IBOutlet weak var viewForDraw: DrawingView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var bezierPath = UIBezierPath()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func segmentControlAction(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            print("0")
            
        } else {
            
            print("1")
        }
    }
    

    

}
