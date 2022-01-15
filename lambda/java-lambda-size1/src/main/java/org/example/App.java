package org.example;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
public class App implements RequestHandler {

    @Override
    public Object handleRequest(Object o, Context context) {
        System.out.println("begin fac");
        long result = 1;
        for(int i=1; i<=10001; i++) {
            result *= i;
        }
        System.out.println("end");
        return "fac";
    }




}
