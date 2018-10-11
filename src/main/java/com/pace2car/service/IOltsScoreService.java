package com.pace2car.service;

import com.pace2car.entity.OltsScore;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/11 20:56
 */
public interface IOltsScoreService {

    List<OltsScore> selectAllScore();

    int updateScore(OltsScore oltsScore);

    int insertScore(OltsScore oltsScore);
}
