#include <stdio.h>
#include <wiringPi.h>

// 定义GPIO引脚
#define Motor1_EN 0
#define Motor1_Pin1 1
#define Motor1_Pin2 2
#define Motor2_EN 3
#define Motor2_Pin1 4
#define Motor2_Pin2 5

// 前进函数
void forward(int speed) {
    // 左右轮同时向前转动
    digitalWrite(Motor1_Pin1, HIGH);
    digitalWrite(Motor1_Pin2, LOW);
    digitalWrite(Motor2_Pin1, HIGH);
    digitalWrite(Motor2_Pin2, LOW);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 左转函数
void left(int speed) {
    // 左轮反向转动
    digitalWrite(Motor1_Pin1, LOW);
    digitalWrite(Motor1_Pin2, HIGH);
    digitalWrite(Motor2_Pin1, HIGH);
    digitalWrite(Motor2_Pin2, LOW);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 右转函数
void right(int speed) {
    // 右轮反向转动
    digitalWrite(Motor1_Pin1, HIGH);
    digitalWrite(Motor1_Pin2, LOW);
    digitalWrite(Motor2_Pin1, LOW);
    digitalWrite(Motor2_Pin2, HIGH);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 停止函数
void stop() {
    // 左右轮同时停止转动
    digitalWrite(Motor1_Pin1, LOW);
    digitalWrite(Motor1_Pin2, LOW);
    digitalWrite(Motor2_Pin1, LOW);
    digitalWrite(Motor2_Pin2, LOW);
    // 停止PWM输出
    analogWrite(Motor1_EN, 0);
    analogWrite(Motor2_EN, 0);
}

int main() {
    // 初始化GPIO引脚
    wiringPiSetup();
    pinMode(Motor1_EN, OUTPUT);
    pinMode(Motor1_Pin1, OUTPUT);
    pinMode(Motor1_Pin2, OUTPUT);
    pinMode(Motor2_EN, OUTPUT);
    pinMode(Motor2_Pin1, OUTPUT);
    pinMode(Motor2_Pin2, OUTPUT);

    // 前进5秒钟
    forward(500);
    delay(5000);

    // 左转2秒钟
    left(300);
    delay(2000);

    // 右转2秒钟
    right(300);
    delay(2000);

    // 停止
    stop();
    return 0;
}
```
```
#include <stdio.h>
#include <wiringPi.h>

// 定义GPIO引脚
#define Motor1_EN 0
#define Motor1_Pin1 1
#define Motor1_Pin2 2
#define Motor2_EN 3
#define Motor2_Pin1 4
#define Motor2_Pin2 5

// 前进函数
void forward(int speed) {
    // 左右轮同时向前转动
    digitalWrite(Motor1_Pin1, HIGH);
    digitalWrite(Motor1_Pin2, LOW);
    digitalWrite(Motor2_Pin1, HIGH);
    digitalWrite(Motor2_Pin2, LOW);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 后退函数
void backward(int speed) {
    // 左右轮同时向后转动
    digitalWrite(Motor1_Pin1, LOW);
    digitalWrite(Motor1_Pin2, HIGH);
    digitalWrite(Motor2_Pin1, LOW);
    digitalWrite(Motor2_Pin2, HIGH);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 左转函数
void left(int speed) {
    // 左轮反向转动
    digitalWrite(Motor1_Pin1, LOW);
    digitalWrite(Motor1_Pin2, HIGH);
    digitalWrite(Motor2_Pin1, HIGH);
    digitalWrite(Motor2_Pin2, LOW);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 右转函数
void right(int speed) {
    // 右轮反向转动
    digitalWrite(Motor1_Pin1, HIGH);
    digitalWrite(Motor1_Pin2, LOW);
    digitalWrite(Motor2_Pin1, LOW);
    digitalWrite(Motor2_Pin2, HIGH);
    // 控制速度
    analogWrite(Motor1_EN, speed);
    analogWrite(Motor2_EN, speed);
}

// 停止函数
void stop() {
    // 左右轮同时停止转动
    digitalWrite(Motor1_Pin1, LOW);
    digitalWrite(Motor1_Pin2, LOW);
    digitalWrite(Motor2_Pin1, LOW);
    digitalWrite(Motor2_Pin2, LOW);
    // 停止PWM输出
    analogWrite(Motor1_EN, 0);
    analogWrite(Motor2_EN, 0);
}

int main() {
    // 初始化GPIO引脚
    wiringPiSetup();
    pinMode(Motor1_EN, OUTPUT);
    pinMode(Motor1_Pin1, OUTPUT);
    pinMode(Motor1_Pin2, OUTPUT);
    pinMode(Motor2_EN, OUTPUT);
    pinMode(Motor2_Pin1, OUTPUT);
    pinMode(Motor2_Pin2, OUTPUT);

    // 前进5秒钟
    forward(500);
    delay(5000);

    // 后退2秒钟
    backward(400);
    delay(2000);

    // 左转2秒钟
    left(300);
    delay(2000);

    // 右转2秒钟
    right(300);
    delay(2000);

    // 停止
    stop();
    return 0;
}
