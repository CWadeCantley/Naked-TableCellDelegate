//
//  ViewController.swift
//  TableCellDelegate
//
//  Created by Chris Cantley on 6/1/15.
//  Copyright (c) 2015 Chris Cantley. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, CellInfoDelegate {

    //The place to put the number into.
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //2)...to here.
    
    func processThatNumber(theNumber: Int) {
        println("out : \(theNumber)")
        self.sumLabel.text = toString(theNumber) as String
    }
}


// Table View delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    
    //One row
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // Load custom cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("thisCustomCell", forIndexPath: indexPath) as! CellViewController
        
        //SOLUTION : put the Delgate HERE in the place where the cell is instantiated so that there is a connection back
        // to this class from the Cell class
        cell.delegate = self
        
        return cell
    }
    
}


//-------------------- Protocol for Delegate -----------------------

protocol CellInfoDelegate {
    func processThatNumber(theNumber: Int)
}



//-------------------- Cell to Pass info to Parent -----------------------

class CellViewController: UITableViewCell{
    
    var sumNumber: Int = 0
    var delegate: CellInfoDelegate?
    
    
    @IBAction func addButton(sender: AnyObject) {
        
        // increment that number
        self.sumNumber += 5
        
        // pass that number to the delegate method
        if let delegate = self.delegate {
            delegate.processThatNumber(self.sumNumber)
        }
        
        
        //Shows that the number is incrementing
        println(sumNumber)
        
    }
}

