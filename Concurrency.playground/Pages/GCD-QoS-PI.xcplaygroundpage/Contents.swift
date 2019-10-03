import Foundation

let queue = DispatchQueue(label: "com.utility.queue",
                          attributes: .concurrent)

//for some reason, creating queue with default qos
//didn't work properly, so this is how I managed to show an priority switch in action
queue.async(qos: .background) {
    for i in 1...10 {
        print("\(i) 🐰 joined the race")
    }
}

queue.async(qos: .userInteractive) {
    for i in 1...10 {
        print("\(i) 🐢 joined the race")
    }
}
//: [Back](Main)
