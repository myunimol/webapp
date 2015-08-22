package rocks.teammolise.myunimol.webapp.configuration;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
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
    
    public boolean checkAdminPassword(String pPassword) {
    	try {
    		String adminPassword = loadProperties().getProperty("admin");
    		return pPassword.equals(adminPassword);
    	} catch (IOException e) {
    		return false;
    	}
    }

	@Override
	public void allowUser(String pUsername) throws IOException {
		Properties properties = loadProperties();
		
		properties.put("allowed", properties.get("allowed") + ";" + pUsername);
		
		FileOutputStream stream = new FileOutputStream(this.file);
		
		properties.store(stream, "");
		
		stream.close();
	}

	@Override
	public String showConfig() {
		try {
			return new String(Files.readAllBytes(this.file.toPath()), StandardCharsets.UTF_8);
		} catch (IOException e) {
			return "???";
		}
	}

	@Override
	public String getMongoDbUri() throws IOException {
		String mdburi = loadProperties().getProperty("mongodburi");
		return mdburi;
	}
}
