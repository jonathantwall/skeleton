package com.example.cmdline;

import com.example.Greeting;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import dagger.Component;
import dagger.Module;
import dagger.Provides;

import javax.annotation.Nullable;
import javax.inject.Inject;
import javax.inject.Singleton;
import java.util.List;

public class Runner {
  public static void main(String args[]) {
    @Nullable Integer foo = null;
    List<String> bar = Lists.newArrayList();
    Preconditions.checkArgument(bar.isEmpty());
    Greeting.sayHi();
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
