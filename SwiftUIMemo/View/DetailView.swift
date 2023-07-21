//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by Comcom on 2023/07/21.
//

import SwiftUI

struct DetailView: View {
    // 메모의 내용이 바뀌면 보기 화면도 바뀐다. published 라서
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    @State private var showDeleteAlert: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content).padding()
                        
                        Spacer(minLength: 0)
                    }
                    // swift ui 는 기본적으로 가운데정렬이다. 너비를 100프로 채운게 아니라 컴포넌트만 가운데정렬임.
                    Text(memo.insertDate, style: .date)
                        .padding().font(.footnote).foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                } message: {
                    Text("메모를 삭제할까요?")
                }
                
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "Dummy")).environmentObject(MemoStore())
        }
    }
}
