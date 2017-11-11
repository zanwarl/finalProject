package korea.voc.model;

import java.util.List;

public interface VocDAO {

	
	public int vocWrite ( VocDTO dto);
	public int vocReWrite ( VocDTO dto);
	public int getMyVocTotalCnt (String writer);
	public int getVocTotalCnt ();
	
	public int getNoAnsVocTotalCnt();
	
	public List<VocDTO> myVocList(String writer, int cp, int listSize);
	
	public int vocUpdate( String title, String content, int idx);
	public int vodDel( int idx);
	
	public VocDTO vocCon( int idx);
	public int getVocMaxRef ();
	
	public List<VocDTO>vocList (int cp, int listSize);
	public List<VocDTO>vocNoAnsList (int cp, int listSize);
	
	public int vocTurnUpdate (int ref, int turn );

	
	
}
