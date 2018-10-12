package com.pace2car.mapper;

import com.pace2car.entity.Examination;
import com.pace2car.entity.FspAnswer;
import com.pace2car.entity.OltsScore;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FspAnswerMapper {
    List<FspAnswer> selectAnswerByUser(@Param("fspAnswer") FspAnswer fspAnswer);

    int insertAnswer(FspAnswer answer);

    List<FspAnswer> selectUserInExam(Examination examination);

    void updateStatus(@Param("oltsScore") OltsScore oltsScore);
}
