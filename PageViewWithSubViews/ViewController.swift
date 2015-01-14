//
//  ViewController.swift
//  PageViewWithSubViews
//
//  Created by Ketul Patani on 01/01/15.
//  Copyright (c) 2015 Ketul Patani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController : UIPageViewController?
    var i = 0
    
    @IBOutlet var subViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewForSubView()
        setupPageControl()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    
    func createPageViewForSubView()
    {
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("pageViewForSubView") as UIPageViewController
        pageController.dataSource = self
        let firstSubView = getSubViewController(0)
        let subViewColletion : NSArray = [firstSubView]
        pageController.setViewControllers(subViewColletion, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        pageViewController = pageController
        //addChildViewController(pageViewController!)
        
        self.subViewContainer.addSubview(pageViewController!.view)
        self.pageViewController?.view.frame = self.subViewContainer.bounds
        //self.pageViewController?.view.center = self.subViewContainer.center
        //pageViewController!.didMoveToParentViewController(self)
    }
    
    func getSubViewController(number : Int) -> viewToSubView
    {
       
        let subView = self.storyboard?.instantiateViewControllerWithIdentifier("subView") as viewToSubView
        subView.number = number
        return subView
    }
    
    
    //MARK:- PageView Functions DataSource
    

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let subView = viewController as viewToSubView
        
        if subView.number < 3
        {
            i = subView.number + 1
            return getSubViewController(i)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let subView = viewController as viewToSubView
        
        if subView.number > 0
        {
            i = subView.number - 1
            
            return getSubViewController(i)
        }
        return nil
    }
    
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 4
    }
        

    
    

}