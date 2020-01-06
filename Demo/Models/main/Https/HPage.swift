//
//  HPage.swift
//  Demo
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class HPage:Vue,V_ViewControllerProtocol{
    var arrayNav = [VueData]()
    var arrayContent = [VueData]()

    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
        dealStatus()
        dealNav()
        dealContent()
        
    }
    private func dealStatus(){
        
        self.v_if(vId: STATUSID) { () -> Bool? in
            
            return false
        }
        
    }
    private func dealNav(){
        
        let m = NavAddCellModel()
        m.name = "页面"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            if m.v_identifier == 1{
                           
                           
            }else if m.v_identifier == 2{
                           
                Alert.editorContent("请输入页面名称"){ (str) in
                    let p = PageCache()
                    p.name = str
                    if PageCache.cacheProject(p){
                        
                        self.dealContent()
                    }
                    
                }
                           
            }
        }
        
    }
    private func dealContent(){

       self.arrayContent.removeAll()
       for value in PageCache.getCacheArray(){
           
           self.arrayContent.append(TitleCellModel(value.name))
       }

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
        
        
        }
         
        
    }
    
   
   
    
}
