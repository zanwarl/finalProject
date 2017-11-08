package food.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import food.model.FoodDAO;
import food.model.FoodDTO;
import food.model.FoodTimeDTO;

@Controller
public class FoodController {

   @Autowired
   private FoodDAO fdao;
   
   @RequestMapping("/food.do")
   public ModelAndView food(){
      
      List<FoodDTO> list = fdao.foodList();
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("list",list);
      mav.setViewName("food/food");
      
      return mav;
   }
   
   @RequestMapping("/addFoodForm.do")
   public ModelAndView addFood(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("food/addFood");
      
      return mav;
   }
   
   @RequestMapping("/addFood.do")
   public ModelAndView addFood(FoodDTO fdto,MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException{

      ModelAndView mav = new ModelAndView();
      fdao.foodAdd(fdto);
       
      String realFolder = "d:/upload2/";
           File dir = new File(realFolder);
           if (!dir.isDirectory()) {
               dir.mkdirs();
        }
           List<MultipartFile> mf = mhsq.getFiles("uploadFile");
           if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
                
           } else {
               for (int i = 0; i < mf.size(); i++) {
                   // 파일 중복명 처리
                   String genId = UUID.randomUUID().toString();
                   // 본래 파일명
                   String oName = mf.get(i).getOriginalFilename();
                    
                   String fimagename = genId + "." + oName;
                   // 저장되는 파일 이름
    
                   String savePath = realFolder + fimagename; // 저장 될 파일 경로
    
                   long fileSize = mf.get(i).getSize(); // 파일 사이즈
    
                   mf.get(i).transferTo(new File(savePath)); // 파일 저장
    
                   fdao.fImageUpload(oName, fimagename, fileSize);
               }
           }
          
         return new ModelAndView("redirect:food.do");
   }
   
   @RequestMapping("/foodContent.do")
   public ModelAndView foodContent(@RequestParam("foodidx")int idx){
      
      FoodDTO fdto = fdao.foodContent(idx);
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("fdto",fdto);
      mav.setViewName("food/foodContent");
       
      return mav;
   }
   
   
    public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) { 
           //파일이 저장될 path 설정 
           // String path = req.getSession().getServletContext().getRealPath("") + "\\resources";    // 웹프로젝트 경로 위치
           String path = req.getSession().getServletContext().getRealPath("/resources/");
           
           System.out.println("path : " + path);
           
           Map returnObject = new HashMap(); 
           try { 
               // MultipartHttpServletRequest 생성 
               MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
               Iterator iter = mhsr.getFileNames(); 
               MultipartFile mfile = null; 
               String fieldName = ""; 
               List resultList = new ArrayList(); 
               
               // 디레토리가 없다면 생성 
               File dir = new File(path); 
               if (!dir.isDirectory()) { 
                   dir.mkdirs(); 
               } 
               
               // 값이 나올때까지 
               while (iter.hasNext()) { 
                   fieldName = (String) iter.next(); // 내용을 가져와서 
                   mfile = mhsr.getFile(fieldName); 
                   String origName; 
                   origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
                   
                   System.out.println("origName: " + origName);
                   // 파일명이 없다면 
                   if ("".equals(origName)) {
                       continue; 
                   } 
                   
                   // 파일 명 변경(uuid로 암호화) 
//                   String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
//                   String saveFileName = getUuid() + ext;
                   String saveFileName = origName;
                   
                   System.out.println("saveFileName : " + saveFileName);
                   
                   // 설정한 path에 파일저장 
                   File serverFile = new File(path + File.separator + saveFileName);
                   mfile.transferTo(serverFile);
                   
                   Map file = new HashMap();
                   file.put("origName", origName); file.put("sfile", serverFile);
                   resultList.add(file);
               }
               
               returnObject.put("files", resultList); 
               returnObject.put("params", mhsr.getParameterMap()); 
               } catch (UnsupportedEncodingException e) { 
                   // TODO Auto-generated catch block 
                   e.printStackTrace(); 
               }catch (IllegalStateException e) { // TODO Auto-generated catch block 
                   e.printStackTrace();
               } catch (IOException e) { // TODO Auto-generated catch block
                   e.printStackTrace();
               }
           
               return null;
       }
       
       //uuid생성
       public static String getUuid() { 
           return UUID.randomUUID().toString().replaceAll("-", "");
   }
       

}


