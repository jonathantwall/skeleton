package com.example.cmdline;

import com.example.Greeting;
import com.google.common.collect.Lists;
import java.util.List;

import javax.annotation.Nullable;
// import javax.inject.Inject;

public class Runner {
  public static void main(String args[]) {
    @Nullable Integer foo = null;
    List<String> bar = Lists.newArrayList();
    Greeting.sayHi();
  }


  // @Module
      // @Inject
  class AppModule {
    // ...

  }
}
