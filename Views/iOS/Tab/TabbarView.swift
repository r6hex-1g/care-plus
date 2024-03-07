import SwiftUI

struct TabbarView: View {
    @State private var activeTab: Tab = .news
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    @State private var bounceDown: Bool = false
    
    var body: some View {
    #if os(iOS)
//        if UIDevice.current.userInterfaceIdiom == .phone {
            VStack(spacing: 0) {
                TabView(selection: $activeTab) {
                    //MARK: - News Views
                    NavigationStack {
                        NewsView()
                    }
                    .setUpTab(.news)
                    
                    //MARK: - Chat Views
                    NavigationStack {
                        ChatView()
                    }
                    .setUpTab(.chat)
                    
                    //MARK: - News Views
                    NavigationStack {
                        NotificationView()
                    }
                    .setUpTab(.notification)
                    
                    //MARK: - News Views
                    NavigationStack {
                        MeView()
                    }
                    .setUpTab(.me)
                }
                CustomTabbar()
//            }
        } #endif // else if UIDevice.current.userInterfaceIdiom == .pad {
//            NavigationView {
//                List {
//                    NavigationLink(destination: NewsView()) {
//                        HStack {
//                            Image(systemName: "newspaper.fill")
//                            Text("소식")
//                        }
//                    }
//                    .setUpTab(.news)
//                    
//                    NavigationLink(destination: ChatView()) {
//                        //
//                    }
//                    .setUpTab(.chat)
//                    
//                    NavigationLink(destination: NotificationView()) {
//                        //
//                    }
//                    .setUpTab(.notification)
//                    
//                    NavigationLink(destination: MeView()) {
//                        //
//                    }
//                    .setUpTab(.me)
//                }
//                .frame(maxWidth: 80, maxHeight: 320)
//            }
//            .navigationTitle("케어")
//            .navigationBarTitleDisplayMode(.automatic)
//            .listStyle(SidebarListStyle())
//        }
//    #else
//        EmptyView()
//    #endif
    }
    
    //MARK: - Custom Tab Bar
    func CustomTabbar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.up.byLayer, value: animatedTab.isAnimateing)
                    
                    Text(tab.title)
                        .font(.caption2)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .foregroundColor(activeTab == tab ? Color.accentColor : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                
                //MARK: - Use Button
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimateing = true
                    }, completion: {
                        var transction = Transaction()
                        transction.disablesAnimations = true
                        withTransaction(transction) {
                            animatedTab.isAnimateing = nil
                        }
                    })
                }
            }
            .background(.bar)
        }
    }
}


extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
