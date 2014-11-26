package it.unimol.mywebapp.configuration;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Vincenzo
 */
public class ConfigurationManager implements ConfigurationManagerInterface{      
    
    public Properties loadProperties() throws IOException {
        
        Properties properties = new Properties();

        /**
         * Carico il file config.properties in un File con il suo absolute path **TO FIX**
         */
        File file = new File("C:\\Users\\Vincenzo\\Documents\\NetBeansProjects\\MyUnimolWebApp\\src\\java\\it\\unimol\\mywebapp\\configuration\\resources\\config.properties");

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
}
