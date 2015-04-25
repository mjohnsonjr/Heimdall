package com.heimdall.dao.model;

import java.util.HashMap;
import java.util.Map;
/**
 * 
 * @author michael
 *
 */
public class IDMapWrapper {


	private Map<String, String> ids;
		
	public IDMapWrapper(){
		ids = new HashMap<String, String>();
	}

	public Map<String, String> getIds() {
		return ids;
	}
		
	public void setIds(Map<String, String> ids) {
		this.ids = ids;
	}
	
    public void put(String string, String bool) {
        this.ids.put(string, bool);
    }

}
