//
//  Content102Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content102Cell: UITableViewCell {
    
    lazy private var headerLabel1:UILabel = {
         let a = UILabel()
         a.textAlignment = .left
         a.text = "数据数据数据数据"
         a.numberOfLines = 0
         return a
     }()
     
     
     lazy private var headerLabel2:UILabel = {
         let a = UILabel()
         a.textAlignment = .left
         a.text = "数据数据数据数据"
         a.numberOfLines = 0
         return a
     }()
     
     lazy private var bigImage:UIImageView = {
         let a = UIImageView()
         a.layer.cornerRadius = 6
         a.layer.masksToBounds = true
         a.image = UIImage.init(named: Image.fillImage("feng_10"))

         a.contentMode = .scaleAspectFill

         return a
     }()
     lazy private var line:UIView = {
         let a = UIView()
         a.backgroundColor = bgColor
         return a
     }()
    
     lazy private var tap:UITapGestureRecognizer = {
         let a = UITapGestureRecognizer()
         return a
     }()
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         self.contentView.addSubview(self.bigImage)
         
         self.contentView.addSubview(self.headerLabel1)
         self.contentView.addSubview(self.headerLabel2)


         let w = 80

         self.bigImage.snp.makeConstraints { (make) in
             
             make.top.equalTo(20)
             make.right.equalTo(-12)
             make.height.equalTo(w)
             make.width.equalTo(w)
             
         }
        
         self.headerLabel1.snp.makeConstraints { (make) in
             
             make.left.equalTo(12)
             make.top.equalTo(self.bigImage)
             
         }
         self.headerLabel2.snp.makeConstraints { (make) in
             
             make.left.equalTo(12)
             make.top.equalTo(self.headerLabel1.snp_bottomMargin).offset(20)

         }
        self.contentView.addSubview(self.line)

        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.5)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(0)
            
        }
         
         self.contentView.addGestureRecognizer(tap)
     }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Content102{
            let m = aModel as! Content102
           

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Content102:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 110
    }
}

