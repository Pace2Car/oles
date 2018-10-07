package com.pace2car.service;

import com.pace2car.entity.TechCategory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/5 14:04
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TechCategoryServiceTest {

    @Autowired
    private ITechCategoryService techCategoryService;

    @Test
    public void testSelectTechCategorys() {
        List<TechCategory> techCategoryList = techCategoryService.selectTechCategorys(new TechCategory(null, null, 2), 1, 50);
        for (TechCategory techCategory : techCategoryList) {
            System.out.println(techCategory);
        }
    }
}
