//
//  SelectionBar.swift
//  Demo
//
//  Created by apple on 2019/11/25.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class SelectionBar:Vue{
    
    private var block:VDataBlock?
    private var view:UIView?
    func show(_ ablock:@escaping VDataBlock){
        self.view = AlertTableView.init(self)
        self.block = ablock
    }
    
    override func v_start() {
                
        dealContent()
      
    }
   
    private func dealContent(){
        
       
       var array = [VueData]()
        
        
        array.append(BannerCellModel())
        
        array.append(Content201CellModel())
        array.append(Content202CellModel())
        array.append(Content105())

        array.append(Content203CellModel())
        array.append(Content204CellModel())
        array.append(Content205CellModel())
        
        
        array.append(Content106())
        array.append(Content101())
        array.append(Content102())
        array.append(Content104())

        
        
        array.append(Content301CellModel())
        array.append(Content302CellModel())
        array.append(Content303CellModel())
        

        array.append(Content206CellModel())
        array.append(Content103())

        
       

       self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
           return array
                  
       }
        
       self.v_index(vId: INDEXID) { (index) in
            
         let data = array[index] as! VueData
         self.block?(data)
        self.view?.removeFromSuperview()
        
       }
        
    }
    
    
    
}
