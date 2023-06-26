//
//  ViewController.swift
//  Programmatic UIKit #2
//
//  Created by DA MAC M1 135 on 2023/06/26.
//

import UIKit

class ViewController: UIViewController {
	
	private let button: UIButton = {
		let button = UIButton(frame: CGRect(x: 150, y: 200, width: 200, height: 55) )
		button.setTitle("Navigate", for: .normal)
		button.backgroundColor = .white
		button.setTitleColor(.black, for: .normal)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	func setup(){
		view.backgroundColor = .brown
		view.addSubview(button)
		
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	@objc func buttonTapped(){
		
		//MARK: Creates a new TabBar
		let tabBarVC = UITabBarController()
		
		let vc1 = UINavigationController(rootViewController: FirstViewController())
		let vc2 = UINavigationController(rootViewController: SecondViewController())
		let vc3 = UINavigationController(rootViewController: ThirdViewController())
		let vc4 = UINavigationController(rootViewController: FourthViewController())
		let vc5 = UINavigationController(rootViewController: FifthViewController())
		
		vc1.title = "Home"
		vc2.title = "Contact"
		vc3.title = "Help"
		vc4.title = "About"
		vc5.title = "settings"
		
		//MARK: Sets the bottom TabBar items to the view controllers in the array (must be array)
		tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
		
		guard let items = tabBarVC.tabBar.items else { return }
		
		let images = ["house", "bell", "person.circle", "star", "gear"]
		
		for i in 0..<items.count {
			items[items.count - 1].badgeValue = "3"
			items[i].image = UIImage(systemName: images[i])
		}
		
		tabBarVC.modalPresentationStyle = .fullScreen
		tabBarVC.modalTransitionStyle = .partialCurl
		
		//MARK: This code segues to the next view controller
		present(tabBarVC, animated: true, completion: nil)
	}
}



class FirstViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .purple
		title = "Home"
	}
}



class SecondViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemRed
		title = "Contact"
	}
}
