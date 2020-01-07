
//
//  Page.swift
//  Demo
//
//  Created by apple on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class Page:Vue,V_ViewControllerProtocol{
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
        
        let m = NavTitleCellModel()
        m.name = "VSK"
        self.arrayNav.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return self.arrayNav
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            let vc = CodeViewController()
            vc.backCodeBlock { (str) in
                
                self.addTitle(str)
            }
            Router.currentController().navigationController?.pushViewController(vc, animated: false)
        }
        
    }
    private func addTitle(_ codes:String){
        
        print(codes)
        Alert.editorContent("请输入标题"){ (str) in
            var arrayContent = App.instance.analysisAppTitles()
            for value in arrayContent{
                if value is BriefCellModel{
                    let m = value as! BriefCellModel
                    if let n = m.name{
                        if n == str{
                            return Alert.show(str: "标题名称不能相同")

                        }
                    }
                }
            }
            
            let a = BriefCellModel()
            a.name = str
            arrayContent.append(a)

            var titles = [String]()
            for value in arrayContent{
                if value is BriefCellModel{
                    let m = value as! BriefCellModel
                    if let n = m.name{
                        titles.append(n)
                    }
                }
            }
            App.instance.cacheAppTitles(titles)
            
            var types =  [VueData]()
            let array = codes.components(separatedBy: ",")
            for value in array{
                if let classType = NSClassFromString("VSK." + value) as? VueData.Type {
                types.append(classType.init())
                }
            }
            App.instance.name = str
            App.instance.components = types
            App.instance.cacheComponents()
            
            
            self.v_start()

        }
    }
    private func dealContent(){

        self.arrayContent.removeAll()
        self.arrayContent.append(HeadCellModel())
      
        self.arrayContent += App.instance.analysisAppTitles()
        
       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return self.arrayContent
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
        
           let data = self.arrayContent[index] as! VueData
           let number = data.v_identifier

          if data is BriefCellModel{
                 if number == 1{
                    self.arrayContent.remove(at: index)
                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.arrayContent
                    }
                    self.mainCacheAppTitles()

                 }else{
                    
                    let m = data as! BriefCellModel
                    App.instance.name = m.name
                    App.instance.analysisCacheComponents()
                    let r = Record()
                    r.title = m.name
                    r.array = App.instance.components
                    
                    let p = PageDetails()
                    p.r = r
                    Router.push(p, nil, nil)
                    
                 }
               
           }
          
       }
        
         
        
    }
    private func mainCacheAppTitles(){
        
        var titles = [String]()
        for value in self.arrayContent{
            if value is BriefCellModel{
                let m = value as! BriefCellModel
                if let n = m.name{
                    titles.append(n)
                }
            }
        }
        App.instance.cacheAppTitles(titles)

    }
  
    
   
   
    
}
