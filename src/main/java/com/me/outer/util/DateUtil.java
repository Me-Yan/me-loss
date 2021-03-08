package com.me.outer.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 */
public class DateUtil {

    private static Logger logger = LoggerFactory.getLogger(DateUtil.class);
    private static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    public static Date parseDate(String date) {
        logger.debug("Execute Method parseDate...");

        try {
            return dateFormat.parse(date);
        } catch (Exception e) {
            logger.error("格式化日期出现错误", e);
            return null;
        }
    }
}
