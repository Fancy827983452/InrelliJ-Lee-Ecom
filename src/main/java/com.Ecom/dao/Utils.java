package com.Ecom.dao;

import java.util.Arrays;
import java.util.List;

public class Utils {
    public static boolean isAllTrue(Boolean[] bools)
    {
        List<Boolean> boolList = Arrays.asList(bools);
        if (boolList.contains(false))
        {
            return false;
        }

        return true;
    }
}
