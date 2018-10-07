package com.pace2car.service.impl;

import com.github.pagehelper.PageHelper;
import com.pace2car.entity.TechCategory;
import com.pace2car.mapper.TechCategoryMapper;
import com.pace2car.service.ITechCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/5 13:35
 */
@Service("techCateGoryService")
public class TechCategoryServiceImpl implements ITechCategoryService {

    @Resource
    private TechCategoryMapper techCategoryMapper;

    @Override
    public List<TechCategory> selectTechCategorys(TechCategory techCategory) {
        return techCategoryMapper.selectTechCategorys(techCategory);
    }

    @Override
    public int insertTechCategory(TechCategory techCategory) {
        return techCategoryMapper.insertTechCategory(techCategory);
    }

    @Override
    public int updateTechCategory(TechCategory techCategory) {
        return techCategoryMapper.updateTechCategory(techCategory);
    }

    @Override
    public int deleteTechCategory(TechCategory techCategory) {
        return techCategoryMapper.deleteTechCategory(techCategory);
    }

}
