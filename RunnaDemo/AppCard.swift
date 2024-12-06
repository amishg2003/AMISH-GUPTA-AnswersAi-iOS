import SwiftUI

//struct used for app card, would modify given criteria for different app cards 
struct AppCard: Identifiable {
    let id = UUID()
    let coverImage: String
    let appLogo: String
    let title: String
    let description: String
    let bottomText: String
    let buttonText: String

    let headerStaticText: String
    let runDistanceText: String
    let aboutTitle: String
    let aboutTextIntroPart: String
    let aboutTextIntroHighlight: String
    let aboutTextIntroRest: String
    let whatWeLoveTitle: String
    let whatWeLoveDescription: String
}
