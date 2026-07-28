//
//  home_screenApp.swift
//  home screen
//
//  Created by DPI Student 015 on 7/18/26.
//

import SwiftUI

//Main Tab Bar

struct MainTabView: View {
    @State var goToDiscover = false
    @State var goToPost = false
    @State var goToInbox = false
    @State var goToProfile = false

    var body: some View {
        ZStack(alignment: .bottom) {

            HomeFeedView()

            VStack {
                Spacer()
                HStack {
                    NavigationLink(destination: HomeFeedView()) {
                        Image(systemName: "house.fill")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: { goToDiscover = true }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: { goToPost = true }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: { goToInbox = true }) {
                        Image(systemName: "message.fill")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: { goToProfile = true }) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.black.opacity(0.4))
            }
        }
        .navigationDestination(isPresented: $goToDiscover) { DiscoverView() }
        .navigationDestination(isPresented: $goToPost) { NewPostView() }
        .navigationDestination(isPresented: $goToInbox) { InboxView() }
        .navigationDestination(isPresented: $goToProfile) { ProfileView() }
    }
}

//Shared background

struct AppBackground: View {
    var body: some View {
        LinearGradient(colors: [Color.red, Color.black], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

//Home

struct HomeFeedView: View {
    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(spacing: 20) {

                    VStack(spacing: 8) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                        Text("Welcome to the main center!!")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("Explore the home screen of the app")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding(.top, 40)

                    NavigationLink(destination: SettingsView()) {
                        MenuButtonLabel(icon: "gearshape.fill", label: "Settings", colors: [Color.purple, Color.blue])
                    }

                    NavigationLink(destination: FavoritesView()) {
                        MenuButtonLabel(icon: "gift.fill", label: "Favorite console modifying videos", colors: [Color.orange, Color.red])
                    }

                    NavigationLink(destination: AboutView()) {
                        MenuButtonLabel(icon: "info.circle.fill", label: "About this app", colors: [Color.green, Color.teal])
                    }

                    Spacer().frame(height: 80)
                }
                .padding()
            }
        }
    }
}

struct MenuButtonLabel: View {
    var icon: String
    var label: String
    var colors: [Color]

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(16)
    }
}

//Settings

struct SettingsToggleRow: View {
    var icon: String
    var label: String
    @Binding var isOn: Bool

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 26)
            Text(label)
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(.red)
        }
        .padding(.vertical, 10)
    }
}

struct SettingsView: View {
    @State var pushNotifications = true
    @State var darkMode = true
    @State var autoplayVideos = false
    @State var cameraAccess = true
    @State var microphoneAccess = false
    @State var locationServices = false

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    VStack(alignment: .leading, spacing: 4) {
                        Text("PREFERENCES")
                            .font(.caption)
                            .foregroundColor(.gray)

                        VStack(spacing: 0) {
                            SettingsToggleRow(icon: "bell.fill", label: "Push Notifications", isOn: $pushNotifications)
                            Divider().background(Color.white.opacity(0.2))
                            SettingsToggleRow(icon: "moon.fill", label: "Dark Mode", isOn: $darkMode)
                            Divider().background(Color.white.opacity(0.2))
                            SettingsToggleRow(icon: "play.circle.fill", label: "Autoplay Videos", isOn: $autoplayVideos)
                        }
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(14)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("PRIVACY")
                            .font(.caption)
                            .foregroundColor(.gray)

                        VStack(spacing: 0) {
                            SettingsToggleRow(icon: "camera.fill", label: "Allow Camera Access", isOn: $cameraAccess)
                            Divider().background(Color.white.opacity(0.2))
                            SettingsToggleRow(icon: "mic.fill", label: "Allow Microphone Access", isOn: $microphoneAccess)
                            Divider().background(Color.white.opacity(0.2))
                            SettingsToggleRow(icon: "location.fill", label: "Location Services", isOn: $locationServices)
                        }
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(14)
                    }

                    Spacer().frame(height: 40)
                }
                .padding()
            }
        }
        .navigationTitle("Settings")
    }
}


//Favorite

struct ResourceLink: Identifiable {
    let id = UUID()
    var title: String
    var urlString: String
}

struct ResourceSection: Identifiable {
    let id = UUID()
    var heading: String
    var links: [ResourceLink]
}

struct ResourceRow: View {
    var icon: String
    var title: String
    var urlString: String

    var body: some View {
        if let url = URL(string: urlString) {
            Link(destination: url) {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(.white)
                        .frame(width: 24)
                    Text(title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(12)
            }
        }
    }
}

struct FavoritesView: View {
    let videoLinks: [ResourceLink] = [
        ResourceLink(title: "Dreamcast modding video", urlString: "https://www.youtube.com/watch?v=Gsl7rOAUM3Q"),
        ResourceLink(title: "Modding Xbox 360 (Part 1)", urlString: "https://www.youtube.com/watch?v=z7Fbi8zN8tw"),
        ResourceLink(title: "Modding Xbox 360 (Part 2)", urlString: "https://www.youtube.com/watch?v=aZpCGGop55M"),
        ResourceLink(title: "Modding original Xbox", urlString: "https://www.youtube.com/watch?v=NchZ-mHqTb0"),
        ResourceLink(title: "Modding Xbox One", urlString: "https://www.youtube.com/watch?v=i45-gvbdgCU"),
        ResourceLink(title: "Modding Meta Quest 3 to play GTA V", urlString: "https://www.youtube.com/watch?v=BQeBtiDvylY"),
        ResourceLink(title: "Creating the profile page", urlString: "https://www.youtube.com/watch?v=MDs8DibSlgg")
    ]

    let platformSections: [ResourceSection] = [
        ResourceSection(heading: "Xbox", links: [
            ResourceLink(title: "Aurora for Xbox 360", urlString: "https://phoenix.xboxunity.net/#/news"),
            ResourceLink(title: "Xbox 360 Neighborhood", urlString: "https://consolemods.org/wiki/Xbox_360:Xbox_360_Neighborhood")
        ]),
        ResourceSection(heading: "Sony", links: [
            ResourceLink(title: "PS1 Mods Wiki", urlString: "https://consolemods.org/wiki/PS1:PS1_Mods_Wiki")
        ]),
        ResourceSection(heading: "Nintendo", links: [
            ResourceLink(title: "Homebrew for DS, Wii, Game Boy, etc.", urlString: "https://brew.sh/")
        ]),
        ResourceSection(heading: "Other Companies", links: [
            ResourceLink(title: "Meta Quest modding wiki", urlString: "https://bsmg.wiki/quest-modding.html"),
            ResourceLink(title: "SideQuest setup guide", urlString: "https://sidequestvr.com/setup-howto")
        ]),
        ResourceSection(heading: "General Resources", links: [
            ResourceLink(title: "iFixit tech tutorials", urlString: "https://www.ifixit.com"),
            ResourceLink(title: "Tinker-MOD (old consoles)", urlString: "https://www.Tinker-MOD.com"),
            ResourceLink(title: "ConsoleMods.org (software)", urlString: "https://consolemods.org"),
            ResourceLink(title: "GDMENUCardManager (GitHub)", urlString: "https://github.com/sonik-br/GDMENUCardManager/releases"),
            ResourceLink(title: "GDEMU details", urlString: "https://gdemu.wordpress.com/details/gdemu-details/")
        ])
    ]

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    Text("Favorites")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("VIDEOS")
                            .font(.caption)
                            .foregroundColor(.gray)
                        ForEach(videoLinks) { video in
                            ResourceRow(icon: "play.circle.fill", title: video.title, urlString: video.urlString)
                        }
                    }

                    ForEach(platformSections) { section in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(section.heading.uppercased())
                                .font(.caption)
                                .foregroundColor(.gray)
                            ForEach(section.links) { link in
                                ResourceRow(icon: "link", title: link.title, urlString: link.urlString)
                            }
                        }
                    }

                    Spacer().frame(height: 40)
                }
                .padding()
            }
        }
        .navigationTitle("Favorites")
    }
}// About this app

struct AboutView: View {
    var body: some View {
        ZStack {
            AppBackground()
            VStack(spacing: 16) {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("About")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("A community for console modding enthusiasts to share tips and discoveries.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
            }
        }
        .navigationTitle("About")
    }
}

// MARK: - Discover (FYP-style feed with search)

struct DiscoverPost: Identifiable {
    let id = UUID()
    var username: String
    var text: String
    var linkURL: String? = nil
}

struct DiscoverView: View {
    @State var searchText = ""

    let allPosts: [DiscoverPost] = [
        DiscoverPost(username: "modqueen_ash", text: "Finally got my shell swap looking clean, took way longer than expected lol"),
        DiscoverPost(username: "retrofix_dave", text: "PSA: double check your screws before reassembly, learned that the hard way"),
        DiscoverPost(username: "macho_nacho_fan", text: "This tools breakdown is the best one I've seen for modding retro consoles, watch this", linkURL: "https://youtu.be/i4PfUoxWaZA"),
        DiscoverPost(username: "console_lover22", text: "Found this video, thought it was worth sharing here", linkURL: "https://youtu.be/Np52UQzwyOQ")
    ]

    var filteredPosts: [DiscoverPost] {
        if searchText.isEmpty {
            return allPosts
        } else {
            return allPosts.filter { post in
                post.username.lowercased().contains(searchText.lowercased()) ||
                post.text.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Discover")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search users or posts", text: $searchText)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)

                    ForEach(filteredPosts) { post in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .top, spacing: 12) {
                                Circle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                    )

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(post.username)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.white.opacity(0.8))
                                    Text(post.text)
                                        .font(.body)
                                        .foregroundColor(.white)
                                }
                            }

                            if let linkString = post.linkURL, let url = URL(string: linkString) {
                                Link(destination: url) {
                                    HStack {
                                        Image(systemName: "play.circle.fill")
                                        Text("Watch video")
                                        Spacer()
                                        Image(systemName: "arrow.up.right.square")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.white.opacity(0.15))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                    }

                    if filteredPosts.isEmpty {
                        Text("No results found")
                            .foregroundColor(.gray)
                            .padding(.top, 20)
                    }
                }
                .padding()
                .padding(.bottom, 40)
            }
        }
        .navigationTitle("Discover")
    }
}
//New Post

struct NewPostView: View {
    @State var postText = ""

    var body: some View {
        ZStack {
            AppBackground()

            VStack(alignment: .leading, spacing: 16) {

                HStack {
                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 44, height: 44)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                        )
                    Text("username")
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                }

                ZStack(alignment: .topLeading) {
                    if postText.isEmpty {
                        Text("What did you modify today?")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.leading, 4)
                    }
                    TextEditor(text: $postText)
                        .scrollContentBackground(.hidden)
                        .foregroundColor(.white)
                        .frame(height: 150)
                }

                Divider().background(Color.white.opacity(0.2))

                HStack(spacing: 24) {
                    Image(systemName: "photo.on.rectangle")
                        .foregroundColor(.white.opacity(0.8))
                    Image(systemName: "video.fill")
                        .foregroundColor(.white.opacity(0.8))
                    Image(systemName: "chart.bar.fill")
                        .foregroundColor(.white.opacity(0.8))
                    Spacer()
                }

                Spacer()

                Button(action: {
                    // posting not functional yet
                }) {
                    Text("Post")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
        .navigationTitle("New Post")
    }
}

//Inbox

struct InboxMessage: Identifiable {
    let id = UUID()
    var username: String
    var preview: String
    var time: String
}

struct InboxView: View {
    let messages: [InboxMessage] = [
        InboxMessage(username: "modqueen_ash", preview: "hey does that fix work on the older model too?", time: "2h"),
        InboxMessage(username: "retrofix_dave", preview: "sent you the link, lmk if it helps", time: "1d"),
        InboxMessage(username: "sadgamer22", preview: "replied to your comment", time: "3d")
    ]

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(spacing: 0) {
                    ForEach(messages) { message in
                        HStack(spacing: 12) {
                            Circle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: 46, height: 46)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.white)
                                )

                            VStack(alignment: .leading, spacing: 2) {
                                Text(message.username)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(message.preview)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                    .lineLimit(1)
                            }

                            Spacer()

                            Text(message.time)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .padding()

                        Divider().background(Color.white.opacity(0.15))
                    }
                }
                .padding(.top, 8)
            }
        }
        .navigationTitle("Inbox")
    }
}

// Profile
struct ProfileView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    let photoNames = ["Image 1", "Image 2", "Image 3"]

    @State var showPhoto = false
    @State var selectedPhotoName = ""

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView {
                VStack(spacing: 16) {

                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 90, height: 90)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                        )
                        .padding(.top, 20)

                    Text("username")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Text("No bio yet")
                        .foregroundColor(.gray)

                    HStack(spacing: 40) {
                        VStack {
                            Text("\(photoNames.count)").bold().foregroundColor(.white)
                            Text("Posts").font(.caption).foregroundColor(.gray)
                        }
                        VStack {
                            Text("0").bold().foregroundColor(.white)
                            Text("Followers").font(.caption).foregroundColor(.gray)
                        }
                        VStack {
                            Text("0").bold().foregroundColor(.white)
                            Text("Following").font(.caption).foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 8)

                    Divider()
                        .background(Color.white.opacity(0.2))
                        .padding(.top, 12)

                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(photoNames, id: \.self) { name in
                            Image(name)
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .clipped()
                                .onTapGesture {
                                    selectedPhotoName = name
                                    showPhoto = true
                                }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $showPhoto) {
            PhotoDetailView(imageName: selectedPhotoName)
        }
    }
}

struct PhotoDetailView: View {
    var imageName: String

    @State var isLiked = false
    @State var likeCount = Int.random(in: 4...58)

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()

            Image(imageName)
                .resizable()
                .scaledToFit()

            HStack(spacing: 30) {
                Button(action: {
                    isLiked.toggle()
                    likeCount += isLiked ? 1 : -1
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 26))
                            .foregroundColor(isLiked ? .red : .white)
                        Text("\(likeCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }

                VStack(spacing: 4) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                    Text("Share")
                        .font(.caption)
                        .foregroundColor(.white)
                }

                Spacer()
            }
            .padding()
            .padding(.bottom, 30)
        }
    }
}
