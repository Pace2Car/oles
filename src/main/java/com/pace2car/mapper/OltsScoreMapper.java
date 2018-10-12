package com.pace2car.mapper;

import com.pace2car.entity.OltsScore;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/11 20:50
 */
@Repository
public interface OltsScoreMapper {

    List<OltsScore> selectAllScore();

    int updateScore(@Param("oltsScore") OltsScore oltsScore);

    int insertScore(OltsScore oltsScore);
}
