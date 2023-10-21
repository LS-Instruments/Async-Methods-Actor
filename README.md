# Async Methods Actor
A library that extends the Actor Framework to allow for async method execution.

The "Async Methods Actor" is an actor-based library that implements an infrastructure for launching async methods. By making actors inherit from the "Async Methods Actor", it is possible to launch any method without waiting for its conclusion, by sending messages child of the abstract message "Async Message.lvclass". This framework is especially useful for tasks that take a long time to execute which implemented as Actor methods would lock the actor until completion. The official way to implement those tasks in the Actor Framework is to code them as helper loops within the "Actor Core.vi". This however brings along the overhead of setting up a communication mechanism between Actor methods and the helper loop, thus voiding the advantage of OOP encapsulation. By means of this framework, you continue to benefit from OOP encapsulation of the Actor Framework also for long execution tasks without having to implement ad-hoc data transfer methods between methods and helper loops.

## Steps required to use this library
1. Subclass the "Async Methods Actor.lvclass" class. You can now use your actor as you would normally do with normal LabVIEW actors
2. Choose a method of the actor that you want to execute asynchronously
3. Create a message corresponding to such method as you would normally within the AF
4. Let this message inherit from "Async Message.lvclass"
5. Send this message through the send command of your message as you would normally do within the AF

If you want to get more control over the asynchronous call you can use the "Send Async Message.vi" method of the "Async Message.lvclass" class. To method you wire the message object you have created (possibly configured to match the input of your actor method by means of suitable property modes) and optionally an "Async Call Method" enum that can take values "Call and Collect" or "Call and forget". The message can be also configured by setting a previously created concrete subclass of the "Completion Notification Msg" and a caller enqueuer, if both settings are performed upon completion of the "Call and Collect" Async Message method the Async Method Actor will send the aforementioned concrete "Completion Notification Msg" message to the caller that will enable the caller to obtain a copy of the Async Message and the current number of running "Call and Collect" messages of this kind. The copy of the message will allow the caller to access the GUID and FQN of the conclude Async Message by means of the corresponding Async Message properties

# Methods and Classes documentation

## The "Async Methods Actor.lvclass" Actor Class
Actor that implements an infrastructure for launching async methods. By making actors inherit from this actor, it is possible to launch any method without waiting for its conclusion, by sending messages child of the abstract message "Async Message.lvclass". This framework is especially useful for tasks that take a long time to execute which implemented as Actor methods would lock the actor until completion. The official way to implement those tasks in the Actor Framework is to code them as helper loops within the "Actor Core.vi". This however brings along the overhead of setting up a communication mechanism between Actor methods and the helper loop, thus voiding the advantage of OOP encapsulation. Using this framework you continue to benefit from OOP encapsulation of the Actor Framework for long execution tasks without having to implement ad-hoc data transfer methods between methods and helper loops.

### The "Running Methods Communication" property

![Running Methods Communication](media/Running%20Methods%20Communication.png)

This property allows setting up a communication method based either on a notifier or an event structure that allows the subscriber to receive information about the Async Messages currently running. The subscriber will receive the FQN of the running Async Messages, the number of running  Async Messages launched by the "Call & Collect" method and the number of launched  Async Messages launched by the "Call & Collect" method. The setting is controlled by the "" enum that can take values "None" (default), "Notifier" and "Event": the first disables the communication, the second sets it up by means of a notifier that can be accessed by means of the "Async Messages Running Notifier" while the third  sets it up by means of a event mechanism whose reference can be accessed by means of the "Async Messages Running Event Ref".

## The "Async Message.lvclass" abstract message
Subclass this message and implement the Do.vi method to execute such a method in an async manner. This is useful for long-lasting methods that would lock the actor during their execution. You can configure this message by setting the Async Call method property. The property enumeration can take values "Call and Collect" and "Call and Forget". In the former case the "Async Methods Actor" will track the execution of the methods by waiting for their completion, in the latter case instead the actor will not wait for their completion but will just count their launch. The execution of "Call and Collect" methods and the launch of "Call and Forget" can be followed by subscribing to the "Async Methods Running Notifier" available from the corresponding property of the "Async Methods Actor". "Call and Forget" use is discouraged and is meant to cater to situations where the lifetime of the method execution is supposed to survive the lifetime of the "Async Methods Actor". The message can be also configured by setting a previously created concrete subclass of the "Completion Notification Msg" and a caller enqueuer, if both settings are performed upon completion of the "Call and Collect" Async Message method the Async Method Actor will send the aforementioned concrete "Completion Notification Msg" message to the caller that will enable the caller to obtain a copy of the Async Message and the current number of running "Call and Collect" messages of this kind. The copy of the message will allow the caller to access the GUID and FQN of the conclude Async Message by means of the corresponding Async Message properties

### The "Send Async Message.vi" method

![Send Async Message](media/Send%20Async%20Message.png)

This VI sends a concrete Async Message to an "Async Methods Actors" actor. 

Wire a properly configured (see message documentation for discovering configuration options) concrete subclass of the "Async Message" terminal to call a specific method of a subclass of the "Async Methods Actor".  The VI will output the GUID generatied for the corresponding message sending.

Optionally you can wire an "Async Call Method" enumeration. This can take values "Call and Collect" and "Call and Forget". In the former case the "Async Methods Actor" will track the execution of the methods by waiting for their completion, in the latter case instead the actor will not wait for their completion but will just count their launch.

### The "Caller Enqueuer" property

![Caller Enqueuer Property](media/Caller%20Enqueuer%20Property.png)

Sets the caller equeueur to which notify  the completion of the Async Method by means of the concreate subclass of the "Completion Notification Msg.lvclass" (specified by the "Completion Notification Msg" property). The caller will receive the completed Async Message allowing the access by means of it property to its GUID and FQN as well as the remaining number of "Call and Collect" Async Messages of the same type. To enable the callee Async Methods Acor to notify completion both this property and the "Completion Notification Msg" must be properly set.

### The "Completion Notification Msg" property

![Completion Notification Message Property](media/Completion%20Notification%20Message%20Property.png)

Sets a concrete subclass of the "Completion Notification Msg.lvclass" abstract message to notify the caller (specified by the "Caller Enqueuer" property) about completion of Async Message. The caller will receive the completed Async Message allowing the access by means of it property to its GUID and FQN as well as the remaining number of "Call and Collect" Async Messages of the same type. To enable the callee Async Methods Acor to notify completion both this property and the "Caller Enqueuer" must be properly set.

## The "Completion Notification Msg.lvclass" abstract message

A concrete subclass of this abstract message is used to send the caller information about the Call & Collect Async Message whose execution comes to completion. Information includes the message itself, including its FQN and GUID accessible by the corresponding properties, and the current number of running Call & Collect Async Messages of this type