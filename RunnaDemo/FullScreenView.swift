import SwiftUI

//upon clicking on a card, this is a fullscreen view.
struct FullScreenView: View {
    let appCard: AppCard
    @Binding var selectedCard: AppCard?
    @Binding var isExpanded: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        Image(appCard.coverImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 450)
                            .clipped()
                        
                        VStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 8) {
                                Text(appCard.headerStaticText)
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text(appCard.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text(appCard.description)
                                    .font(.system(size: 11))
                                    .foregroundColor(.white.opacity(0.9))
                                    .lineLimit(2)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .frame(alignment: .leading)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                Image(appCard.appLogo)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text(appCard.bottomText)
                                        .font(.system(size: 13))
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(appCard.runDistanceText)
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                                        isExpanded = false
                                        selectedCard = nil
                                    }
                                }) {
                                    Text(appCard.buttonText)
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(Color.gray.opacity(0.6))
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                }
                            }
                            .padding(.vertical, 10)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 15)
                    }
                    .matchedGeometryEffect(id: "cardContainer-\(appCard.id)", in: namespace)
                    .frame(width: UIScreen.main.bounds.width, height: 450)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Spacer()
                        Text(appCard.aboutTitle)
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(appCard.aboutTextIntroPart)
                                .font(.body)
                                .bold()
                            +
                            Text(appCard.aboutTextIntroHighlight)
                                .font(.body)
                                .foregroundColor(.gray)
                            +
                            Text(appCard.aboutTextIntroRest)
                                .font(.body)
                                .foregroundColor(.gray)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(0..<10) { _ in
                                    Text(appCard.whatWeLoveTitle)
                                        .font(.body)
                                        .bold()
                                    +
                                    Text(appCard.whatWeLoveDescription)
                                        .font(.body)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                    isExpanded = false
                    selectedCard = nil
                }
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}
