package com.example;

import dagger.Component;
import dagger.Module;
import dagger.Provides;

import javax.inject.Inject;
import javax.inject.Singleton;

public class Greeting {
  public static void sayHi() {
    System.out.println("Hi!");
  }

  public void sayHello() {
    System.out.println("Hello!");
  }

  @Module
  static class ToyModule {
    @Provides
    @Singleton
    static Greeting provideGreeting() {
      return new Greeting();
    }
  }

  static class ToyApp {
    public final Greeting greeting;

    @Inject
    ToyApp(Greeting greeting) {
      this.greeting = greeting;
    }
  }

  @Singleton
  @Component(modules = {ToyModule.class})
  interface ToyComponent {
    ToyApp toyApp();
  }
}
