package com.pace2car.controller;


import com.pace2car.entity.*;
import com.pace2car.service.IExaminationService;
import com.pace2car.service.IFspAnswerService;
import com.pace2car.service.IQuestionsService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/examManage")
public class ExamManageController {

    @Autowired(required = false)
    private IFspAnswerService subjectiveAnswerService;

    @Autowired(required = false)
    private IExaminationService examinationPaperService;

    @Autowired(required = false)
    private IQuestionsService questionsService;

    @Autowired(required = false)
    private IExaminationService examinationService;

    @RequestMapping("/searchExamination")
    public String searchExamination(Examination examination, ModelMap modelMap, HttpSession session) {
        List<Examination> examinations = examinationPaperService.selectAllExamination();
        if (examination != null && examination.getExamNo() != null) {
            Examination oldExamination = examinationPaperService.selectExaminationByExamNo(examination);
            modelMap.addAttribute("oldExamination", oldExamination);
            return "updateExamination";
        }
        modelMap.addAttribute("examinations", examinations);
        session.setAttribute("examination", examination);
        return "examinationList";
    }

    @RequestMapping("/updateExamination")
    public void updateExamination(Examination examination, HttpServletResponse response) {
        try {
            if (examinationPaperService.updateExamination(examination) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/insertExamination")
    public void insertExamination(Examination examination, HttpServletResponse response) {
        try {
            if (examinationPaperService.insertExamination(examination) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteExamination")
    public void deleteExamination(Examination examination, HttpServletResponse response) {
        try {
            if (examinationPaperService.deleteExamination(examination) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/subjectiveList")
    public String selectSubjective(ModelMap modelMap, FspAnswer fspAnswer) {
        List<FspAnswer> answer = subjectiveAnswerService.findSubAnswer(fspAnswer);
        String examNo = answer.get(0).getExamNo();
        modelMap.addAttribute("examNo", examNo);
        modelMap.addAttribute("answer", answer);
        return "subjectiveRead";
    }

    @RequestMapping("/examinationPaper")
    public String selectPaper(ModelMap modelMap, SmdOptions options) {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Examination examination = examinationPaperService.selectCurrentExamination();

        List<SmdQuestions> sq = new ArrayList<>();

        List<FspQuestions> fq = new ArrayList<>();

        String singleIds = examination.getSingleId();
        String[] sglsId = singleIds.split(",");

        String multipleIds = examination.getMultipleId();
        String[] mtpsId = multipleIds.split(",");

        String trueFalseId = examination.getTrueFalseId();
        String[] tfId = trueFalseId.split(",");

        String simpleAnwserId = examination.getSimpleAnwserId();
        String[] saId = simpleAnwserId.split(",");

        String programId = examination.getProgramId();
        String[] pgId = programId.split(",");

        int x = 0;
        for (String s : sglsId) {
            Integer i = Integer.valueOf(s);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (x > 0) {
                sq.get(x).setQuestionType(0);
            }
            x += 1;
        }

        int y = x;
        for (String m : mtpsId) {
            Integer i = Integer.valueOf(m);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (y > x) {
                sq.get(y).setQuestionType(-1);
            }
            y += 1;
        }

        int m = y;
        for (String t : tfId) {
            Integer i = Integer.valueOf(t);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (m > y) {
                sq.get(m).setQuestionType(-2);
            }
            m += 1;
        }

        int n = 0;
        for (String sa : saId) {
            Integer i = Integer.valueOf(sa);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            if (n > 0) {
                fq.get(n).setQuestionType(-3);
            }
            n += 1;
        }

        int l = n;
        for (String p : pgId) {
            Integer i = Integer.valueOf(p);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            if (l > n) {
                fq.get(l).setQuestionType(-4);
            }
            l += 1;
        }

        for (SmdQuestions question : sq) {
            options.setQuestionId(question.getId());
            SmdOptions details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(question.getId(), details);
        }

        modelMap.addAttribute("op", optList);
        modelMap.addAttribute("sq", sq);
        modelMap.addAttribute("fq", fq);
        modelMap.addAttribute("examination", examination);
        return "examinationPaper";
    }

    @RequestMapping("/maintainExaminationPaper")
    public String maintainExaminationPaper(ModelMap modelMap, SmdOptions options, Examination examination, HttpServletResponse response) throws IOException {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Examination e = examinationPaperService.selectExaminationByExamNo(examination);

        List<SmdQuestions> sq = new ArrayList<>();

        List<FspQuestions> fq = new ArrayList<>();

        String singleIds = e.getSingleId();
        String[] sglsId = singleIds.split(",");

        String multipleIds = e.getMultipleId();
        String[] mtpsId = multipleIds.split(",");

        String trueFalseId = e.getTrueFalseId();
        String[] tfId = trueFalseId.split(",");

        String simpleAnwserId = e.getSimpleAnwserId();
        String[] saId = simpleAnwserId.split(",");

        String programId = e.getProgramId();
        String[] pgId = programId.split(",");

        int x = 0;
        for (String s : sglsId) {
            Integer i = Integer.valueOf(s);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (x > 0) {
                sq.get(x).setQuestionType(0);
            }
            x += 1;
        }

        int y = x;
        for (String m : mtpsId) {
            Integer i = Integer.valueOf(m);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (y > x) {
                sq.get(y).setQuestionType(-1);
            }
            y += 1;
        }

        int m = y;
        for (String t : tfId) {
            Integer i = Integer.valueOf(t);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (m > y) {
                sq.get(m).setQuestionType(-2);
            }
            m += 1;
        }

        int n = 0;
        for (String sa : saId) {
            Integer i = Integer.valueOf(sa);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            if (n > 0) {
                fq.get(n).setQuestionType(-3);
            }
            n += 1;
        }

        int l = n;
        for (String p : pgId) {
            Integer i = Integer.valueOf(p);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            if (l > n) {
                fq.get(l).setQuestionType(-4);
            }
            l += 1;
        }

        for (SmdQuestions question : sq) {
            options.setQuestionId(question.getId());
            SmdOptions details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(question.getId(), details);
        }
        List sId = new ArrayList();
        List<SmdQuestions> sIds = examinationPaperService.selectSmdIdByQuestionType(1);
        List<String> smdAll = new ArrayList();
        String chosenSingleId = e.getSingleId();
        List<String> result = Arrays.asList(chosenSingleId.split(","));
        for (SmdQuestions s : sIds) {
            smdAll.add(String.valueOf(s.getId()));
        }
        for (String sa : smdAll) {
            if (!result.contains(sa)) {
                sId.add(sa + "、" + examinationPaperService.selectSmdQuestionById(Integer.valueOf(sa)));
            }
        }

        List mId = new ArrayList();
        List<SmdQuestions> mIds = examinationPaperService.selectSmdIdByQuestionType(2);
        List<String> smdAll2 = new ArrayList();
        String chosenMId = e.getMultipleId();
        List<String> result2 = Arrays.asList(chosenMId.split(","));
        for (SmdQuestions s : mIds) {
            smdAll2.add(String.valueOf(s.getId()));
        }
        for (String sa : smdAll2) {
            if (!result2.contains(sa)) {
                mId.add(sa + "、" + examinationPaperService.selectSmdQuestionById(Integer.valueOf(sa)));
            }
        }
        List tId = new ArrayList();
        List<SmdQuestions> tIds = examinationPaperService.selectSmdIdByQuestionType(3);
        List<String> smdAll3 = new ArrayList();
        String chosenTId = e.getTrueFalseId();
        List<String> result3 = Arrays.asList(chosenTId.split(","));
        for (SmdQuestions s : tIds) {
            smdAll3.add(String.valueOf(s.getId()));
        }
        for (String sa : smdAll3) {
            if (!result3.contains(sa)) {
                tId.add(sa + "、" + examinationPaperService.selectSmdQuestionById(Integer.valueOf(sa)));
            }
        }

        List sAnswerId = new ArrayList();
        List<FspQuestions> saIds = examinationPaperService.selectFspIdByQuestionType(5);
        List<String> smdAll4 = new ArrayList();
        String chosenSaId = e.getSimpleAnwserId();
        List<String> result4 = Arrays.asList(chosenSaId.split(","));
        for (FspQuestions s : saIds) {
            smdAll4.add(String.valueOf(s.getId()));
        }
        for (String sa : smdAll4) {
            if (!result4.contains(sa)) {
                sAnswerId.add(sa + "、" + examinationPaperService.selectFspQuestionById(Integer.valueOf(sa)));
            }
        }

        List pId = new ArrayList();
        List<FspQuestions> pIds = examinationPaperService.selectFspIdByQuestionType(6);
        List<String> smdAll5 = new ArrayList();
        String chosenpId = e.getProgramId();
        List<String> result5 = Arrays.asList(chosenpId.split(","));
        for (FspQuestions s : pIds) {
            smdAll5.add(String.valueOf(s.getId()));
        }
        for (String sa : smdAll5) {
            if (!result5.contains(sa)) {
                pId.add(sa + "、" + examinationPaperService.selectFspQuestionById(Integer.valueOf(sa)));
            }
        }


        modelMap.addAttribute("op", optList);
        modelMap.addAttribute("sq", sq);
        modelMap.addAttribute("fq", fq);
        modelMap.addAttribute("examination", e);
        modelMap.addAttribute("s", sId);
        modelMap.addAttribute("m", mId);
        modelMap.addAttribute("t", tId);
        modelMap.addAttribute("san", sAnswerId);
        modelMap.addAttribute("p", pId);
        return "examinationMaintain";
    }

    @RequestMapping("/maintain")
    public String maintainExam(ModelMap modelMap) {
        List<Examination> list = examinationPaperService.selectAllExamination();
        modelMap.addAttribute("list", list);
        return "examinationMaintainMain";
    }

    @RequestMapping("deleteExam")
    public void deleteExamById(ModelMap modelMap, SmdQuestions smdQuestions, Examination examination, FspQuestions fspQuestions,HttpServletResponse response) {
        if (smdQuestions.getQuestionType()==1 || smdQuestions.getQuestionType()==0){
            Examination examination1 = examinationPaperService.selectExaminationByExamNo(examination);
            String id = examination.getSingleId();

            List<String> sId = new ArrayList();
            List<String> smdAll = new ArrayList();
            String[] split = examination1.getSingleId().split(",");
            for (String s : split) {
                smdAll.add(s);
            }
            for (String sa : smdAll) {
                if (!id.equals(sa)) {
                    sId.add(sa);
                }
            }
            StringBuffer sb = new StringBuffer();
            if (sId != null) {
                for (String s : sId) {
                    sb.append(s + ",");
                }
            }
            sb.deleteCharAt(sb.length() - 1);

            Examination ex = examinationService.selectExaminationByExamNo(examination);
            ex.setSingleId(sb.toString());
            try {
                if (questionsService.updateExam(ex) > 0) {
                    response.getWriter().write("{\"actionFlag\": true}");
                } else {
                    response.getWriter().write("{\"actionFlag\": false}");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (smdQuestions.getQuestionType()==2 || smdQuestions.getQuestionType()==-1){
            Examination examination1 = examinationPaperService.selectExaminationByExamNo(examination);
            String id = examination.getMultipleId();

            List<String> sId = new ArrayList();
            List<String> smdAll = new ArrayList();
            String[] split = examination1.getMultipleId().split(",");
            for (String s : split) {
                smdAll.add(s);
            }
            for (String sa : smdAll) {
                if (!id.equals(sa)) {
                    sId.add(sa);
                }
            }
            StringBuffer sb = new StringBuffer();
            if (sId != null) {
                for (String s : sId) {
                    sb.append(s + ",");
                }
            }
            sb.deleteCharAt(sb.length() - 1);

            Examination ex = examinationService.selectExaminationByExamNo(examination);
            ex.setMultipleId(sb.toString());
            try {
                if (questionsService.updateExam(ex) > 0) {
                    response.getWriter().write("{\"actionFlag\": true}");
                } else {
                    response.getWriter().write("{\"actionFlag\": false}");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (smdQuestions.getQuestionType()==3 || smdQuestions.getQuestionType()==-2){
            Examination examination1 = examinationPaperService.selectExaminationByExamNo(examination);
            String id = examination.getTrueFalseId();

            List<String> sId = new ArrayList();
            List<String> smdAll = new ArrayList();
            String[] split = examination1.getMultipleId().split(",");
            for (String s : split) {
                smdAll.add(s);
            }
            for (String sa : smdAll) {
                if (!id.equals(sa)) {
                    sId.add(sa);
                }
            }
            StringBuffer sb = new StringBuffer();
            if (sId != null) {
                for (String s : sId) {
                    sb.append(s + ",");
                }
            }
            sb.deleteCharAt(sb.length() - 1);

            Examination ex = examinationService.selectExaminationByExamNo(examination);
            ex.setTrueFalseId(sb.toString());
            try {
                if (questionsService.updateExam(ex) > 0) {
                    response.getWriter().write("{\"actionFlag\": true}");
                } else {
                    response.getWriter().write("{\"actionFlag\": false}");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (fspQuestions.getQuestionType()==5 || fspQuestions.getQuestionType()==-3){
            Examination examination1 = examinationPaperService.selectExaminationByExamNo(examination);
            String id = examination.getSimpleAnwserId();

            List<String> sId = new ArrayList();
            List<String> smdAll = new ArrayList();
            String[] split = examination1.getSimpleAnwserId().split(",");
            for (String s : split) {
                smdAll.add(s);
            }
            for (String sa : smdAll) {
                if (!id.equals(sa)) {
                    sId.add(sa);
                }
            }
            StringBuffer sb = new StringBuffer();
            if (sId != null) {
                for (String s : sId) {
                    sb.append(s + ",");
                }
            }
            sb.deleteCharAt(sb.length() - 1);

            Examination ex = examinationService.selectExaminationByExamNo(examination);
            ex.setSimpleAnwserId(sb.toString());
            try {
                if (questionsService.updateExam(ex) > 0) {
                    response.getWriter().write("{\"actionFlag\": true}");
                } else {
                    response.getWriter().write("{\"actionFlag\": false}");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (fspQuestions.getQuestionType()==6 || fspQuestions.getQuestionType()==-4){
            Examination examination1 = examinationPaperService.selectExaminationByExamNo(examination);
            String id = examination.getSimpleAnwserId();

            List<String> sId = new ArrayList();
            List<String> smdAll = new ArrayList();
            String[] split = examination1.getProgramId().split(",");
            for (String s : split) {
                smdAll.add(s);
            }
            for (String sa : smdAll) {
                if (!id.equals(sa)) {
                    sId.add(sa);
                }
            }
            StringBuffer sb = new StringBuffer();
            if (sId != null) {
                for (String s : sId) {
                    sb.append(s + ",");
                }
            }
            sb.deleteCharAt(sb.length() - 1);

            Examination ex = examinationService.selectExaminationByExamNo(examination);
            ex.setProgramId(sb.toString());
            try {
                if (questionsService.updateExam(ex) > 0) {
                    response.getWriter().write("{\"actionFlag\": true}");
                } else {
                    response.getWriter().write("{\"actionFlag\": false}");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
