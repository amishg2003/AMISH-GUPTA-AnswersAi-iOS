import SwiftUI

struct CardView: View {
    let appCard: AppCard
    @Binding var selectedCard: AppCard?
    @Binding var isExpanded: Bool
    var namespace: Namespace.ID
    @State private var storedMinY: CGFloat = 0
    
    
    var body: some View {
        //Used a geometry reader to ensure smooth "bubble" animation
        GeometryReader { reader in
            //Stacking all the different compponents used, they toggle on width based on if it is clicked or not
            ZStack {
                Image(appCard.coverImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 450)
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
                            .layoutPriority(1)

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
                            print("")
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
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 450)
            .cornerRadius(15)
            .shadow(radius: 5)
            .onAppear {
                storedMinY = reader.frame(in: .global).minY
            }
            .onTapGesture {
                if selectedCard?.id == appCard.id {
                    // Collapse animation
                    withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                        isExpanded = false
                        selectedCard = nil
                    }
                } else {
                    // Expand animation
                    withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                        selectedCard = appCard
                        isExpanded = true
                    }
                }
            }
        }
        .frame(height: 450)
    }
}

