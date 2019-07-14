
import Foundation
/*:

 There are two common ways to rule the multigreading in iOS. Using **GCD** or **OperationQueues**, a hight level concurrency manipulation built upon GCD. What is for sure you shouldn't find yourself creating Thread explicitly.
 
 # Grand Central Dispatch
 
 GCD is a FIFO queue, able to productively manage its tasks (synchronous/asynchronous methods or closures) on available threads and in a parallel manner.
 
 * *Synchronous task* - the system will block the current run loop until execution of this taks finishes.
 * *Asynchronous task* - the task will start but no block of the current loop will be performed.
 
 It's important to understand, that despite GCD is a FIFO queue, there's no garauntee asynchronous tasks will be finished in the same order they have been started. For each task the time of execution could vary.
 
 * *Serial Queue* - queue having only one related thread. It means only one single task could be executed in ant given time.
 * *Concurrent Queue* - leverage as many threads, created on demand, a system has resources for.
 
 A queue is created serial by default. If you want it to be concurrent you should explicitly define it like so:
 */

let concurrentQueue = DispatchQueue(label: "com.german.concurrent", attributes: .concurrent)
/*:
 
 ### Difference between sync/async task and serial/concurrent queue
 
 Asynchronous doesn't meen concurrent. Async tasks could be dispatched both to serial and concurrent queue. But in the former it will behave like a sync task, because the containing queue has only one thread.
 
 Being synchronous or asynchronous only means if the queue will wait until a current task is completed before starting a next task. While concurrent or serial means how many resources a queue has.
 
 ### DispatchQueue.main
 
 The main queue is so popular, that Apple provided shortcut as shown in a section title. This is a serial queue. But be careful never calling a **sync** operation on it. It may block it and even worse, cause a deadlock.
 
 An example shows how to create a serial queue, perform an operation on it, leaving a main thread unblocked and then switching back to the main to display result.
 [GCD Async](GCD-async)
 
 ### Quality of Service (QoS)
 
 I don't want to elaborate on it too much, but you should know there are 4 main types of QoS.
 * .userInteractive - for UI driven calculations, animations. Recommended for tasks directly interacts with UI. Tasks should complete visually instantaneously.
 
 * .userInitiated - as the name says should be used, when task is kicked off by user. For instance, user clicked button which opens document or reads from a local DB. Tasks here could take a few seconds.
 
 * .utility - tasks in this queue implies a long running computiations, such as I/O, networking containing a progress indicator. Could take a few seconds to a few minutes.
 
 * background - for tasks user shouldn't be aware of. Prefetching, database maintenance, backups. They don't require user interaction and aren't time sensitive.
 
Creating a queue with a default QoS doesn't promise all its tasks will be executed with an exact priority. If tasks will a highest priority will be enqueued. GCD will try to execute them first to prevent [priority inversion](https://en.wikipedia.org/wiki/Priority_inversion)
 
[GCD QoS Priority Inversion Example](GCD-QoS-PI)
 
 ## Thanks
 */
