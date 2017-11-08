package food.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface FoodDAO {
	
	public int foodAdd(FoodDTO fdto);
	public List<FoodDTO> foodList(); 
	public FoodDTO foodContent(int idx);

	public void fImageUpload(String oName,String fimagename,long fileSize);


	public List<FoodTimeDTO> foodTime(int fidx);
	public List<FoodTimeDTO> foodList(int fidx);

}
