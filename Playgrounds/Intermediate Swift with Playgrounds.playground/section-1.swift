// Playground - noun: a place where people can play

import UIKit

var fullName = "John "

fullName += "Clem"

for character in fullName {
    "\(character)"
}

var redView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
redView.backgroundColor = UIColor.redColor()

var blueView = UIView(frame: CGRectMake(20.0, 20.0, 80.0, 80.0))
blueView.backgroundColor = UIColor.blueColor()
redView.addSubview(blueView)

blueView.layer.cornerRadius = 40.0
blueView.layer.borderColor = UIColor.whiteColor().CGColor
blueView.layer.borderWidth = 4.0

for currentFrame in 0..24 {
    blueView.transform = CGAffineTransformTranslate(blueView.transform, 15.0, 15.0)
    redView
}
redView

// Infixes
let blue = UIColor.blueColor()
let red = UIColor.redColor()

@infix func + (firstColor : UIColor, secondColor : UIColor) -> UIColor {
    var r1 : CGFloat = 0.0
    var g1 : CGFloat = 0.0
    var b1 : CGFloat = 0.0
    var r2 : CGFloat = 0.0
    var g2 : CGFloat = 0.0
    var b2 : CGFloat = 0.0
    firstColor.getRed(&r1, green: &g1, blue: &b1, alpha: nil)
    secondColor.getRed(&r2, green: &g2, blue: &b2, alpha: nil)
    let newColor = UIColor(red: (r1+r2)/2.0, green: (g1+g2)/2.0, blue: (b1+b2)/2.0, alpha: 1.0)
    return newColor
}

UIColor.redColor() + UIColor.lightGrayColor()
UIColor.redColor() + UIColor.yellowColor()
UIColor.redColor() + UIColor.blueColor()

for i in 0.0..100.0 {
    sin(i / 10)
}


// UITableView
class DataSource : NSObject, UITableViewDataSource {

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")

        cell.textLabel.text = "Cell #\(indexPath.row)"
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        return cell
    }
}

let tableView = UITableView(frame: CGRectMake(0.0, 0.0, 320.0, 480.0), style: UITableViewStyle.Plain)
let dataSource = DataSource()
tableView.dataSource = dataSource
tableView.reloadData()

tableView
