//
//  ViewController.swift
//  Golden Ratio
//
//  Created by Som, Mal on 8/29/15.
//  Copyright (c) 2015 Som, Mal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var overlayViewControllers: Array<UIViewController>!
    var cameraView: JMBackgroundCameraView!
    var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()
        
        cameraView = JMBackgroundCameraView(frame: view.bounds, position: DevicePosition.Back)
        view.addSubview(cameraView)
        view.sendSubviewToBack(cameraView)
    }
    
    func setupPageViewController() {
        let firstOverlayViewController = storyboard?.instantiateViewControllerWithIdentifier("OverlayViewController") as! OverlayViewController
        firstOverlayViewController.image = UIImage(named: "gratio")
        
        let secondOverlayViewController = storyboard?.instantiateViewControllerWithIdentifier("OverlayViewController") as! OverlayViewController
        secondOverlayViewController.image = UIImage(named: "gratioland")
        
        overlayViewControllers = [firstOverlayViewController, secondOverlayViewController]
        
        pageViewController.setViewControllers([overlayViewControllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        pageViewController.dataSource = self
        
        for view in pageViewController.view.subviews {
            if let scrollView = view as? UIScrollView {
                scrollView.scrollEnabled = false
            }
        }
        leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "goToNextPage:")
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "goToPreviousPage:")
        rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        pageViewController.view.addGestureRecognizer(leftSwipeGestureRecognizer)
        pageViewController.view.addGestureRecognizer(rightSwipeGestureRecognizer)
    }
    
    func goToPreviousPage(sender: UISwipeGestureRecognizer) {
        if pageIndex > 0 {
            pageIndex--
            pageViewController.setViewControllers([overlayViewControllers[pageIndex]], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: nil)
        }
    }
    
    func goToNextPage(sender: UISwipeGestureRecognizer) {
        if pageIndex < overlayViewControllers.count - 1 {
            pageIndex++
            pageViewController.setViewControllers([overlayViewControllers[pageIndex]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = find(overlayViewControllers, viewController) where index < overlayViewControllers.count - 1 {
            return overlayViewControllers[(index + 1)]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = find(overlayViewControllers, viewController) where index > 0 {
            return overlayViewControllers[(index - 1)]
        }
        return nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pageViewController = segue.destinationViewController as! UIPageViewController
    }
    
    @IBAction func saveScreenShot(sender: UITapGestureRecognizer) {
        cameraView.preview.connection.enabled = !cameraView.preview.connection.enabled
    }
}