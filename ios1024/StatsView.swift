//
//  StatsView.swift
//  ios1024
//
//  Created by Clay Beal on 11/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct StatsView: View {
    @EnvironmentObject var navi: MyNavigator
    @State private var gameStats: [GameStat] = [] // A list to hold game statistics

    var body: some View {
        VStack {
            Text("Game Statistics")
                .font(.largeTitle)
                .padding()

            List(gameStats) { stat in
                VStack(alignment: .leading) {
                    Text("Game Date: \(stat.date, formatter: dateFormatter)")
                    Text("Swipes: \(stat.swipeCount)")
                    Text("Win: \(stat.win ? "Yes" : "No")")
                }
                .padding(.vertical)
            }
            .onAppear {
                fetchGameStats()
            }

            Button("Back to Game") {
                navi.navBack()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
        }
        .padding()
    }

    func fetchGameStats() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()

        // Reference the user's games sub-collection
        let userGamesRef = db.collection("users").document(userId).collection("games")
        
        userGamesRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                gameStats = querySnapshot?.documents.compactMap { document -> GameStat? in
                    let data = document.data()
                    guard
                        let date = (data["dateAndTime"] as? Timestamp)?.dateValue(),
                        let boardSize = data["boardSize"] as? Int,
                        let maxScore = data["maxScore"] as? Int,
                        let swipeCount = data["moves"] as? Int,
                        let outcome = data["outcome"] as? String
                    else {
                        return nil
                    }
                    return GameStat(
                        id: document.documentID,
                        date: date,
                        boardSize: boardSize,
                        maxScore: maxScore,
                        swipeCount: swipeCount,
                        win: outcome == "win"
                    )
                } ?? []
            }
        }
    }
}

struct GameStat: Identifiable {
    var id: String
    var date: Date
    var boardSize: Int
    var maxScore: Int
    var swipeCount: Int
    var win: Bool
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    StatsView()
}
