package src;

public class Apptdata {
    private int a_id;
    private int s_id;
    private String sname;
    private String dname;
    private String adate;
    private String atime;
    private String toggle;      // s for student booked, and c for cancelled by doctor
    private String mail;

    public Apptdata(int id, int s_id, String s_name, String d_name, String appt_date, String appt_time, String toggle, String mail)
    {
        a_id=id;
        this.s_id=s_id;
        sname=s_name;
        dname=d_name;
        adate=appt_date;
        atime=appt_time;
        this.toggle=toggle;
        this.mail=mail;
    }

    public int getAid()
    {
        return a_id;
    }

    public int getSid()
    {
        return s_id;
    }

    public String getSname()
    {
        return sname;
    }

    public String getDname()
    {
        return dname;
    }

    public String getAdate()
    {
        return adate;
    }

    public String getAtime()
    {
        return atime;
    }

    public String getToggle()
    {
        return toggle;
    }

    public String getMail()
    {
        return mail;
    }


}
