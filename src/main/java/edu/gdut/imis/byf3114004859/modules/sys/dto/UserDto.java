package edu.gdut.imis.byf3114004859.modules.sys.dto;

import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;

/**
 * Created by Yunfei on 2017/12/26.
 */
public class UserDto extends SysUserEntity{

    private String captcha;

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
