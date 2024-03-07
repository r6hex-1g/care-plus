import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack {
            Image(systemName: "list.bullet.indent")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("소식 창구 예정")
        }
    }
}
