//
//  MWInfinitSlideBackUINavigationController.swift
//
//  Created by Diego Giardinetto on 2016/06/23.
//

/*
NOTES
Add the following code to the main view controller you want to start. In my implementation I want to prevent
slide gesture to go back to login view controller, that is my RootViewController for the UINavigationController.

func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
    // NOTE: infinite slide-back
    if let vcs = self.navigationController?.viewControllers {
        if vcs.count >= 2 && !vcs[vcs.count - 2].isKindOfClass(MWLoginViewController) {
            return true
        }
    }
    
    return false
}
--- */

import UIKit

class MWInfinitSlideBackUINavigationController: UINavigationController {
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
        return super.popToRootViewControllerAnimated(animated)
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        let poppedVC = super.popViewControllerAnimated(animated)
        
        guard poppedVC != nil else { return poppedVC }
        
        let lastPosition = 1 //self.viewControllers.count - 1
        self.viewControllers.insert(poppedVC!, atIndex: lastPosition)
        
        return poppedVC
    }
    
    override func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        let poppedVCs = super.popToViewController(viewController, animated: animated)
        
        guard poppedVCs != nil else { return poppedVCs }
        
        let lastPosition = 1 //self.viewControllers.count - 1
        self.viewControllers.insert(poppedVCs!, atIndex: lastPosition)
        
        return poppedVCs
    }
}
