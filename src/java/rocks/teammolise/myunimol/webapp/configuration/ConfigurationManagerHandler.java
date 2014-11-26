package it.unimol.mywebapp.configuration;

/**
 *
 * @author Vincenzo
 */
public class ConfigurationManagerHandler {        
    
    public static ConfigurationManager getInstance(){
       
        ConfigurationManager confManager = new ConfigurationManager();
              
        return confManager;        
    }
}
