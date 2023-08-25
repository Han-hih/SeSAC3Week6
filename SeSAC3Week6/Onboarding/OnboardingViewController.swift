//
//  OnboardingViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/25.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
    }
}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
    }
}

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .magenta
    }
}

class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    

//    1.
    var list: [UIViewController] = []
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = [FirstViewController(), SecondViewController(), ThirdViewController()]
        view.backgroundColor = .lightGray
        
      delegate = self
        dataSource = self
        
        guard let first = list.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? { // 2번을 기준으로 1번을
        let example = [ 1,2,3,1,2,6,7,8 ]
        example.firstIndex(of: 2)  // 2가 중복이지만 firstIndex라 앞에 있는 인덱스가 전달됨
        
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = currentIndex - 1
        return previousIndex < 0 ? nil : list[previousIndex] // 현재 보고 있는 뷰의 인덱스보다 하나 전의 인덱스를 보여준다.
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? { // 2번을 기준으로 3번을
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        return nextIndex >= list.count ? nil : list[nextIndex]
    }
// 총 페이지 카운트
    //vertical과 pageCurl일 때는 페이지 컨트롤이 안보인다.
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0 }
        return index
    }
    
    
    
    
}







