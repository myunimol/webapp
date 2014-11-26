package it.unimol.mywebapp.configuration;

import java.io.IOException;

/**
 *
 * @author Vincenzo
 */
public interface ConfigurationManagerInterface {   

        public String getWebAppURL() throws IOException;
            
        public String getWebServicesRoot() throws IOException;
        
        public String getToken() throws IOException;    
}