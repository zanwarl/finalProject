package culreq.model;

import java.util.List;

public interface CulreqDAO {

		public List <CulreqDTO> culreqList();
		public int culreaAdd(CulreqDTO crdto);
		public CulreqDTO culreqContent(int idx);
		
}
