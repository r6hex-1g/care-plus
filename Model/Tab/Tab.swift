import SwiftUI

//MARK: - Tab
enum Tab: String, CaseIterable {
    case news = "newspaper.fill"
    case chat = "bubble.left.and.bubble.right.fill"
    case notification = "bell.and.waves.left.and.right.fill"
    case me = "person.crop.circle"
    
    var title: String {
        switch self {
        case .news:
            return "소식"
        case .chat:
            return "메세지"
        case .notification:
            return "알림"
        case .me:
            return "나"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0 
    }
}

//MARK: - Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimateing: Bool?
}
