# Async Methods Actor
A library that extends the Actor Framework to allow for async method execution.

The "Async Methods Actor" is an actor-based library that implements an infrastructure for launching async methods. By making actors inherit from the "Async Methods Actor", it is possible to launch any method without waiting for its conclusion, by sending messages child of the abstract message "Async Message.lvclass". This framework is especially useful for tasks that take a long time to execute which implemented as Actor methods would lock the actor until completion. The official way to implement those tasks in the Actor Framework is to code them as helper loops within the "Actor Core.vi". This however brings along the overhead of setting up a communication mechanism between Actor methods and the helper loop, thus voiding the advantage of OOP encapsulation. By means of this framework, you continue to benefit from OOP encapsulation of the Actor Framework also for long execution tasks without having to implement ad-hoc data transfer methods between methods and helper loops.

## Steps required to use this library
1. Subclass the "Async Methods Actor.lvclass" class. You can now use your actor as you would normally do with normal LabVIEW actors
2. Choose a method of the actor that you want to execute asynchronously
3. Create a message corresponding to such method as you would normally within the AF
4. Let this message inherit from "Async Message.lvclass"
5. Send this message through the send command of your message as you would normally do within the AF

If you want to get more control over the asynchronous call you can use the "Sent Async Message.vi" method of the "Async Message.lvclass" class. To this send message method you wire the message object you have created (possibly configured to match the input of your actor method by means of suitable property modes) and optionally an "Async Call Method" enum that can take values "Call and Collect" or "Call and forget"

## The "Async Message.lvclass"
Subclass this message and implement the Do.vi method to execute such a method in an async manner. This is useful for long-lasting methods that would lock the actor during their execution. You can configure this message by setting the Async Call method property. The property enumeration can take values "Call and Collect" and "Call and Forget". In the former case the "Async Methods Actor" will track the execution of the methods by waiting for their completion, in the latter case instead the actor will not wait for their completion but will just count their launch. The execution of the "Call and Collect" methods and the launch of "Call and Forget" can be followed by subscribing to the "Async Methods Running Notifier" available from the corresponding property of the "Async Methods Actor". "Call and Forget" use is discouraged and is meant to cater to situations where the lifetime of the method execution is supposed to survive the lifetime of the "Async Methods Actor"

