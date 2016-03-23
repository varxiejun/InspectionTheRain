//
//  TableViewCell.swift
//  Lesson_Swift-09.02
//
//  Created by 看楼听雨 on 15/9/2.
//  Copyright (c) 2015年 XJ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var picture = UIImageView() // 照片
    var name = UILabel()        // 姓名
    var gender = UILabel()      // 性别
    var age = UILabel()         // 年龄
    var hobby = UILabel()       // 爱好
    var phoneNumber = UILabel() // 电话
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.person = Person()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        picture.frame = CGRectMake(10, 10, 60, 80)
        
        let nameLabel = UILabel()
        
        nameLabel.frame = CGRectMake(80, 10, 40, 20)
        nameLabel.text = "姓名:"
        nameLabel.font = UIFont .systemFontOfSize(14)
        name.frame = CGRectMake(120, 10, 100, 20)
        name.font = UIFont .systemFontOfSize(14)

        
        let sex = UILabel()
        sex.frame = CGRectMake(220, 10, 40, 20)
        sex.text = "性别:"
        sex.font = UIFont .systemFontOfSize(14)
        gender.frame = CGRectMake(270, 10, 30, 20)
        gender.font = UIFont .systemFontOfSize(14)

        
        phoneNumber.frame = CGRectMake(80, 40, 120, 20)
        phoneNumber.font = UIFont .systemFontOfSize(14)
        
        let hobbyLabel = UILabel()
        hobbyLabel.text = "爱好:"
        hobbyLabel.frame = CGRectMake(80, 70, 40, 20)
        hobbyLabel.font = UIFont .systemFontOfSize(14)
        hobby.frame = CGRectMake(120, 70, 120, 20)
        hobby.font = UIFont .systemFontOfSize(14)
        
        self.contentView .addSubview(picture)
        self.contentView .addSubview(name)
        self.contentView .addSubview(gender)
        self.contentView .addSubview(hobby)
        self.contentView .addSubview(phoneNumber)
        
        self.contentView .addSubview(nameLabel)
        self.contentView .addSubview(sex)
        self.contentView .addSubview(hobbyLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var person : Person
    {
        didSet{
            self.name.text = person.name
            self.picture.image = UIImage(named: person.picture)
            self.gender.text = person.gender
            self.hobby.text = person.hobby
            self.phoneNumber.text = "电话:" + person.phoneNumber
            
        }
    }
}
