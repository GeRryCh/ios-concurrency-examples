import Foundation

let queue = DispatchQueue(label: "com.german.gcdasync")

queue.async {
    Thread.sleep(forTimeInterval: 3.0)
    let longCaclulationResult = 2 + 2
    DispatchQueue.main.async {
        print("Update ui with result: \(longCaclulationResult)")
    }
}
//: [Back](Main)
