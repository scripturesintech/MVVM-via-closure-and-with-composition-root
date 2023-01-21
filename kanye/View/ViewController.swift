//
//  ViewController.swift
//  kanye
//
//  Created by ScripturesInTech on 21/01/23.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: ViewModel

    @IBOutlet weak var messageLabel: UILabel!

    required init?(coder aDecoder: NSCoder, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(coder: aDecoder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.loopingIn { quote in
            self.view.backgroundColor = .random
            self.messageLabel.text = quote.quote
        }
        
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                       blue: .random(in: 0...1), alpha: 1)
    }
}
