package food.model;

import java.util.List;

public interface FoodDAO {
	
	public int foodAdd(FoodDTO fdto);
	public List<FoodDTO> foodList(); 
	public FoodDTO foodContent(int idx);
}
