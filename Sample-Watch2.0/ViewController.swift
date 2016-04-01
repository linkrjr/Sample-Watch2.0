//
//  ViewController.swift
//  Sample-Watch2.0
//
//  Created by Ronaldo Gomes on 27/03/2016.
//  Copyright © 2016 Technophile. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet var tableView:UITableView!
    
    var data = [1,2,3,4,5,6,7,8,9,10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        
        var context = session.applicationContext
        context["key"] = data
        
        do {
            try session.updateApplicationContext(context)
        } catch let error {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: WCSessionDelegate {

    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        
        if let arrayOfDictionaries = applicationContext["key"] as? [[String:AnyObject]] {
            print(arrayOfDictionaries)
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = "Row number: \(indexPath.row)"
        return cell
    }
    
}

extension ViewController {
    
    private func applyConstraints() {
    
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self.tableView,
                           attribute: .Top,
                           relatedBy: .Equal,
                           toItem: self.view,
                           attribute: .Top,
                           multiplier: 1.0,
                           constant: 0).active = true

        NSLayoutConstraint(item: self.tableView,
                           attribute: .Bottom,
                           relatedBy: .Equal,
                           toItem: self.view,
                           attribute: .Bottom,
                           multiplier: 1.0,
                           constant: 0).active = true

//        NSLayoutConstraint(item: self.tableView,
//                           attribute: .Leading,
//                           relatedBy: .Equal,
//                           toItem: self.view,
//                           attribute: .Leading,
//                           multiplier: 1.0,
//                           constant: 0).active = true
//
//        NSLayoutConstraint(item: self.tableView,
//                           attribute: .Trailing,
//                           relatedBy: .Equal,
//                           toItem: self.view,
//                           attribute: .Trailing,
//                           multiplier: 1.0,
//                           constant: 0).active = true
        
    }
    
}