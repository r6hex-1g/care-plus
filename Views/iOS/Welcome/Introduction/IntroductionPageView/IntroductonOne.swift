import SwiftUI

struct IntroductionOne: View {
    var body: some View {
        VStack {
            Spacer()
            I1HeaderView()
            Spacer()
        }
         .padding(.horizontal, 40.0)
    }
}

struct I1HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.line.dotted.person.fill")
                .resizable()
                .foregroundColor(.accentColor)
                .frame(width: 80, height: 40)
                .scaledToFit()
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: -5.0) {
                    Text("안뇽!")
                }
            }
        }
    }
}
