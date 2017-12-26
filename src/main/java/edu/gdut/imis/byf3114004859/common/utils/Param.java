package edu.gdut.imis.byf3114004859.common.utils;

import java.util.HashMap;

/**
 * Created by Yunfei on 2017/12/26.
 */
public class Param {

    private static ThreadLocal<P> parameterMap = new ThreadLocal<>();

    public static P put(String key, Object value) {
        if(parameterMap.get() == null){

        }
        return parameterMap.get().put(key, value);
    }

    public class P extends HashMap<String, Object>{
        public P put(String key, Object value){
            super.put(key, value);
            return this;
        }
    }
}
