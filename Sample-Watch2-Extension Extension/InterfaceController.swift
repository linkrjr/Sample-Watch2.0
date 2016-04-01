//
//  InterfaceController.swift
//  Sample-Watch2-Extension Extension
//
//  Created by Ronaldo Gomes on 27/03/2016.
//  Copyright © 2016 Technophile. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var picker:WKInterfacePicker!
    
    var numbers:[Int] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    private func updatePicker() {
        var items:[WKPickerItem] = []
        
        for number in numbers {
            let item = WKPickerItem()
            item.title = "Row Number: \(number)"
            
            items.append(item)
        }
        
        self.picker.setItems(items)        
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        if let data = applicationContext["key"] as? [[String:AnyObject]] {
            self.numbers.removeAll()
            
//            self.numbers = data
            
        }
    }
    
}
