package com.example.cmdline;

import com.example.Greeting;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;

import javax.annotation.Nullable;
import java.util.List;

public class Runner {
  public static void main(String args[]) {
    @Nullable Integer foo = null;
    List<String> bar = Lists.newArrayList();
    Preconditions.checkArgument(bar.isEmpty());
    Greeting.sayHi();
  }
}
