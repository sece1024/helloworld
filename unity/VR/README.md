# 脚本解读

## 接口

### IHostMission

## 类

### **HostMission** : MonoBehaviour, IHostMission



### **AccidentExperience**  : HostMission

#### 成员变量

```c#
    public GameObject rightHand;
    public Transform playerTra;
    public Transform[] playerPos;
    public PlayableDirector[] timeLineControl;
    //public Transform[] watchPoint;
    public lZAudioControl systemAudio;
    public lZAudioControl humanAAudio;
    public lZAudioControl humanYiAudio;
    public lZAudioControl humanBingudio;
    public lZAudioControl humanDingudio;
    public TipManager tipManager;
    public Transform[]tipVector3s ;
    [SerializeField]
    private bool[]stepIndex ;
    public GameObject bloodEffect;
    public FuntionChange lineChange;

    public GameObject[] highLights;

    public HostMission mainMession;

    public GameObject market;

    public GameObject manager;
    public GameObject text;
    public GameObject deathAni;
    public Action Onendin;
    public Action OnreplayIn;
    public GameObject replayTimeline;
    private int currentIndex = 0;
    public int CurrentIndex
    {
        get { return currentIndex; }
        set
        {
            Debug.Log("流程"+currentIndex+"完成");
            stepIndex[currentIndex] = true;
            currentIndex = value;

        }
    }
```



#### 方法



### **EniluMission** : AccidentExperience, IHostCoroutineRunMission, IHostInitMission

#### 成员变量

```c#
private Animator humanDing;		//人物丁的动画控制器
public GameObject eleKey;		// 电子锁
```



#### 方法





# TimeLine

## 教程

https://blog.csdn.net/linxinfa/article/details/108374878

# 语法

## 标签

### [Tooltip]

> 类似于代码的注释功能，用于inspecter面板。
>
> 添加一个tooltip属性可以在instpector面板上提示注释

## 关键字

### lock

> lock 关键字可以用来确保代码块完成运行，而不会被其他线程中断。这是通过在代码块运行期间为给定对象获取互斥锁来实现的。



## 委托

[Unity_C#委托与事件——委托的基本使用_玉树临风宗哥哥的博客-CSDN博客](https://blog.csdn.net/qq_51147038/article/details/112299278)

* 委托的作用

> 总的来说，委托可以使一个方法被当成参数来进行传递并使用，可以理解为它就是指向一个内存地址，而这个地址就是你所传递的方法参数的内存地址，如果你并没有传入方法参数，那么它就是一个null值。

* 委托的声明

`public delegate void Delegate_One();`

声明了一个无参数且无返回值的委托，void代表此委托没有返回值，（）里没有参数就代表委托无参数。

```c#
// 需要int返回值的委托
public delegate int Delegate_Two();
// 右声明了一个无返回值但需要一个int参数的委托
public delegate void Delegate_Three(int num);
// 需要int返回值并且带有一个int参数的委托
public delegate int Delegate_Four(int num);
```

**相较与方法，委托只是多了一个delegate关键字，同时它并没有方法体的实现**



* 委托的实例

```c#
   public Delegate_One delegate_One;
   public Delegate_Two delegate_Two;
   public Delegate_Three delegate_Three;
   public Delegate_Four delegate_Four;
```

* 委托的调用

```c#
public void DelegateTest_One(Delegate_One delegate_One)
    {
        if (delegate_One != null)
        {
            delegate_One();
            //delegate_One.Invoke();
        }
    }
/*
这里我们的方法参数不再是什么int，string，对象什么的，而是Delegate_One这个委托，而方法主体我们首先判断了一下委托参数是否为空，因为委托就是一个引用地址，所以它是可以为null值的，那样我们就没必要再执行。

而传进来的委托其实就是一个方法，它也可以像方法一样执行—“delegate_One()”;，也可以用—delegate_One.Invoke();执行，两种方法都是一样的效果。

同时Delegate_One这个委托它是一个无参无返回值的委托，所以只要是一个无参无返回值的方法，我们都可以把他当成Delegate_One的委托实例进行传递
*/
```

* 使用委托

```c#
public void Test_One()
    {
        Debug.Log("执行无参无返回值委托")；
    }
```

```c#
private void Start()
    {
        DelegateTest_One(Test_One);
    }
```

* 完整测试流程

```c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Test : MonoBehaviour
{
    public delegate void Delegate_One();
    public delegate int Delegate_Two();
    public delegate void Delegate_Three(int num);
    public delegate int Delegate_Four(int num);
    public Delegate_One delegate_One;
    public Delegate_Two delegate_Two;
    public Delegate_Three delegate_Three;
    public Delegate_Four delegate_Four;
    private void Start()
    {
        //DelegateTest_One(Test_One);
        delegate_One = Test_One;
        DelegateTest_One(delegate_One);
        //DelegateTest_Two(Test_Two);
        delegate_Two = Test_Two;
        DelegateTest_Two(delegate_Two);
        //DelegateTest_Three(Test_Three);
        delegate_Three = Test_Three;
        DelegateTest_Three(delegate_Three);
        //DelegateTest_Four(Test_Four);
        delegate_Four = Test_Four;
        DelegateTest_Four(delegate_Four);
    }
    public void Test_One()
    {
        Debug.Log("执行无参无返回值委托");
    }
    public void DelegateTest_One(Delegate_One delegate_One)
    {
        if (delegate_One != null)
        {
            delegate_One();
            //delegate_One.Invoke();
        }
    }
    public int Test_Two()
    {
        Debug.Log("执行无参数但返回值为int的委托");
        return 0;
    }
    public void DelegateTest_Two(Delegate_Two delegate_Two)
    {
        if (delegate_Two != null)
        {
            delegate_Two();
            //delegate_Two.Invoke();
        }
    }
    public void Test_Three(int num)
    {
        Debug.Log("执行无返回值但带有int参数的委托,参数为："+num);
    }
    public void DelegateTest_Three(Delegate_Three delegate_Three)
    {
        if (delegate_Three != null)
        {
            delegate_Three(0);
            //delegate_Three.Invoke(0);
        }
    }
    public int Test_Four(int num)
    {
        Debug.Log("执行带有int参数并且返回值为int的委托，参数为：" + num);
        return 0;
    }
    public void DelegateTest_Four(Delegate_Four delegate_Four)
    {
        if (delegate_Four != null)
        {
            delegate_Four(0);
            //delegate_Four.Invoke(0);
        }
    }
}


```

# 项目

## 脚本

### WorkManager.cs

**项目管理**

#### 功能

1. 人物模型
   * 位置
   * 动画
   * 音频播放
2. 提示框
   * 位置