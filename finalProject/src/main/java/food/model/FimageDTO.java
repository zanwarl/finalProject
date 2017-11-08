package food.model;

public class FimageDTO {
	    
	    private int fimageidx;
		private String oname;
		private String fimagename;
		private int fimagesize;
		private int foodidx;
		
		public FimageDTO(int fimageidx, String oname, String fimagename, int fimagesize, int foodidx) {
			super();
			this.fimageidx = fimageidx;
			this.oname = oname;
			this.fimagename = fimagename;
			this.fimagesize = fimagesize;
			this.foodidx = foodidx;
		}
		
		public int getFimageidx() {
			return fimageidx;
		}
		public void setFimageidx(int fimageidx) {
			this.fimageidx = fimageidx;
		}
		public String getOname() {
			return oname;
		}
		public void setOname(String oname) {
			this.oname = oname;
		}
		public String getFimagename() {
			return fimagename;
		}
		public void setFimagename(String fimagename) {
			this.fimagename = fimagename;
		}
		public int getFimagesize() {
			return fimagesize;
		}
		public void setFimagesize(int fimagesize) {
			this.fimagesize = fimagesize;
		}
		public int getFoodidx() {
			return foodidx;
		}
		public void setFoodidx(int foodidx) {
			this.foodidx = foodidx;
		}
		
		
		
}
