package korea.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.admin.model.AdminDAO;
import korea.data.model.DataDAO;
import korea.data.model.DataDAOImple;
import korea.data.model.DataDTO;
import korea.roomreq.model.RoomreqDAO;
import korea.roomreq.model.RoomreqDTO;



@Controller
public class DataController {

	@Autowired
	private RoomreqDAO rdao;
	
	
	
	
/*	@Autowired
	DataDAO dao ; */
/*	

	@RequestMapping(value="", method= RequestMethod.GET)
	public String get_Data_List(@RequestParam(defaultValue="all") String Target_Option){
		
		// 일단 처음엔 all 이겠고... Hosting id -> 가지고 온다.
		
		List<DataDTO> list = dao.Get_DataControll_List(Target_Option);
		
		
		
		return "admin/adminLoginFm";
	}

*/
	@RequestMapping (value="/dataControll.do" , method= RequestMethod.GET)
	public ModelAndView dataControll(){
		
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date totay = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy");
		int now = Integer.parseInt(sd.format(totay)); // 2017
		int man0 = 0 , man1 = 0 ,man2 = 0 ,man3 = 0 , woman0= 0 , woman1 =0 , woman2 = 0 , woman3 = 0;
		int mantotal = 0 , womantotal=0;
		int month1=0,month2=0,month3=0,month4=0,month5=0,month6=0,month7=0,
				month8=0,month9=0,month10=0,month11=0,month12=0,monthtotal = 0;
		
		List<DataDTO> list = rdao.Get_DataControll_getList();
		List<RoomreqDTO> listt=rdao.total2();
		mv.addObject("listt",listt);
		for( DataDTO dto : list)
		{
			if(!dto.getCheckindate().equals("-1"))
			{
				System.out.println("chcekin = " + dto.getCheckindate());
				String[] checkin = dto.getCheckindate().split("/");
				int month = Integer.parseInt(checkin[1]); 
				
				monthtotal += dto.getTotal_pay()/10000;
				switch (month) {
				case 1:
					month1 += dto.getTotal_pay()/10000;
					break;
				case 2:
					month2 += dto.getTotal_pay()/10000;
					break;
				case 3:
					month3 += dto.getTotal_pay()/10000;
					break;
				case 4:
					month4 += dto.getTotal_pay()/10000;
					break;
				case 5:
					month5 += dto.getTotal_pay()/10000;
					break;
				case 6:
					month6 += dto.getTotal_pay()/10000;
					break;
				case 7:
					month7 += dto.getTotal_pay()/10000;
					break;
				case 8:
					month8 += dto.getTotal_pay()/10000;
					break;
				case 9:
					month9 += dto.getTotal_pay()/10000;
					break;
				case 10:
					month10 += dto.getTotal_pay()/10000;
					break;
				case 11:
					month11 += dto.getTotal_pay()/10000;
					break;
				default:
					month12 += dto.getTotal_pay()/10000;
					break;
				}
			}
			if(dto.getMember_sex().equals("1")){   // 남자
				mantotal += 1;
				int birth = Integer.parseInt(dto.getMember_birth().substring(0 , 2));
				if(birth > Integer.parseInt(String.valueOf(now).substring(2 , 4)))
				{
					birth += 1900;
				}else{
					birth += 2000;
				}
				int current_age = ( ( now - birth ) / 10 );	
				//System.out.println("bith = " + birth + "    "+ current_age);
				switch (current_age) {
				case 0: case 1: 	
					man0 += 1;
					break;
				case 2 : 
					man1 += 1;
					break;
				case 3 :
					man2 += 1;
					break;
				default:
					man3 += 1;
					break;
				}
			}else if(dto.getMember_sex().equals("2")){
				womantotal+= 1;
				int birth = Integer.parseInt(dto.getMember_birth().substring(0 , 2));
				if(birth > Integer.parseInt(String.valueOf(now).substring(2 , 4)))
				{
					birth += 1900;
				}else{
					birth += 2000;
				}
				int current_age = ( ( now - birth ) / 10 );	
				/*System.out.println("bith = " + birth + "    "+ current_age);*/

				switch (current_age) {
				case 0: case 1: 	
					woman0 += 1;
					break;
				case 2 : 
					woman1 += 1;
					break;
				case 3 :
					woman2 += 1;
					break;
				default:
					woman3 += 1;
					break;
				}
				
				
			}
		}
		map.put("man0", man0);
		map.put("man1", man1);
		map.put("man2", man2);
		map.put("man3", man3);
		map.put("mantotal", mantotal);		// 토탈 통계
			
		map.put("woman0", woman0);
		map.put("woman1", woman1);
		map.put("woman2", woman2);
		map.put("woman3", woman3);
		map.put("womantotal", womantotal);		// 토탈 통계
		
		map.put("month1", month1);
		map.put("month2", month2);
		map.put("month3", month3);
		map.put("month4", month4);
		map.put("month5", month5);
		map.put("month6", month6);
		map.put("month7", month7);
		map.put("month8", month8);
		map.put("month9", month9);
		map.put("month10", month10);
		map.put("month11", month11);
		map.put("month12", month12);
		map.put("monthtotal", monthtotal);

		
		mv.addObject("map" , map);
		mv.setViewName("data/Dataview");
		
		return mv;
		
	}
	
	
}
