//
//  ViewController.swift
//  swift-uitableview
//
//  Created by gguser on 9/6/2014.
//  Copyright (c) 2014 gguser. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var tableView :UITableView?
  var items :NSMutableArray?
  var leftButton :UIButton?
  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTableView()
    self.setupLeftBarButtonItem()
    self.setupRightBarButtonItem()
    self.title = "Swift UITableView"
    self.items = NSMutableArray()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
// MARK: - Set up table view
  func setupTableView() {
    self.tableView = UITableView(frame: self.view!.frame);
    self.tableView!.delegate = self;
    self.tableView!.dataSource = self;
    self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    self.view!.addSubview(self.tableView)
  }
  
// MARK: - UINavigation Bar Button
  func setupLeftBarButtonItem()
  {
    self.leftButton = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
    self.leftButton!.frame = CGRectMake(0,0,50,40)
    self.leftButton?.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    self.leftButton?.setTitle("Edit", forState: UIControlState.Normal)
    self.leftButton!.tag = 100
    self.leftButton!.userInteractionEnabled = false
    self.leftButton?.addTarget(self, action: "leftBarButtonItemClicked", forControlEvents: UIControlEvents.TouchUpInside)
    var barButtonItem = UIBarButtonItem(customView: self.leftButton)
    self.navigationItem!.leftBarButtonItem = barButtonItem
  }
  
  func setupRightBarButtonItem()
  {
    var barButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self, action: "rightBarButtonItemClicked")
    self.navigationItem!.rightBarButtonItem = barButtonItem
  }
  
  func rightBarButtonItemClicked()
  {
    
    var row = self.items!.count
    var indexPath = NSIndexPath(forRow:row,inSection:0)
    self.items?.addObject("1")
    self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
    self.leftButton!.userInteractionEnabled = true
  }
  
  func leftBarButtonItemClicked()
  {
    if (self.leftButton!.tag == 100)
    {
      self.tableView?.setEditing(true, animated: true)
      self.leftButton!.tag = 200
      self.leftButton?.setTitle("Done", forState: UIControlState.Normal)
    }
    else
    {
      self.tableView?.setEditing(false, animated: true)
      self.leftButton!.tag = 100
      self.leftButton?.setTitle("Edit", forState: UIControlState.Normal)
    }
    
  }
  
// MARK: - UITableViewDataSource
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
  {
    return self.items!.count
  }
  
  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
  {
    let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel.text = String(format: "%i", indexPath.row+1)
    return cell
  }
  
  func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
  {
    return true
  }
  
  func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
  {
    self.items?.removeObjectAtIndex(indexPath.row)
    
    self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    if (self.items!.count == 0)
    {
      self.leftButton!.userInteractionEnabled = false
    }
    
  }
  
  func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle
  {
    return (UITableViewCellEditingStyle.Delete)
  }
  
  func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool
  {
    return true
  }
  
  func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
  {
    self.tableView?.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
    self.items?.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
  }
  
  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
  {
    println("row = %d",indexPath.row)
  }
  
}
