//
//  ViewController.swift
//  SwiftChromeActivity
//
//  Created by fewspider on 08/29/2015.
//  Copyright (c) 2015 fewspider. All rights reserved.
//

import UIKit
import SwiftChromeActivity

class ViewController: UIViewController {

    // MARK: - outlet
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var urlIsOkLabel: UILabel!

    // MARK: - view override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - action
    @IBAction func share(sender: AnyObject) {
        var urlText = urlTextField.text

        var set = NSCharacterSet.whitespaceCharacterSet()
        var sharingURL = urlText.stringByTrimmingCharactersInSet(set)

        var isOK = ChromeActivity().urlIsOK(sharingURL)

        urlIsOkLabel.text = "\(isOK)"

        if isOK {
            shareURL(sharingURL)
        }

    }

    // MARK: - shareURL
    func shareURL(sharingURL: String?) {

        let activityViewController = UIActivityViewController(activityItems: [sharingURL!],
                                                              applicationActivities: [ChromeActivity()])

        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
}