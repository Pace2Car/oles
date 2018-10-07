package com.pace2car.mapper;

import com.pace2car.entity.TechCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/5 13:26
 */
@Repository
public interface TechCategoryMapper {

    /**
     * @param techCategory
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<TechCategory> selectTechCategorys(@Param("techCategory") TechCategory techCategory,
                                           @Param("pageNum") int pageNum,
                                           @Param("pageSize") int pageSize);

    int insertTechCategory(TechCategory techCategory);

    int updateTechCategory(TechCategory techCategory);

    int deleteTechCategory(TechCategory techCategory);
}
