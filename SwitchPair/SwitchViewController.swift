//
//  SwitchViewController.swift
//  SwitchPair
//
//  Created by Yangjie Lu on 10/13/16.
//  Copyright © 2016 Lu. All rights reserved.
//

import Foundation
import UIKit

class SwitchViewController: UIViewController {
    private var viewModel: SwitchViewModel!
    private var selectCoders: [NameCellModel] = []    

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().applicationSupportsShakeToEdit = true
        becomeFirstResponder()

        self.nameLabel.text = self.viewModel.getCurrentCoder().name
    }

    func bindViewModel(viewModel: SwitchViewModel) {
        self.viewModel = viewModel
    }

    func shake() {
        UIView.animateKeyframesWithDuration(1.5, delay: 0, options: UIViewKeyframeAnimationOptions.BeginFromCurrentState, animations: { () -> Void in

        }, completion: { (Bool) -> Void in
            UIView.animateKeyframesWithDuration(1.5, delay: 0, options: UIViewKeyframeAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
                    self.changePair()
                }, completion: { (Bool) -> Void in
                    UIView.animateKeyframesWithDuration(1.5, delay: 0, options: UIViewKeyframeAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
                        self.changePair()
                        }, completion: { (Bool) -> Void in
                            UIView.animateKeyframesWithDuration(1, delay: 0, options: UIViewKeyframeAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
                                self.changePair()
                                }, completion:  { (Bool) -> Void in
                                    UIView.animateKeyframesWithDuration(1.5, delay: 0, options: UIViewKeyframeAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
                                        self.changePair()
                                        }, completion:nil)
                            })
                    })
            })
        })
    }

    func changePair() {
        self.nameLabel.text = self.viewModel.getCurrentCoder().name
        self.view.backgroundColor = self.viewModel.randomColor()
    }

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("begin")
        if motion == .MotionShake{
            shake()
        }
    }

    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("cancel")
    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("end")
    }

}
