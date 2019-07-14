
/*:
 ## What is it all about?
 
 The examples you'll find in this Playground are only demonstrates differents possibilites of concurrency implementation in iOS. In order to learn more about concurrency programming and multithreading in general, please refer to additional sources.
 
 You can follow the article below and click for examples linked throught the text.
 
 ## A brief theory
 
 There are two common ways to rule the concurrency in iOS. Using **GCD** or **OperationQueues**, a hight level concurrency manipulation built upon GCD.
 
 *Grand Central Dispatch* - FIFO queue, able to productively manage its tasks (synchronous/asynchronous methods or closures) on available threads and in a parallel manner.
 
 * Synchronous task - the system will block the current run loop until execution of this taks finishes.
 * Asynchronous task - the task will start but no block of the current loop will be performed.
 
 It's important to understand, that despite GCD is a FIFO queue, there's no garauntee asynchronous tasks will be finished in the same order they have been started. For each task the time of execution could vary.
 
 [GCD Async](GCD-async)
 
 ## Thanks
 */
