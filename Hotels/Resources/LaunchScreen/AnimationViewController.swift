//
//  AnimationViewController.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 15/01/24.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {
    
    var coordinator: HotelCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        var animationView = LottieAnimationView()
        animationView = .init(name: "launchScreenAnimation")
        animationView.loopMode = .loop // Adjust loop mode as needed
        animationView.contentMode = .scaleAspectFit
        animationView.frame = view.bounds
        animationView.play()
        view.addSubview(animationView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.showMainHotelVC()
        }
    }
    func showMainHotelVC() {
        coordinator?.showMainHotelVC()
    }
}

