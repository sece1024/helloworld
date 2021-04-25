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

