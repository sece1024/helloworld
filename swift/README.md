# Swift

## Introduce

### disSet

```swift
var count = 0{
    didSet{
        print("Count: \(count)")	// 每次调用count都会执行这句
    }
}
for(var i=0;i<3;i++){
    count += 1
}
```

## Access Control

> Protecting our internal implementations

* `internal` - "usable by any object in my app or framework"
* `private` - "only callable from within  this object"
* `private(set)` - "this property is readable outside this object, but not settable" | 外部访问，内部赋值
* `fileprivate` - accessible by any code in this source file
* `public` - (for frameworks only) this can be used by objects outside my framework
* `open` - (for frameworks only) public and objects outside my framework can subclass this



## assert|断言

```swift
assert(boolFlag, "information you want show when exception happened.")
```

## extension

给一个对象添加自定义的变量或方法

```swift
// 扩展int类型数据，添加一个返回随机数功能
extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self))) // self是值整数自己
        }else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self)))
        }else{
                return 0
            }
    }
}
    

```

## protocol | 协议

> A type which is a declaration of functionality only
>
> No data storage of any kind
>
> Protocols are essentially a way for callers to call an API with anything they want | 协议本质上是一种调用者可以使用他们想要的任何内容调用API
>
> 协议是一个变量和函数列表

* Declaration of the protocol itself

```swift
protocol SomeProtocol : InheritedProtocol1, InheritedProtocol2{
    var someProperty : Int { get set}
    func aMethod(arg1: Double, anotherArgument: String) -> SomeType
    mutating func changeIt()
    init(arg: Type)
}
// Anyone that implements SomeProtocol must also implement InheritedProtocol1 and 2
// You must specify whether a protocol is get only or both get and set
// Any function that are expected to mutate the receiver should be marked mutating(unless you are going to restrict your protocol to class implementers only with class keyword)
```

*协议中，只有声明没有代码实现*



使用示例：

```swift
protocol Moveable{
    mutating func move(to point: CGPoint)
}

class Car : Moveable{
    // 类是一个引用，不需要变异
    func move(to point: CGPoint){ ... }
    func changeOil()
}
struct Shape : Moveable{
    // 和类不同，结构体不是引用，而是数据对象，所以要添加mutating|变异 前缀 
    mutating func move(to point: CGPoint){ ... }
    func draw()
}

let prius: Car = Car()
let square: Shape = Shape()

var thingToMove: Moveable = prius
thingToMove.move(to: ...)
// this is error
// thingToMove.changeOil()
```

**Another use of Protocols**

```swift
protocol Equatable{
    static func ==(lhs: Self, rhs: Self) -> Bool
}
// Types that conform to Equatable have to have a type function (note the static) called == | 任何类只要实现这个协议就可以做==运算
// The arguments to == are both of that type(i.e. Self of the type is the type itself)
// The == operator also happens to look for such a static method to provide its implementation
```



### protocol & extension



> Using extension to provide protocol implementation







## closure | 闭包

> There's only two reference types in Swift, class and closures | Swift中只有两种类型引用，类和闭包

* 使用示例

*数组有方法`map`, 将一个函数作为参数。它能将那个函数作用于数组中每一个元素，并生成返回一个新的数组*

```swift
let primes = [2.0, 3.0, 4.0]
// 第一个映射用括号表示闭包
let negativePrimes = primes.map({ -$0 })	// [-2.0, -3.0, -4.0]
// 尾随闭包
// 如果函数最后一个参数是闭包，可以闭包移到括号之外
let invertedPrimes = primes.map(){1.0/$0}
let primeStrings = primes.map{ String($0) }
```



* Closures with  property initialization

*执行一个闭包来初始化属性*

> This is especially useful with lazy property initialization

```swift
var someProperty: Type = {
    // construct the value of someProperty here
    return <the constructed value>
}()
```



* Capturing | 捕获

*Closures are regular types, so they can be put in Arrays, Dictionarys, etc.*

*When this happens, they are stored in the heap(i.e. they are reference types).*



*What is more, they "capture" variables they use from the surrounding code into the heap too.*

*Those captured variables need to stay in the heap as long as the closure stays in the heap.*

```swift
var ltuae = 42	// life the universe and everything
operation = { ltuae * $0 }	// 捕获变量ltuae，因为闭包需要它，ltuae将呆在堆中直到闭包消失
arrayOfOperations.append(operation)
// 如果之后改变ltuae，then the next time we evalute operation it will reflect that even if we leave the scope(function or whatever) that this code is in!
// 捕获该数组操作的类，闭包已经将该类捕获到堆中，通过其数组捕获该类堆中的闭包(they're pointing to each other through the array)
// 创造了一个记忆周期，闭包保持类，类保持闭包，他们呆在堆中永不离开，直到有人从数组中移除了闭包
// unowned 类型可打破这样的周期
```





### Function Types

```swift
var operation: (Double) -> Double
// operation = { (operand: Double) -> Double in return -operand }
// operation = { (operand) in -operand }
operation = { -$0 }
let result = operation(4.0)	// result will be -4.0
```



## Thrown Errors

```swift
func save() throws

do{
    try context.save()
}catch let error{
    throw error
}
```



# iOS

## tianqi

[(3条消息) 基于Swift的简易iOS天气APP_林大夕可的博客-CSDN博客](https://blog.csdn.net/Sherlooock/article/details/107488658?ops_request_misc=%7B%22request%5Fid%22%3A%22162252443616780357280024%22%2C%22scm%22%3A%2220140713.130102334.pc%5Fall.%22%7D&request_id=162252443616780357280024&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_v2~rank_v29-1-107488658.first_rank_v2_pc_rank_v29&utm_term=iOS+天气app+swift&spm=1018.2226.3001.4187)

