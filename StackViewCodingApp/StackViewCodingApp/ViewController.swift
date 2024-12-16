//
//  ViewController.swift
//  StackViewCodingApp
//
//  Created by FCI on 02/12/24.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayStackView()
    }
    @objc func displayStackView() {
        // image view
        let imageview = UIImageView()
        imageview.backgroundColor = UIColor.yellow
        imageview.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        imageview.image = UIImage(systemName: "pencil.circle")
        // text label
        let textlabel = UILabel()
        textlabel.backgroundColor = UIColor.yellow
        textlabel.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        textlabel.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        textlabel.text = "hi world"
        textlabel.textAlignment = .center
        // stack view
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.alignment = .center
        stackview.spacing  = 16.0
        stackview.addArrangedSubview(imageview)
        stackview.addArrangedSubview(textlabel)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackview)
        //constraints
        stackview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
