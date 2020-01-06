//
//  Content106Cell.swift
//  Demo
//
//  Created by apple on 2019/11/26.
//  Copyright © 2019 test. All rights reserved.
//
import UIKit
import VueSwift
class Content106Cell: UITableViewCell {
    
   
    
   
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
    
    lazy private var bigImage1:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_11"))

        a.contentMode = .scaleAspectFill

        return a
    }()
    
    lazy private var bigImage2:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: Image.fillImage("feng_12"))

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
        self.contentView.addSubview(self.bigImage1)
        self.contentView.addSubview(self.bigImage2)

                
        self.contentView.addSubview(self.headerLabel1)
        self.contentView.addSubview(self.headerLabel2)


       
       
        let w = (Adapter.width() - 24 - 10)/3
        
        self.headerLabel1.snp.makeConstraints { (make) in
             
             make.top.equalTo(20)
             make.left.equalTo(12)
             
         }
         self.headerLabel2.snp.makeConstraints { (make) in
             
             make.top.equalTo(self.headerLabel1.snp_bottomMargin).offset(20)
             make.left.equalTo(12)

         }
        

        self.bigImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel2.snp_bottomMargin).offset(20)
            make.left.equalTo(12)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage1.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel2.snp_bottomMargin).offset(20)
            make.centerX.equalTo(self.contentView)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
        }
        self.bigImage2.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headerLabel2.snp_bottomMargin).offset(20)
            make.right.equalTo(-12)
            make.height.equalTo(w)
            make.width.equalTo(w)
            
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
        if aModel is Content106{
            
            let m = aModel as! Content106
            

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Content106:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return (Adapter.width() - 24 - 10)/3 + 110
    }
}
