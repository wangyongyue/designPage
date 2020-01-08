//
//  PageDetails.swift
//  Demo
//
//  Created by apple on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class PageDetails:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()
    var r = Record()
    let bar = SelectionBar()

    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
        dealStatus()
        dealNav()
        dealContent()
      
        r.array = self.arrayContent
    }
    private func dealStatus(){
        
        self.v_if(vId: STATUSID) { () -> Bool? in
            
            return false
        }
        
    }
    private func dealNav(){
        
        let m = NavBackCellModel()
        m.name = r.title
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
           
            
        }
        
    }
    private func dealContent(){
        if let array = self.r.array{
            for value in array{
                self.arrayContent.append(value)
            }
        }
      
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
          
       }
        
         
        
    }
  
   
   
    
}
