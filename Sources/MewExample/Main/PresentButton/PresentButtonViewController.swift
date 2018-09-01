//
//  PresentButtonViewController.swift
//  Mew
//
//  Created by tarunon on 2018/08/29.
//  Copyright © 2018 Mercari. All rights reserved.
//

import UIKit
import Mew

/// Note: Present ValueInput when tapped button.
/// Output is user inputed value.
final class PresentButtonViewController: UIViewController, Instantiatable, Interactable {
    struct Model {
        // No status
        static var initial = Model()
    }
    
    typealias Environment = EnvironmentMock
    typealias Input = Void
    typealias Output = Int

    var model: Model = .initial {
        didSet {
            // nop
        }
    }
    
    var environment: EnvironmentMock
    var handler: ((Int) -> ())?

    init(with input: Input, environment: Environment) {
        self.environment = environment
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func output(_ handler: ((Int) -> Void)?) {
        self.handler = handler
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let viewController = ValueInputViewController(with: .init(presentedStyle: .present), environment: environment)
        viewController.output { (output) in
            self.handler?(output.numberInput)
        }
        present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }
}

