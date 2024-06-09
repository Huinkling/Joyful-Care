//
//  ContentView.swift
//  L3 Demo
//
//  Created by INKLING on 6/9/24.
//
import SwiftUI



@main
struct ElderlyCareAppApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
        }
    }
}

struct LaunchScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // 设置背景颜色为白色，覆盖整个屏幕
            Image("pic0") // 显示图片
                .resizable()
                .aspectRatio(contentMode: .fit) // 保持图片的宽高比
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 图片最大化到屏幕的尺寸

            if isActive {
                ContentView() // 这是你的主视图
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 延迟2秒后切换到主视图
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}



struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}



struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }
            
            CommunityView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("社区")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("我的")
                }
        }
    }
}

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var navigateToSearch: Bool = false
    var body: some View {
        NavigationView {ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Top section: City, Search bar, Profile
                HStack {
                    Text("郑州")
                                                .font(.title2)
                                                .bold()
                                            Spacer()
                                            HStack {
                                                TextField("搜索你想知道的内容", text: $searchText)
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                Button(action: {
                                                    if !searchText.isEmpty {
                                                        navigateToSearch = true
                                                    }
                                                }) {
                                                    Image(systemName: "magnifyingglass")
                                                }
                                            }
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(30)
                                        Spacer()
                                        VStack {
                                            Image("pic8")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())

                                            Text("笑笑")
                                                .font(.caption)
                                        }
                                    }
                                    
                                    // Rectangle image with navigation
                                    NavigationLink(destination: AdDetailView()) {
                                        Image("pic3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity)
                                            .cornerRadius(10)
                                    }
                                    
                                    // Notification banner
                                    Text("通知：软件更新1.0.1，支持全局语音或面部操控 ")
                                        .font(.subheadline)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                    
                                    // Date and weather section
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("2024.06.09")
                                                .font(.title)
                                            Text("星期日")
                                                .font(.headline)
                                            Text("农历 五月初四")
                                                .font(.subheadline)
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            Text("多云")
                                                .font(.title)
                                            Text("34°")
                                                .font(.headline)
                                            Text("20°/36° 轻度污染")
                                                .font(.subheadline)
                                        }
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    // 黄历信息
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack {
                                            Text("宜")
                                                .foregroundColor(Color(.systemYellow))
                                                .bold()
                                            Text("订婚 装修 乔迁拆迁 办满月酒 出差        ")
                                        }
                                        HStack {
                                            Text("忌")
                                                .foregroundColor(Color(.systemGray))
                                                .bold()
                                            Text("结婚 开业开张 入土 嫁娶               ")
                                        }
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    
                                    // Latest news section
                                    VStack(alignment: .leading) {
                                        Text("最新资讯")
                                            .font(.title2)
                                            .bold()
                                        
                                        // First news item
                                        NavigationLink(destination: NewsDetailView(title: "如何预防老年痴呆")) {
                                            HStack(spacing: 16) {
                                                Image("pic4")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("如何预防老年痴呆")
                                                        .font(.headline)
                                                    Text("2024-05-26")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                }
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                            .padding(.vertical, 8)
                                        }
                                        Divider()
                                        
                                        // Second news item
                                        NavigationLink(destination: NewsDetailView(title: "老年人日常健康小贴士")) {
                                            HStack(spacing: 16) {
                                                Image("pic5")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("老年人日常健康小贴士")
                                                        .font(.headline)
                                                    Text("2024-05-25")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                }
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                            .padding(.vertical, 8)
                                        }
                                        Divider()
                                        
                                        // Third news item
                                        NavigationLink(destination: NewsDetailView(title: "夏季如何保持健康")) {
                                            HStack(spacing: 16) {
                                                Image("pic6")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("夏季如何保持健康")
                                                        .font(.headline)
                                                    Text("2024-05-24")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                }
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                            .padding(.vertical, 8)
                                        }
                                        Divider()
                                        
                                        // Fourth news item
                                        NavigationLink(destination: NewsDetailView(title: "老年人心理健康指南")) {
                                            HStack(spacing: 16) {
                                                Image("pic7")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("老年人心理健康指南")
                                                        .font(.headline)
                                                    Text("2024-05-24")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                }
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                            .padding(.vertical, 8)
                                        }
                                    }
                                }
                                .padding()
                            }
                  
                        }
                    }
                }

                // Placeholder Views for Navigation
                struct SearchResultView: View {
                    var searchText: String
                    
                    var body: some View {
                        Text("搜索结果：\(searchText)")
                    }
                }

                struct AdDetailView: View {
                    var body: some View {
                        Text("广告商品详情页")
                    }
                }

                struct NewsDetailView: View {
                    var title: String
                    
                    var body: some View {
                        Text("\(title) 详情页")
                            .background(Color.gray.opacity(0.1))
                    }
                }
  


struct CommunityView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Top image section
                    Image("pic1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                    
                    // 老友交流区
                    VStack(alignment: .leading, spacing: 8) {
                        Text("老友交流区")
                            .font(.title2)
                            .bold()
                        
                        // Items in 老友交流区
                        VStack(alignment: .leading, spacing: 8) {
                            NavigationLink(destination: MoodStationView()) {
                                Text("心情驿站")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                            NavigationLink(destination: ShoppingExperienceView()) {
                                Text("购物心得")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                            NavigationLink(destination: FriendMeetingView()) {
                                Text("聚会交友")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                            NavigationLink(destination: WishWallView()) {
                                Text("心愿墙")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    // Bottom image section
                    Image("pic2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                    
                    // 老友生活区
                    VStack(alignment: .leading, spacing: 8) {
                        Text("老友生活区")
                            .font(.title2)
                            .bold()
                        
                        // Items in 老友生活区
                        VStack(alignment: .leading, spacing: 8) {
                            NavigationLink(destination: ShoppingView()) {
                                Text("购物")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                            NavigationLink(destination: LifeTalkView()) {
                                Text("生活杂谈")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                            NavigationLink(destination: HealthTipsView()) {
                                Text("健康小贴士")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Divider()
                            NavigationLink(destination: TravelExperienceView()) {
                                Text("旅游心得")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                .padding()
            }
        }
    }
}

// Placeholder Views for Navigation
struct MoodStationView: View {
    var body: some View {
        Text("心情驿站")
    }
}

struct ShoppingExperienceView: View {
    var body: some View {
        Text("购物心得")
    }
}

struct FriendMeetingView: View {
    var body: some View {
        Text("聚会交友")
    }
}

struct WishWallView: View {
    var body: some View {
        Text("心愿墙")
    }
}

struct ShoppingView: View {
    var body: some View {
        Text("购物")
    }
}

struct LifeTalkView: View {
    var body: some View {
        Text("生活杂谈")
    }
}

struct HealthTipsView: View {
    var body: some View {
        Text("健康小贴士")
    }
}

struct TravelExperienceView: View {
    var body: some View {
        Text("旅游心得")
            .background(Color.gray.opacity(0.1))
    }
}



struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Profile section
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                // Switch mode action
                            }) {
                                Text("🔁 切换模式")
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            Button(action: {
                                // Contact customer service action
                            }) {
                                Text("联系客服 💁")
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        HStack {
                            Image("pic8") // Replace with your actual profile image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("pic")
                                    Text("笑笑")
                                        .font(.title)
                                        .bold()
                                }
                                Text("+86 182 6378 2778")
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading)
                        }
                        Button(action: {
                            // Change profile photo action
                        }) {
                            Text("         完善信息")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Order section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("我的订单")
                            .font(.headline)
                            .padding(.leading)
                        
                        HStack(spacing: 16) {
                            NavigationLink(destination: PendingPaymentView()) {
                                OrderStatusView(icon: "creditcard.fill", label: "待付款")
                            }
                            NavigationLink(destination: PendingReceiptView()) {
                                OrderStatusView(icon: "shippingbox.fill", label: "待收货")
                            }
                            NavigationLink(destination: PendingReviewView()) {
                                OrderStatusView(icon: "pencil.and.ellipsis.rectangle", label: "待评价")
                            }
                            NavigationLink(destination: AfterSalesServiceView()) {
                                OrderStatusView(icon: "arrow.triangle.2.circlepath.circle.fill", label: "退换/售后")
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Points section
                    VStack(spacing: 16) {
                        HStack {
                            Spacer()
                            Image(systemName: "star.fill")
                                .font(.title2)
                                .foregroundColor(.yellow)
                                .frame(width: 30, height: 30)
                                .background(Color.white)
                                .cornerRadius(5)
                            Text("我的积分：93")
                            Spacer()
                            Spacer()
                            
                                .font(.headline)
                                .foregroundColor(.primary)
                            Button(action: {
                                // Switch mode action
                            }) {
                                Text("点我获得更多")
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Options section
                    VStack(spacing: 16) {
                        NavigationLink(destination: MyProfileView()) {
                            OptionRow(icon: "person.fill", label: "我的服务", iconColor: .orange)
                        }
                        NavigationLink(destination: SavedMessagesView()) {
                            OptionRow(icon: "bookmark.fill", label: "我的运动", iconColor: .green)
                        }
                        NavigationLink(destination: RecentCallsView()) {
                            OptionRow(icon: "phone.fill", label: "我的家庭", iconColor: .purple, subIcon: "pic9")
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // About section
                    VStack(spacing: 16) {
                        NavigationLink(destination: AboutUsView()) {
                            Text("    关于我们")
                                .foregroundColor(.gray)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Divider()
                        NavigationLink(destination: FeedbackView()) {
                            Text("    意见反馈")
                                .foregroundColor(.gray)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding()
            }
            .background(Color(UIColor.systemGray6))
        }
    }
}

struct OrderStatusView: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(10)
            Text(label)
                .font(.body)
                .foregroundColor(.primary)
        }
        .frame(width: 80, height: 80)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct OptionRow: View {
    let icon: String
    let label: String
    let iconColor: Color
    var subIcon: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(iconColor)
                    .frame(width: 30, height: 30)
                    .background(Color.white)
                    .cornerRadius(5)
                Text(label)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            if let subIcon = subIcon {
                HStack {
                    Image(subIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("小莹（女儿）")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 10)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// Placeholder Views for Navigation
struct PendingPaymentView: View {
    var body: some View {
        Text("待付款")
    }
}

struct PendingReceiptView: View {
    var body: some View {
        Text("待收货")
    }
}

struct PendingReviewView: View {
    var body: some View {
        Text("待评价")
    }
}

struct AfterSalesServiceView: View {
    var body: some View {
        Text("退换/售后")
    }
}

struct MyProfileView: View {
    var body: some View {
        Text("我的服务")
    }
}

struct SavedMessagesView: View {
    var body: some View {
        Text("我的运动")
    }
}

struct RecentCallsView: View {
    var body: some View {
        Text("我的家庭")
    }
}

struct AboutUsView: View {
    var body: some View {
        Text("关于我们")
    }
}

struct FeedbackView: View {
    var body: some View {
        Text("意见反馈")
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
