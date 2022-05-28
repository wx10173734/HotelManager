package com.lzc.hotelmanager.core.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;

public class Md5Util {
    public static final String SALT = "Book";

    public static String md5(String str, String salt) {
        if (StringUtils.isEmpty(str)) {
            return null;
        } else {
            return new Md5Hash(str, salt).toString();
        }
    }

    public static void main(String args[]) {
        String password = "123456";
//        String password = UUID.randomUUID().toString().replaceAll("-", "");
//        System.out.println(password);
        System.out.println("Md5加密后" + Md5Util.md5(password, Md5Util.SALT));
    }
}
