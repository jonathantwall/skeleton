package com.example;

import com.example.Greeting.ToyApp;

public class ProjectRunner {
  public static void main(String args[]) {
    ToyApp toyApp = DaggerGreeting_ToyComponent.builder().build().toyApp();
    toyApp.greeting.sayHello();
    Greeting.sayHi();
  }
}
