package rocks.teammolise.myunimol.webapp.configuration;

import java.io.IOException;

/**
 *
 * @author Vincenzo
 */
public interface ConfigurationManagerInterface {   

        public String getWebAppURL() throws IOException;
            
        public String getWebServicesRoot() throws IOException;
        
        public String getToken() throws IOException;    
        
        public boolean isAllowed(String pUsername) throws IOException;
}