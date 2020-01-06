//
//  ProjectCache.swift
//  Demo
//
//  Created by apple on 2019/12/26.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
class ProjectCache: NSObject {
    
    var name:String?
    static func cacheProject(_ p:ProjectCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in ProjectCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "项目名称相同，请修改")
                    return false
                }
                strings.append(a)
            }
            
        }
        if let a = p.name{
            
            strings.append(a)
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(ProjectCache.classForCoder()))
        return true
    }
    static func getCacheArray() -> [ProjectCache]{
        
        let userDefault = UserDefaults.standard
        var ps = [ProjectCache]()

        if let strings = userDefault.stringArray(forKey: NSStringFromClass(ProjectCache.classForCoder())){
            for value in strings{
                let m = ProjectCache()
                m.name = value
                ps.append(m)
            }
        }
        Debug.log(ps)
        return ps
    }
    
}
class PageCache: NSObject {
    
    var name:String?
    
    static func cacheProject(_ p:PageCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in PageCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "页面名称相同，请修改")
                    return false
                }
                strings.append(a)
            }
            
        }
        if let a = p.name{
            
            strings.append(a)
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(PageCache.classForCoder()))
        return true
    }
    static func getCacheArray() -> [PageCache]{
        
        let userDefault = UserDefaults.standard
        var ps = [PageCache]()

        if let strings = userDefault.stringArray(forKey: NSStringFromClass(PageCache.classForCoder())){
            for value in strings{
                let m = PageCache()
                m.name = value
                ps.append(m)
            }
        }
        Debug.log(ps)
        return ps
    }
}


class InterfaceCache: NSObject {
    
    var name:String?
    
    static func cacheProject(_ p:InterfaceCache) -> Bool{
        
        let userDefault = UserDefaults.standard
        var strings = [String]()
        for value in InterfaceCache.getCacheArray(){
            if let a = value.name,let b = p.name{
                if a == b{
                    Alert.show(str: "接口名称相同，请修改")
                    return false
                }
                strings.append(a)
            }
            
        }
        if let a = p.name{
            
            strings.append(a)
        }

        Debug.log(strings)
        userDefault.set(strings, forKey: NSStringFromClass(InterfaceCache.classForCoder()))
        return true
    }
    static func getCacheArray() -> [InterfaceCache]{
        
        let userDefault = UserDefaults.standard
        var ps = [InterfaceCache]()

        if let strings = userDefault.stringArray(forKey: NSStringFromClass(InterfaceCache.classForCoder())){
            for value in strings{
                let m = InterfaceCache()
                m.name = value
                ps.append(m)
            }
        }
        Debug.log(ps)
        return ps
    }
    
}
