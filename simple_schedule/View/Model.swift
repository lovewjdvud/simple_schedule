//
//  Model.swift
//  simple_schedule
//
//  Created by Songjeongpyeong on 2022/03/14.
//

import Foundation

struct NoteItem : Any {
    var Content : String?
    var Id: Int?
    var Date: String?
    var Color: String?
    
    
    init(Content:String, Id:Int,Date:String,Color:String) {

        self.Content = Content
        self.Id = Id
        self.Date = Date
        self.Color = Color

        
        
    }
    
}

extension NoteItem {
    static let EMPTY = NoteItem(Content: "", Id: 0,  Date: "", Color: "0")
    
    static  func fromMenuItemsss(id: Int, item: NoteItem) -> NoteItem {
        return NoteItem(Content: item.Content!, Id: item.Id!, Date: item.Date!, Color: item.Color!)    }
}
