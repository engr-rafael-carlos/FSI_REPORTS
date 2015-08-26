package fsi.classes;

import java.util.List;

/**
 * Created by agile_server on 8/10/2015.
 */
public class DataEncoder {
    public static String create_dataset(List list, String data_type, int column) {

        String data = "{\"" + data_type + "\":[";
        for (int ctr = 0; ctr < list.size(); ctr++) {
            if(ctr != 0) {
                data = data + ",";
            }
            data = data + "[";
            for(int col = 0; col < column; col++) {
                if(col!=0) {
                    data = data + ",";
                    ctr++;
                }
                data = data + "\""+list.get(ctr)+"\"";
            }
            data = data + "]";
        }
        data = data + "]}";
        return data;
    }
    public static String create_json_full(List list) {

        String json = "{\"data\": [";
        for (int i=0; i<list.size(); i++) {
            if(i!=0) {
                json = json + ",";
            }
            json = json + "{\"inspector_id\":\""+list.get(i)+"\",";
            i++;
            json = json + "\"inspector_username\":\""+list.get(i)+"\",";
            i++;
            json = json + "\"inspector_name\":\""+list.get(i)+"\",";
            i++;
            json = json + "\"inspector_address\":\""+list.get(i)+"\",";
            i++;
            json = json + "\"inspector_contact\":\""+list.get(i)+"\"}";

        }
        json = json + "]}";
        return json;
    }
}
