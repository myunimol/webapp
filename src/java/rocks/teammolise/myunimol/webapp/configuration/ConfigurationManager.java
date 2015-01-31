package rocks.teammolise.myunimol.webapp.configuration;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Vincenzo
 */
public class ConfigurationManager implements ConfigurationManagerInterface{  
	private File file;
	
	public ConfigurationManager(String pFilename) {
		this.file = new File(pFilename);
	}
    
    public Properties loadProperties() throws IOException {
        
        Properties properties = new Properties();

        /**
         * Carico il file config.properties in un File con il suo absolute path **TO FIX**
         */

        FileInputStream input = new FileInputStream(file);
        
        properties.load(input);
        
        input.close();
        
        return properties;
    }
   
    @Override
    public String getWebAppURL() throws IOException {
 
      String URL = loadProperties().getProperty("URL");
        
      return URL;  
    }

    @Override
    public String getWebServicesRoot() throws IOException {
       
      String root = loadProperties().getProperty("root");
             
      return root;       
    }

    @Override
    public String getToken() throws IOException {
             
        String token = loadProperties().getProperty("token");
              
        return token;        
    }
    
    @Override
    public boolean isAllowed(String pUsername) throws IOException {
    	String betatest = loadProperties().getProperty("betatest");
    	
    	if (!betatest.equals("true"))
    		return true;
    	
    	String allowedsStringList = loadProperties().getProperty("allowed");
    	String[] alloweds = allowedsStringList.split(";");
    	for (String allowed : alloweds) {
    		if (pUsername.equals(allowed))
    			return true;
    	}
    	
    	return false;
    }
}
