package korea.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import korea.msg.model.MsgDAO;
import korea.roomAdd.model.ImageDTO;
import korea.roomAdd.model.RoomAddDAO;
import korea.roomAdd.model.RoomAddDTO;
import korea.roomAdd.model.RoomJoinDTO;
import korea.voc.model.VocDAO;

@Controller
public class RoomAddController {

	@Autowired
	private RoomAddDAO radao;
	@Autowired
	private MsgDAO mdao;
	@Autowired
	private VocDAO vdao;

	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView roomList(HttpServletRequest req) {
		
		
		List<RoomJoinDTO> list = radao.roomList();
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("sId");
		
		session.setAttribute("userid", userId);
		mav.addObject("list", list);
		mav.setViewName("room/roomList");
		return mav;
	}

	@RequestMapping(value = "/roomadd.do")
	public ModelAndView roomAdd(HttpServletRequest req, HttpServletResponse resp) {
		
		/*
		 * 
		 * 		HttpSession session = req.getSession(); 
		String writer = (String) session.getAttribute("sId");
		
		
		if ( writer==null || writer.equals("")){
		mav.setViewName("admin/adminMsg");
		mav.addObject("goURL", "main.do");
		mav.addObject("msg", "로그인하세요");
		return mav; 
		}
		
		 * 
		 */
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession(); 
		String writer = (String) session.getAttribute("sId");
		int useridx = mdao.getUserIdx(writer);
		
		
		if ( writer==null || writer.equals("")){
		mav.setViewName("admin/adminMsg");
		mav.addObject("goURL", "main.do");
		mav.addObject("msg", "로그인하세요");
		return mav; 
		}
		else {
			
			mav.addObject("useridx", useridx);
			mav.setViewName("room/roomAddForm");
			return mav;
			
		}
		
		
	}

	/*@RequestMapping(value = "/home.do", method = RequestMethod.POST)
	public ModelAndView roomAdd(HttpServletRequest req, RoomAddDTO rdto) {
		req.getSession().setAttribute("rdto", rdto);
		radao.roomAdd(rdto);
		ModelAndView mav = new ModelAndView("room/fileupload");
		return mav;
	}*/

	@RequestMapping(value = "/roomContent.do")
	public ModelAndView roomContent(@RequestParam("roomidx") int idx,HttpServletRequest req) {
		
		
		/*HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("sId");
		int useridx = mdao.getUserIdx(userId);*/
		RoomAddDTO rdto = radao.roomContent(idx);
		List<ImageDTO> imageList = radao.fileList(idx);
		ModelAndView mav = new ModelAndView();
		
		/*mav.addObject("useridx", useridx);*/
		
		mav.addObject("imageList",imageList);
		mav.addObject("rdto", rdto);
		mav.setViewName("room/roomContent");

		return mav;
	}

	@RequestMapping(value = "/roomUpdate.do", method = RequestMethod.GET)
	public ModelAndView roomUpdateForm(@RequestParam("idx") int idx) {

		ModelAndView mav = new ModelAndView();
		RoomAddDTO rdto = radao.roomUpdateData(idx);

		mav.addObject("rdto", rdto);
		mav.setViewName("room/roomUpdateForm");
		return mav;
	}

	@RequestMapping(value = "/roomUpdate.do", method = RequestMethod.POST)
	public ModelAndView roomUpdate(RoomAddDTO rdto) {
		radao.roomUpdate(rdto);
		ModelAndView mav = new ModelAndView("redirect:home.do");
		return mav;
	}

	@RequestMapping(value = "/roomDelete.do")
	public ModelAndView roomDelete(@RequestParam("idx") int idx) {
		radao.roomDelete(idx);
		ModelAndView mav = new ModelAndView("redirect:home.do");
		return mav;
	}
	
	
	@RequestMapping(value = "/imageUploadForm.do")
	public ModelAndView rimageForm(HttpServletRequest req, RoomAddDTO rdto){
		req.getSession().setAttribute("rdto", rdto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("room/fileupload");
		return mav;
	}
	
	@RequestMapping(value= "/imageUpdate.do",method = RequestMethod.GET)
	public ModelAndView rimageUpdateForm(HttpServletRequest req,@RequestParam("idx") int idx){
		ModelAndView mav = new ModelAndView();
		List<ImageDTO> imageList = radao.fileList(idx);
		mav.addObject("idx",idx);
		mav.addObject("list",imageList);
		mav.setViewName("room/fileUpdate");
		return mav;
	}
	
	@RequestMapping(value= "/imageUpdate.do",method = RequestMethod.POST)
		public ModelAndView rimageUpdate(@RequestParam Map<String, Object> map, HttpServletRequest req) throws Exception{
		
		
		ModelAndView mav = new ModelAndView("redirect:roomContent.do");
		radao.updateFile(map, req);
		
		mav.addObject("roomidx", map.get("roomidx"));
		
		return mav;
	}
	
	@RequestMapping(value = "/imageUpload.do")
	public ModelAndView rimage(HttpServletRequest req, MultipartHttpServletRequest mhsq)
			throws IllegalStateException, IOException {
		
		RoomAddDTO rdto = (RoomAddDTO) req.getSession().getAttribute("rdto");
		
		String filepath = req.getSession().getServletContext().getContextPath();
		String path= filepath+"/img/room"; 
		
		//////////////////////////////////////////////
		String savePath = req.getSession().getServletContext().getRealPath("/img/room/");
		System.out.println("savepath : " + savePath);
		
		path = savePath;
		
		System.out.println("path : " + path);
	    //////////////////////////////////////////
		
		
		radao.roomAdd(rdto);
		int roomidx = rdto.getRoomidx();
		Iterator<String> iterator = mhsq.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		Map<String, Object> listMap = null;

		File file = new File(path);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = mhsq.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

				
				file = new File(path+"/"+storedFileName);
				
				System.out.println("절대경로 : " + file.getAbsolutePath());
				
				System.out.println("저장: " + storedFileName);
				req.getSession().setAttribute("file", file);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("roomidx", roomidx);
				listMap.put("oname", originalFileName);
				listMap.put("filename", storedFileName);
				listMap.put("filesize", multipartFile.getSize());
			
				radao.fileupload(listMap);
			}
		}
		return new ModelAndView("redirect:home.do");
	}
}
