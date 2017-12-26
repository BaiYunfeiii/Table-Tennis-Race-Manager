package edu.gdut.imis.byf3114004859.common.utils;

import java.util.HashMap;
/**
 * Created by Yunfei on 2017/12/26.
 */
public class Param extends HashMap<String, Object>{

    public static Param build(String key, Object value) {
        Param param = new Param();
        return param.put(key, value);
    }

    public Param put(String key, Object value){
        super.put(key, value);
        return this;
    }

}
