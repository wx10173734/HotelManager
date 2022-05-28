package com.lzc.hotelmanager.core.common.exception;

import com.lzc.hotelmanager.core.common.page.JsonData;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice
public class AjaxExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public JsonData defaultErrorHandler(Exception e) {

        e.printStackTrace();
        return JsonData.fail(e.getMessage());
    }


    /**
     * 注解参数校验 全局异常补获
     *
     * @param ex
     * @return
     */
    @ExceptionHandler(BindException.class)
    public JsonData handleBindException(BindException ex) {
        //校验 除了 requestbody 注解方式的参数校验 对应的 bindingresult 为 BeanPropertyBindingResult
        FieldError fieldError = ex.getBindingResult().getFieldError();
        return JsonData.fail(fieldError.getDefaultMessage());
    }

}
