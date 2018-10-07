package com.pace2car.service;

import com.pace2car.entity.TechCategory;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/5 13:33
 */
public interface ITechCategoryService {

    /**
     * @param techCategory 查询条件
     * @param pageNum      页码
     * @param pageSize     条数
     * @return
     */
    List<TechCategory> selectTechCategorys(TechCategory techCategory, int pageNum, int pageSize);

    int insertTechCategory(TechCategory techCategory);

    int updateTechCategory(TechCategory techCategory);

    int deleteTechCategory(TechCategory techCategory);

}
