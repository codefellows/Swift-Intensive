// Playground - noun: a place where people can play

import Cocoa
import XCPlayground

let view = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 480))

let box = NSBox(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
box.title = "Little Box"

view.addSubview(box)

box.borderColor = NSColor.blueColor()
box.fillColor = NSColor.redColor()
box.borderWidth = 5.0


let tableView = NSTableView(frame: NSRect(x: 0, y: 0, width: 320, height: 480))
tableView.backgroundColor = NSColor.redColor()

view.addSubview(tableView)

XCPShowView("view", view)

class DataSource : NSObject, NSTableViewDataSource, NSTableViewDelegate {
    
    var valueObjects : String[] = String[]()
    
    func numberOfRowsInTableView(tableView: NSTableView!) -> Int {
        return valueObjects.count
    }

    func tableView(tableView: NSTableView!,
        viewForTableColumn tableColumn: NSTableColumn!,
        row: Int) -> NSView!{
            let cellFrame = NSRect(x: 0, y: 0, width: 320, height: 60)
            let cell = NSTextField(frame: cellFrame)
            cell.backgroundColor = NSColor.redColor()
            cell.textColor = NSColor.blackColor()
            cell.font = NSFont(name: "Helvetica", size: 33.0)
            cell.stringValue = valueObjects[row]
            let view = NSView(frame: cellFrame)
            view.addSubview(cell)
            return view
    }
}

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

NSOperationQueue().addOperationWithBlock(){
    sleep(3)
    box.frame = NSRect(x: 0, y: 0, width: 320, height: 480)
    box.title = "Big Box"
}

var dataSource = DataSource()
dataSource.valueObjects.append("John")

tableView.setDataSource(dataSource)
tableView.setDelegate(dataSource)
