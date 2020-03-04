package com.example;

public class ProjectRunnerMain {
  public static void main(String args[]) {
    // TODO - make sure we are running the component compiler and uncomment.
    Greeting.ToyApp toyApp = DaggerGreeting_ToyComponent.builder().build().toyApp();
    toyApp.greeting.sayHello();
  }
}
