//
//  ViewController.swift
//  Text-Swift
//
//  Created by 看楼听雨 on 15/12/6.
//  Copyright © 2015年 XJ. All rights reserved.
//

import UIKit

private let kCellID = "kCellID"

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    var dataSouce = NSMutableArray()
    var dic = NSDictionary()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor .whiteColor()
        let tableView = UITableView()
        tableView.frame = self.view.frame
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = UIColor .whiteColor()
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: kCellID)
        self.view.addSubview(tableView)
        
        let bundel = NSBundle .mainBundle()
        let plistPath = bundel.pathForResource("TenList", ofType: "plist")
        dic = NSDictionary(contentsOfFile: plistPath!)!
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addPerson")
        dataSouce = NSMutableArray(array: dic.allKeys)
        
        for (var i = 0; i < dataSouce.count; i++){
            for (var j = 0; j < dataSouce.count - i - 1; j++){
                let str1 = dataSouce[j]
                let str2 = dataSouce[j + 1]as!NSString
                if (str1 .compare(str2 as String) == NSComparisonResult.OrderedDescending){
                    let temp: AnyObject = dataSouce[j]
                    dataSouce[j] = dataSouce[j + 1]
                    dataSouce[j + 1] = temp
                }
            }
        }
    }
    
    func addPerson(sender: AnyObject){
        print("=======")
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true;
    }

    // 返回高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 100;
    }
    // 每个分区的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let str: String = dataSouce[section] as! String
        
        let nameArr = (dic[str])as! NSMutableArray
        
        return nameArr.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return dataSouce.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        let str: String = dataSouce[section] as! String
        
        return str
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : TableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellID, forIndexPath: indexPath)as! TableViewCell
        let str: String = dataSouce[indexPath.section] as! String
        let nameArr = (dic[str])as! NSMutableArray
        
        let person = Person()
        person . setValuesForKeysWithDictionary(nameArr[indexPath.row] as! [String : AnyObject]);
        cell.person = person
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

