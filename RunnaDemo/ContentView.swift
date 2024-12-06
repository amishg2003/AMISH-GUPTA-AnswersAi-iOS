import SwiftUI

struct ContentView: View {
    
    //NOTE: Coded to match runna, but can change based on app used, title, description etc. I manually created the "intro" for the descriptions as that can vary from app to app. If the first three words of each description were always bolded, I would change this and handle bolding in the cardView.
    
    let appCards = [
        AppCard(
            coverImage: "RunnerBlurred",
            appLogo: "RunnaLogo",
            title: "Running With Runna",
            description: "Training plans for your next marathon or run around the park.",
            bottomText: "Runna: Running Training Plans",
            buttonText: "Get",
            headerStaticText: "APPS WE LOVE",
            runDistanceText: "5k, 10k, Half, Marathon, Ultra",
            aboutTitle: "About the App",
            aboutTextIntroPart: "Whether you’re an ",
            aboutTextIntroHighlight: "ultramarathoner, a triathlete, or a total beginner, ",
            aboutTextIntroRest: "this virtual running coach can help you find your stride—and a supportive community.",
            whatWeLoveTitle: "What we love: ",
            whatWeLoveDescription: "The holistic approach of Runna’s personalized fitness plans. Get real-time audio tips on pace and gait as you run as well as reminders to rest. When you’re not on the move, the app may offer nutrition guidance or suggest cross-training workouts, like strength-building or Pilates."
        ),
        AppCard(
            coverImage: "RunnerBlurred",
            appLogo: "RunnaLogo",
            title: "Running With Runna",
            description: "Training plans for your next marathon or run around the park.",
            bottomText: "Runna: Running Training Plans",
            buttonText: "Get",
            headerStaticText: "APPS WE LOVE",
            runDistanceText: "5k, 10k, Half, Marathon, Ultra",
            aboutTitle: "About the App",
            aboutTextIntroPart: "Whether you’re an ",
            aboutTextIntroHighlight: "ultramarathoner, a triathlete, or a total beginner, ",
            aboutTextIntroRest: "this virtual running coach can help you find your stride—and a supportive community.",
            whatWeLoveTitle: "What we love: ",
            whatWeLoveDescription: "The holistic approach of Runna’s personalized fitness plans. Get real-time audio tips on pace and gait as you run as well as reminders to rest. When you’re not on the move, the app may offer nutrition guidance or suggest cross-training workouts, like strength-building or Pilates."
        ),
        AppCard(
            coverImage: "RunnerBlurred",
            appLogo: "RunnaLogo",
            title: "Running With Runna",
            description: "Training plans for your next marathon or run around the park.",
            bottomText: "Runna: Running Training Plans",
            buttonText: "Get",
            headerStaticText: "APPS WE LOVE",
            runDistanceText: "5k, 10k, Half, Marathon, Ultra",
            aboutTitle: "About the App",
            aboutTextIntroPart: "Whether you’re an ",
            aboutTextIntroHighlight: "ultramarathoner, a triathlete, or a total beginner, ",
            aboutTextIntroRest: "this virtual running coach can help you find your stride—and a supportive community.",
            whatWeLoveTitle: "What we love: ",
            whatWeLoveDescription: "The holistic approach of Runna’s personalized fitness plans. Get real-time audio tips on pace and gait as you run as well as reminders to rest. When you’re not on the move, the app may offer nutrition guidance or suggest cross-training workouts, like strength-building or Pilates."
        )
    ]

    @State private var selectedCard: AppCard? = nil
    @State private var isExpanded = false

    @Namespace private var namespace

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    CardView(appCard: appCards[0],
                             selectedCard: $selectedCard,
                             isExpanded: $isExpanded,
                             namespace: namespace)
                        .frame(height: 450)

                    CardView(appCard: appCards[1],
                             selectedCard: $selectedCard,
                             isExpanded: $isExpanded,
                             namespace: namespace)
                        .frame(height: 450)
                }
                .padding(.vertical)
                .padding(.horizontal)
            }
            .background(Color(.systemGroupedBackground))

            if let selectedCard = selectedCard, isExpanded {
                FullScreenView(appCard: selectedCard,
                               selectedCard: $selectedCard,
                               isExpanded: $isExpanded,
                               namespace: namespace)
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
