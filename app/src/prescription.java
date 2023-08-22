package src;

public class prescription {
    private String email;
    private String imgTag;

    public prescription(String email, String url)
    {
        this.email=email;
        this.imgTag=url;
    }

    public String getEmail()
    {
        return email;
    }

    public String getUrl()
    {
        return imgTag;
    }

}