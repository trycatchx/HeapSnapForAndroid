package com.tct.heapsnap;

/**
 * Created on by nieyinyin 30/11/2016.
 */

public class HelloWorld {

    static {
        try {
            System.loadLibrary("heapsnap");
        } catch (Exception e) {
        }
    }

    private volatile static HelloWorld instance;

    public HelloWorld() {

    }

    public static HelloWorld getInstance() {
        if (instance == null) {
            synchronized (HelloWorld.class) {
                if (instance == null) {
                    instance = new HelloWorld();
                }
            }
        }
        return instance;
    }

}
