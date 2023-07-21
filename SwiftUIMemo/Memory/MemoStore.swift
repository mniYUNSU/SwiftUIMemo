//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by Comcom on 2023/07/21.
//

import Foundation

// 메모 목록 저장 클래스
class MemoStore: ObservableObject {
    // 배열 업데이트마다 바인딩 된 뷰도 업데이트 됨
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello!", insertDate: Date.now),
            Memo(content: "MEMO!", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SIUUUU!", insertDate: Date.now.addingTimeInterval(3600 * -48)),
            Memo(content: "SWIFTUI!", insertDate: Date.now.addingTimeInterval(3600 * -72)),
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
