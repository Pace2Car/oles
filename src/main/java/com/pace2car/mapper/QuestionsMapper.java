package com.pace2car.mapper;

import com.pace2car.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionsMapper {

    int insertShort(FspQuestions questions);

    List<TechCategory> selectTech(Integer courseId);

    int insertRadio(SmdQuestions questions);

    int insertRadioOpt(SmdOptions options);

    int insertCheckBoxOpt(SmdOptions options);

    int insertCheckBox(SmdQuestions questions);

    int insertJudge(SmdQuestions questions);

    int insertProgram(FspQuestions questions);

    List<SmdQuestions> selectBySmdQues(@Param("questions") SmdQuestions questions,
                                 @Param("pageNum") int pageNum,
                                 @Param("pageSize") int pageSize);

    SmdQuestions selectBySmdQuesId(@Param("questions") SmdQuestions questions);

    SmdOptions selectBySmdOpt(Integer questionId);

    List<FspQuestions> selectByFspQues(@Param("questions") FspQuestions questions,
                                       @Param("pageNum")int pageNum,
                                       @Param("pageSize") int pageSize);

    FspAnswer selectByFspOpt(Integer fspId);

    SmdQuestions selectBySmdQuesI(Integer id);

    FspQuestions selectByFspQuesId(@Param("fspQuestions") FspQuestions fspQuestions);

    int updateExam(Examination examination);
    int updateSmdQues(SmdQuestions questions);

    int updateSmdOpt(SmdOptions options);

    FspQuestions selectByFspQuesI(Integer id);

    int updateFspQues(FspQuestions questions);

    int deleteSmdQues(SmdQuestions questions);

    int deleteSmdOpt(Integer id);

    int deleteFspQues(FspQuestions questions);
}
