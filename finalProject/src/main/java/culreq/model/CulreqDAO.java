package culreq.model;

import java.util.List;

public interface CulreqDAO {

		public List<CulreqDTO> culreqList();
		public int culreqAdd(CulreqDTO crdto); 
		public CulreqDTO culreqCon2(int idx);
		
}
