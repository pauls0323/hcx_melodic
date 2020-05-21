
### 前五课
参考博客

https://blog.csdn.net/u012197995/article/details/85009861
sudo apt-get install ros-kinetic-gazebo-ros-control
sudo apt-get install ros-kinetic-move-base-msgs
sudo apt-get install libasound2-dev
sudo apt-get install ros-kinetic-effort-controllers
sudo apt-get install ros-kinetic-joint-state-controller
sudo apt-get install ros-kinetic-ros-control ros-kinetic-ros-controllers
pip install empy
### 第六课
libsdl2-dev 错误 

https://blog.csdn.net/WUDIxi/article/details/100170859

#### cartograph
```bash
# 安装工具
sudo apt-get update 
sudo apt-get install -y python-wstool python-rosdep ninja-build 
# 初始化工作空间
cd catkin_google_ws 
wstool init src 
#设置下载地址
wstool merge -t src https://raw.githubusercontent.com/googlecartographer/artographer_ros/master/cartographer_ros.rosinstall 
# 下载功能包
wstool update -t src 

rosdep update
# 编译功能包 
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
catkin_make_isolated --install --use-ninja 
source install_isolated/setup.bash 
```
**参考链接**

[wstool update -t src](https://zhuanlan.zhihu.com/p/86426524)

### 安装教程
https://blog.csdn.net/weixin_43262513/article/details/88256762