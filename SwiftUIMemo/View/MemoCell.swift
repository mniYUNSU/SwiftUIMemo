//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by Comcom on 2023/07/21.
//

import SwiftUI

struct MemoCell: View {
    // 메모 업데이트 시점마다 뷰 업데이트 됨
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content).font(.body).lineLimit(1)
            Text(memo.insertDate, style: .date).font(.caption).foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "DUMMY"))
    }
}
