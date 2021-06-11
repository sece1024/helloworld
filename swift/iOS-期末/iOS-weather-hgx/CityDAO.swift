//
//  CityDAO.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/10.
//  Copyright © 2021年 HGX. All rights reserved.
//

import Foundation
// 当前关注城市
class CityDAO{
    private var DBCITY_FOCUS = "cityFocus.sqlite3"
    private var db: OpaquePointer? = nil
    
    // Sigleton Pattern
    static let sharedInstance: CityDAO = {
        let instance = CityDAO()
        //初始化属性列表文件
        instance.createEditableCopyOfDatabaseIfNeeded()
        return instance
    }()
    
    // add
    func add(_ cityName: String){
        print("添加城市: \(cityName)")
        let path = self.applicationDocumentsDirectoryFile()
        let cPath = path.cString(using: String.Encoding.utf8)
        
        if sqlite3_open(cPath, &db) != SQLITE_OK{
            sqlite3_close(db)
            assert(false, "数据库打开失败")
        }else{
            let sql = "INSERT OR REPLACE INTO CityFocus(cityName) VALUES(?)"
            let cSql = sql.cString(using: String.Encoding.utf8)
            
            var statement: OpaquePointer? = nil
            // 预处理
            if sqlite3_prepare_v2(db, cSql, -1, &statement, nil) == SQLITE_OK{
                let cCityName = cityName.cString(using: String.Encoding.utf8)
               
                
                // 绑定参数
                sqlite3_bind_text(statement, 1, cCityName, -1, nil)
                
                // 执行插入
                if sqlite3_step(statement) != SQLITE_DONE{
                    assert(false, "插入数据失败")
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
        }
    }
    
    // get all data
    func findAll() -> [String]{
        let path = self.applicationDocumentsDirectoryFile()
        let cPath = path.cString(using: String.Encoding.utf8)
        
        var cityList = [String]()
        
        if sqlite3_open(cPath, &db) != SQLITE_OK{
            assert(false, "findAll(): 数据库打开失败")
        }else{
            let sql = "SELECT CityName FROM CityFocus"
            let csql = sql.cString(using: String.Encoding.utf8)
            
            // 语句对象
            var statement: OpaquePointer? = nil
            // 预处理过程
            if sqlite3_prepare_v2(db, csql, -1, &statement, nil) == SQLITE_OK{
                // 执行查询
                while sqlite3_step(statement) == SQLITE_ROW{
                    if let cityName = getColumnValue(index: 0, stmt: statement!){
                        cityList.append(cityName)
                    }
                    
                }
                
                sqlite3_finalize(statement)
            }else{
                print("In CityDAO findAll(): 预处理失败")
            }
            sqlite3_close(db)
            return cityList
        }
    }
    // 获得字段数据
    private func getColumnValue(index: CInt, stmt: OpaquePointer)->String?{
        if let ptr = UnsafeRawPointer.init(sqlite3_column_text(stmt, index)){
            let uptr = ptr.bindMemory(to: CChar.self, capacity: 0)
            let txt = String(validatingUTF8: uptr)
            return txt
        }
        return nil
    }
    
    // delete all
    func deleteAll(){
        let path = self.applicationDocumentsDirectoryFile()
        let cpath = path.cString(using: String.Encoding.utf8)
        
        if sqlite3_open(cpath!, &db) != SQLITE_OK {
            sqlite3_close(db)
            assert(false, "数据库打开失败。")
        } else {
            let sql = "DELETE from CityFocus"
            let cSql = sql.cString(using: String.Encoding.utf8)
            
            var statement:OpaquePointer? = nil
            //预处理过程
            if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK {
                //执行
                if sqlite3_step(statement) != SQLITE_DONE {
                    assert(false, "删除数据失败。")
                }
                else{
                    print("已删除所有数据")
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
        }
        
    }
    
    
    private func applicationDocumentsDirectoryFile() -> String{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = (documentDirectory[0] as NSString).appendingPathComponent(self.DBCITY_FOCUS)
        return path
    }
    // 判断沙箱目录组是否存在cityDataList文件
    private func createEditableCopyOfDatabaseIfNeeded(){
        let writableDBPath = self.applicationDocumentsDirectoryFile()
        let cpath = writableDBPath.cString(using: String.Encoding.utf8)
        
        if sqlite3_open(cpath, &db) != SQLITE_OK{
            sqlite3_close(db)
            assert(false, "数据库打开失败")
        }else{
            let sql = "CREATE TABLE IF NOT EXISTS CityFocus(cityName TEXT PRIMARY KEY)"
            let cSql = sql.cString(using: String.Encoding.utf8)
            
            if sqlite3_exec(db, cSql, nil, nil, nil) != SQLITE_OK{
                sqlite3_close(db)
                assert(false, "建表失败")
            }
            sqlite3_close(db)
        }
    }
}
