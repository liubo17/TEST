package com.shxt.mannger.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Pager {
	/** 当前页 默认值为1*/
	private int pageNow = 1;
	/**每页现显示的条数 默认值为2*/
	private int pageSize = 5;
	/**总记录数*/
	private int totalCount;
	/**总页数*/
	private int totalpages;
	private int offset;//(pageNow-1)*pageSize
	private List<?> datas;
	/** 保存查詢的條件 按日期查询的那个*/
	private Map<String,Object> query = new HashMap<String,Object>();

	public int getPageNow() {
		return this.pageNow;
	}
	public void setPageNow( int pageNow ) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return this.pageSize;
	}
	public void setPageSize( int pageSize ) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return this.totalCount;
	}
	public void setTotalCount( int totalCount ) {
		this.totalCount = totalCount;
	}
	public int getTotalpages() {
		int flag = this.totalCount%this.pageSize;
		this.totalpages = flag==0?this.totalCount/this.pageSize:this.totalCount/this.pageSize+1;
		return this.totalpages;
	}
	public void setTotalpages( int totalpages ) {
		this.totalpages = totalpages;
	}
	public int getOffset() {
		this.offset = (this.pageNow-1)*this.pageSize;
		return this.offset;
	}
	public void setOffset( int offset ) {
		this.offset = offset;
	}
	public List<?> getDatas() {
		return this.datas;
	}
	public void setDatas( List<?> datas ) {
		this.datas = datas;
	}
	public Map<String, Object> getQuery() {
		return this.query;
	}
	public void setQuery( Map<String, Object> query ) {
		this.query = query;
	}
	@Override
	public String toString() {
		return "Pager [pageNow=" + this.pageNow + ", pageSize=" + this.pageSize + ", totalCount=" + this.totalCount
				+ ", totalpages=" + this.totalpages + ", offset=" + this.offset + ", datas=" + this.datas + ", query="
				+ this.query + "]";
	}


}
