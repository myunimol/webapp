package rocks.teammolise.myunimol.webapp.configuration;

/**
 *
 * @author Vincenzo
 */
public class ConfigurationManagerHandler {
	
	private static String filename;
    
    public static ConfigurationManager getInstance(){
       
        ConfigurationManager confManager = new ConfigurationManager(filename);
              
        return confManager;        
    }
    
    public static void setConfigurationFilename(String pFilename) {
    	filename = pFilename;
    }
}
