package korea.roomAdd.model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	

	public static List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest req) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	String filepath = req.getSession().getServletContext().getContextPath();
		String path= filepath+"/img/room"; 
    	
		String savePath = req.getSession().getServletContext().getRealPath("/img/room/");

		path = savePath;
		
		
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        String roomidx = (String)map.get("roomidx");
        String requestName = null;
        String idx = null;
        
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
        		
        		multipartFile.transferTo(new File(path+"/"+storedFileName));
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("IS_NEW", "Y");
        		listMap.put("roomidx", roomidx);
        		listMap.put("oname", originalFileName);
        		listMap.put("filename", storedFileName);
        		listMap.put("filesize", multipartFile.getSize());
        		list.add(listMap);
        	}
        	else{
        		requestName = multipartFile.getName();
            	idx = "imgaeidx_"+requestName.substring(requestName.indexOf("_")+1);
            	if(map.containsKey(idx) == true && map.get(idx) != null){
            		listMap = new HashMap<String,Object>();
            		listMap.put("IS_NEW", "N");
            		listMap.put("imgaeidx", map.get(idx));
            		list.add(listMap);
            	}
        	}
        }
		return list;
	}
}
