package com.heimdall.dao.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author michael
 *
 */
public class IDListWrapper{

	/**
	 * 
	 */

	private List<String> ids;
	
	public IDListWrapper(){
		ids = new ArrayList<String>();
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}
	
    public void add(String string) {
        this.ids.add(string);
    }

}
