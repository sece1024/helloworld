# unity测试项目4.16~4.19

unity版本：`2019.4.15f1c1`

## 需求分析

## 完成步骤

### 初始工作

1. 场景布置
   1. 创建摆放有集若干几何体的plane，玩家Player为胶囊体，给它添加材质以示区分
2. 添加联网功能
   1. 由于Network组件已被移除，需要从assert store导入Mirror插件
   2. 创建空物体
      1. 添加NetworManager组件
      2. 添加NetworkManagerHUD组件，用于显示GUI面板
   3. 给Player添加NetworkIdentity组件，表示这是一个网络对象
   4. 若没有添加NetworkTransform组件，客户端的画面将不能同步到服务端
3. 添加角色移动脚本`PlayerCtrl2.cs`
   1. 导入Mirror包，脚本继承NetworkBehaviour
   2. 按wsad键表示前后左右移动
   3. 给Player添加camera组件实现第一人称



### 功能点1

**实现方式：**

*服务端选择Server Only模式，表示服务端仅作为服务器运行，不生成游戏控制对象。*

*移动端（另一个PC端）选择client模式，连接`localhost`*

1. 移动

在移动控制脚本的update函数中使用`isLocalPlayer`和`isClient`判断，当是客户端本地对象则发送命令让服务端移动，在更新客户端位置，否则服务端直接移动然后更新客户端位置。

2. 镜头旋转

根据鼠标移动旋转`Player`

**客户端**

* 鼠标移动获取x轴偏移值
* 偏移值大于阈值，则，将其乘以旋转速度，然后发往服务端，让服务端`Player`进行旋转
* `rotate`属性更新到客户端

**服务端**

* 服务端直接获取x偏移值然后旋转
* 更新到客户端



### 功能点2

**需求：**

1. 物体检测鼠标点击
2. 模型轮廓高亮
3. UI显示
4. 画面同步



实现：

1. 物体点击使用标签+射线

* 对所有能被点击的集合体添加标签`ObjCouldBeClick`

  **客户端**

* 射线检测是否有带标签的碰撞盒，是则将该对象发送给服务端

* 服务端让物体外轮廓高亮，通知客户端更新

  **服务端**

* 检测物体，直接使它高亮

* 物体发往客户端，更新

1. Shader
2. 鼠标按下，物体轮廓高亮同时显示UI



---

## 遇到的问题

### [command]与[ClientRpc]

`[command]`命令是客户端发往服务端，实际上是在服务端执行的，`[ClientRpc]`与之相反是在客户端执行，搞清楚这点很重要。



**有如下代码：**

```c#
    void Update()
    {
        if (isClient && isLocalPlayer)
        {
            cmdPlayerMove(); // 这个函数在服务端执行
            //rpcPlayerMove(transform);

            Vector3 moveDirection = getMoveDirectiom();
            playerMove(moveDirection);
        }
    }
    // Client -> Server
    [Command]
    private void cmdPlayerMove()
    {
        Debug.Log("cmdPlayerMove had been called");
        // 检测键盘，获取移动方向
        Vector3 moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")); 

        // 移动
        playerMove(moveDirection);

        // 更新客户端位置
        rpcPlayerMove(this.transform);
    }
```

1. 因为`Player`是在客户端生成的，`if`语句满足，所以会在服务端调用`cmdPlayerMove()`函数。
   1. 因为`cmdPlayerMove()`函数每帧都会在服务端调用，若在服务端按下键盘，`Player`位置会改变，并且位置参数会通过在客户端执行`cmdPlayerMove()`函数而进行更新，由此而实现画面同步，而且看上去好像是服务端在控制客户端。
   2. 如果在客户端按下键盘，会在客户端直接改变`Player`位置，但此时服务端没收到通知，所以只有客户端的画面会发生变化。



**修改后的代码：**

```C#
    void Update()
    {
        if (isClient && isLocalPlayer)
        {
            
            //rpcPlayerMove(transform);

            Vector3 moveDirection = getMoveDirectiom();
            cmdPlayerMove(moveDirection); // 这个函数在服务端执行
            
        }
        else if (isServer)
        {
            // 在服务端按下键盘，直接位移然后更新客户端的位置
            playerMove(getMoveDirectiom());
            rpcPlayerMove(this.transform);
        }
            // Client -> Server
    [Command]
    private void cmdPlayerMove(Vector3 moveDire)
    {
        Debug.Log("cmdPlayerMove had been called");
        // 检测键盘，获取移动方向
        // Vector3 moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")); 

        // 移动
        playerMove(moveDire);

        // 更新客户端位置
        rpcPlayerMove(this.transform);
    }

    [ClientRpc]
    private void rpcPlayerMove(Transform t)
    {
        Debug.Log("rpcPlayerMove had been called");
        // 更新客户端玩家位置
        transform.position = t.position;
    }
```

2. 如果在客户端，会通过键盘获取移动方向，将这方向发送给服务端移动，再在客户端更新位置
3. 如果在服务端，会直接获取方向然后移动，更新客户端位置。

# 要求

上机测试题要求：
1. 本测试题为移动端（安卓）程序在局域网内控制PC端程序（如未接触过移动端发布，可改为局域网内两台电脑相互控制）
2. 自备一套简易三维场景，场景内包含地面，多个物体（可以是多个几何体），场景限制在一个正方形平面内，面积大小自拟
3. 移动端包含所有界面和三维场景，PC端只有三维场景和对应的交互显示内容

功能点一： 
移动端遥感界面：推动遥感，控制移动端画面，第一人称视角在几何体中穿梭，同时PC端画面与移动端同步

功能点二：
点击移动端场景中的三维模型，目标模型轮廓高亮，并出席UI显示物体信息（2D/3D界面均可），PC端画面与移动端同步

功能点三：
移动端左侧设置滑动按钮界面，每个按钮设置不同的点击事件，点击后PC端三维场景产生反馈，功能可自拟
例如：
按钮A事件：PC端程序播放视频，移动端出现相应的退出按钮
按钮B事件：PC端显示图片，移动端出现相应的退出按钮
按钮C事件：PC端出现加载界面并切换场景，PC端加载完场景后，移动端出现相应的返回原场景按钮，同时移动端与PC端的连接不会被切断，返回原场景后继续同步信息，且不会出现重复连接的情况(Unity-DontDestroyOnLoad的应用)
按钮D事件：按钮中嵌入Slider与其他按钮，与场景中的某物体的Material绑定，滑动、点击时该物体材质球的透明度以及其他属性随之改变
      ......
      可自由发挥，实现的功能越多越好。重复按钮数量越多越好（这里主要看是否使用模板生成的按钮，而不是一个个手动复制的）。

功能点四：
移动端右侧界面设置小地图，可显示正方形平面内的场景以及其中各个物体、和玩家所在位置的图标
具体要求如下：
a. 两种实现方式：俯视相机、算法计算（根据计算正方形平面的Scale与小地图图片宽高的比例，使用物体的3D空间坐标计算出物体在小地图中的2D坐标位置，以这种方法为佳，自己写的算法最好）
b. 大地图：通过点击放大按钮显示全屏大地图界面
c. 点击、拖拽事件：无论是大地图和小地图，都添加点击、拖拽事件，触发事件后地图中的玩家图标跟随点击的地点移动，场景中的玩家同步移动 (a中算法的逆计算)


测试交付内容：
1. 移动端及PC端运行文件（附说明，描述运行和局域网连接方法）
2. 移动端及PC端源代码



## 参考连接

Unity Mirror使用笔记：
https://blog.csdn.net/farcor_cn/article/details/110360424

Mirror联网插件
https://blog.csdn.net/qq_34673086/article/details/112765345?utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-1&spm=1001.2101.3001.4242

Unity Mirror联网插件的基本使用
https://www.v2know.com/MainPage/PreView/254

Unity官方文档-NetWork Manager
https://docs.unity3d.com/cn/2019.4/Manual/UNetManager.html

4.18
轮廓高亮
https://www.jianshu.com/p/23fb2f6fcfa0?from=singlemessage