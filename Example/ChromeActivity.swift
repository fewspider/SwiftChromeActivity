//
//  ChromeActivity.swift
//  SwiftChromeActivity
//
//  Created by fewspider on 15/8/29.
//  Copyright (c) 2015年 CocoaPods. All rights reserved.
//

import UIKit
import Foundation

class ChromeActivity: UIActivity {
    private var url = ""
    private var sourceName = ""
    private var callbackName = ""

    override init() {
        super.init()

        var bundle = NSBundle.mainBundle()

        if let bundleName = ([bundle.infoDictionary!][0]
                                .objectForKey("CFBundleName")) as? String {
            sourceName = bundleName
        }

        if let urlScheme = (([bundle.infoDictionary!][0]
                                .objectForKey("CFBundleURLTypes") as! NSArray)[0]
                                    .valueForKey("CFBundleURLSchemes") as! NSArray!)[0] as? String {
            callbackName = "\(urlScheme)://"
        }
    }

    override func activityType() -> String? {
        return "ChromeActivity"
    }

    override func activityTitle() -> String? {
        return "Open in Chrome"
    }

    override func activityImage() -> UIImage? {
        return UIImage(named: "chrome-activity-icon")
    }

    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for item in activityItems {
            var urlStr = item as! String
            return urlIsOK(urlStr)
        }
        return false
    }

    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for item in activityItems {
            url = (item as? String)!
        }
    }

    override func performActivity() {
        var chromeUrl = parseChromeUrl(url)

        if let realUrl = NSURL(string: chromeUrl) {
            UIApplication.sharedApplication().openURL(realUrl)
        }
    }

    func parseChromeUrl(url: String) -> String {
        var chromeUrl = ""

        var set = NSCharacterSet.URLQueryAllowedCharacterSet()
        if let openURLString = NSURL(string: url)!.absoluteString?.stringByAddingPercentEncodingWithAllowedCharacters(set) {

            var callbackUrl = "googlechrome-x-callback://x-callback-url/open/"
                                + "?x-source=\(sourceName)"
                                + "&x-success=\(callbackName)"
                                + "&url=\(openURLString)"
                                + "&create-new-tab"

            chromeUrl = callbackUrl
        }
        return chromeUrl
    }

    func urlIsOK(url: String) -> Bool {
        var chromeUrl = parseChromeUrl(url)

        var urlIsOK = UIApplication.sharedApplication().canOpenURL(NSURL(string: url)!)

        if urlIsOK {
            if let realUrl = NSURL(string: chromeUrl) {
                return UIApplication.sharedApplication().canOpenURL(realUrl)
            }
        }
        return false
    }
}
