//Sreelalitha
//This program is used to calculate mean and standard deviation

package com.dao;
import com.bean.DataBean;


public class DataProcessor {
	private String data;
	
	public DataBean calculate(String d)
	{
		DataBean dbean = new DataBean();
		this.data = d; 
		dbean.setMean(mean());
		dbean.setStd(std());
		return dbean;
	}
	
	  public float mean()
	  {
	    String[] tokens = data.split(",");
	    float sum = 0.0F;
	    for(int i=0;i<tokens.length;i++)
	    {
	    	sum+=Integer.parseInt(tokens[i]);
	    }
	     return sum / tokens.length;
	  }
	  
	  
	  public double std()
	    {
		  double sum = 0.0, standardDeviation = 0.0;
		  double length = 10.0;
	
		  String[] tokens = data.split(",");
		    for (String token : tokens) {
			      Double num = Double.parseDouble(token);
			      sum += num;      
		    }

	        double mean = sum/length;
		    for (String token : tokens) {
			      Double num = Double.parseDouble(token);
			      standardDeviation += Math.pow(num - mean, 2);  
		    }

	        return Math.sqrt(standardDeviation/length);
	    }
	

}
