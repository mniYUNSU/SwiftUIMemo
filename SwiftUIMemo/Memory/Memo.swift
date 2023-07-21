//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by Comcom on 2023/07/21.
//

import Foundation
import SwiftUI

// Identifiable : data를 리스트에 쉽게 binding 위함
// observable object : memo 를 편집할 때 뷰를 자동으로 업데이트하기 위함
class Memo: Identifiable, ObservableObject {
    let id: UUID
    // published : 새 값을 저장할 때마다 바인딩 된 ui 가 업데이트 됨
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
