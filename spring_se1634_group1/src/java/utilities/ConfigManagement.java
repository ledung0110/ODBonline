/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

import dal.ConfigurationDao;
import entities.Configuration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nvash
 */
public class ConfigManagement {
    private static ConfigManagement instance = null;
    Map<String, String> configMap = new HashMap<>();

    private ConfigManagement() {
      init();
    }

    public static ConfigManagement getInstance() {
        if (instance == null) {
            instance = new ConfigManagement();
        }
        return instance;
    }

    // Update map when updating database
    public void updateConfigMap(String key, String value) {
        configMap.put(key, value);
    }

    // Get configuration value
    public String getConfigValue(String key) {
        return configMap.get(key);
    }
    private void init() {
        ConfigurationDao dao= new ConfigurationDao();
        for (Configuration config : dao.getAllConfigList())  {
            configMap.put(config.getKey(), config.getValue());
        }
    }

    public void refresh() {
        configMap.clear();
        init();
    }
}
