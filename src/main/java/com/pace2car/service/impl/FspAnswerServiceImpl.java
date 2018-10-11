package com.pace2car.service.impl;


import com.pace2car.controller.ExamManageController;
import com.pace2car.entity.FspAnswer;
import com.pace2car.mapper.FspAnswerMapper;
import com.pace2car.service.IFspAnswerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service("subjectiveAnswerService")
public class FspAnswerServiceImpl implements IFspAnswerService {

    private static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(FspAnswerServiceImpl.class);

    @Autowired(required = false)
    private FspAnswerMapper fspAnswerMapper;


    @Override
    public List<FspAnswer> findSubAnswer(FspAnswer fspAnswer) {
        return fspAnswerMapper.selectAnswer(fspAnswer);
    }

    @Override
    public int insertAnswer(FspAnswer answer,HttpServletRequest request) {
        Map<String,String[]> map = new HashMap<String,String[]>();
        Map<String,String> returnMap = new HashMap<String,String>();
        map = request.getParameterMap();
        Iterator entries = map.entrySet().iterator();
        Map.Entry entry;
        String name ="";
        String value=null;
        while (entries.hasNext()){
            entry=(Map.Entry)entries.next();
            name = (String) entry.getKey();
            Object objvalue = entry.getValue();
            if(objvalue == null){
                value = null;
            }else if(objvalue instanceof String[]){
                /**条件如果成立，objvalue就是一个数组，需要将它转换成为字符串，并拼接上逗号，并吧末尾的逗号去掉*/
                String[] values = (String[]) objvalue;
                for(int i=0;i<values.length;i++){
                    value = values[i]+",";//这里我拼接的是英文的逗号。
                }
                value = value.substring(0,value.length()-1);//截掉最后一个逗号。
            }else{
                value = objvalue.toString();
            }
            returnMap.put(name , value);
        }
        Iterator it = returnMap.keySet().iterator();
        while (it.hasNext()){
            Object key = it.next();
            if(returnMap.get(key) == null || "".equals (((String)returnMap.get(key)).trim())){
                returnMap.put((String) key, null);
            }
        }
        logger.warn(returnMap);
        Set<String> keySet = returnMap.keySet();
        Iterator<String> or = keySet.iterator();
        while (or.hasNext()){
            String key = or.next();
            String values = returnMap.get(key);
                if ("sa_".equals(key.substring(0,3))){
                    String s = new String();
                    s = key.substring(3);
                    answer.setFspId(Integer.valueOf(key.substring(3)));
                    Iterator<String> ok = keySet.iterator();
                    while (ok.hasNext()){
                        String key2 = ok.next();
                        String values2 = returnMap.get(key2);
                        if (("sa"+s+"_answer").equals(key2)){
                            answer.setAnswer(values2);
                        }
                    }
                    fspAnswerMapper.insertAnswer(answer);
            }else if ("p_".equals(key.substring(0,2))){
                String s = new String();
                s = key.substring(2);
                answer.setFspId(Integer.valueOf(key.substring(2)));
                Iterator<String> ok = keySet.iterator();
                while (ok.hasNext()){
                    String key2 = ok.next();
                    String values2 = returnMap.get(key2);
                    if (("p"+s+"_answer").equals(key2)){
                        answer.setAnswer(values2);
                    }
                }
                fspAnswerMapper.insertAnswer(answer);
            }
        }
        return 1;
    }
}


