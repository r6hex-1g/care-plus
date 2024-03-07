import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            Image(systemName: "bell.badge.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("알림 섹션 예정")
        }
    }
}
