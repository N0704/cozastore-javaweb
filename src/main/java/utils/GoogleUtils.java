package utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.stream.Collectors;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.Users;

public class GoogleUtils {
    private static final String CLIENT_ID = "";
    private static final String CLIENT_SECRET = "";
    private static final String REDIRECT_URI = "";

    public static String getToken(String code) throws IOException {
        String params = "code=" + code
                + "&client_id=" + CLIENT_ID
                + "&client_secret=" + CLIENT_SECRET
                + "&redirect_uri=" + REDIRECT_URI
                + "&grant_type=authorization_code";

        HttpURLConnection conn = (HttpURLConnection) new URL("https://oauth2.googleapis.com/token").openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        OutputStream os = conn.getOutputStream();
        os.write(params.getBytes());
        os.flush();
        os.close();

        InputStream is = conn.getInputStream();
        String response = new BufferedReader(new InputStreamReader(is))
                .lines().collect(Collectors.joining());
        JsonObject json = JsonParser.parseString(response).getAsJsonObject();
        return json.get("access_token").getAsString();
    }

    public static Users getUserInfo(String accessToken) throws IOException {
        URL url = new URL("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken);
        InputStream is = url.openStream();
        String response = new BufferedReader(new InputStreamReader(is))
                .lines().collect(Collectors.joining());
        JsonObject json = JsonParser.parseString(response).getAsJsonObject();

        Users user = new Users();
        user.setEmail(json.get("email").getAsString());
        user.setFullname(json.get("name").getAsString());
        user.setAvatar(json.get("picture").getAsString()); // gợi ý lưu ảnh đại diện
        return user;
    }
}
