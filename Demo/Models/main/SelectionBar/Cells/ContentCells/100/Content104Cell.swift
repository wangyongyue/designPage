//
//  Content104Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content104Cell: UITableViewCell {
    
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
     lazy private var headerLabel3:UILabel = {
         let a = UILabel()
         a.textAlignment = .left
         a.text = "数据数据数据数据"
         a.numberOfLines = 0
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
         
         
         self.contentView.addSubview(self.headerLabel1)
         self.contentView.addSubview(self.headerLabel2)
        self.contentView.addSubview(self.headerLabel3)



         self.headerLabel1.snp.makeConstraints { (make) in
             
             make.top.equalTo(20)
             make.left.equalTo(12)
             
         }
        
         
         self.headerLabel2.snp.makeConstraints { (make) in
             
             make.left.equalTo(12)
             make.top.equalTo(self.headerLabel1.snp_bottomMargin).offset(20)

         }
        self.headerLabel3.snp.makeConstraints { (make) in
            
            make.left.equalTo(12)
            make.top.equalTo(self.headerLabel2.snp_bottomMargin).offset(20)

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
        if aModel is Content104{
            let m = aModel as! Content104
            

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Content104:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return  120
    }
}


