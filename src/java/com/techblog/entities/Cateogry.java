package com.techblog.entities;

public class Cateogry {
    
    private int cid;
    private String cname;
    private String cdescription;

    public Cateogry(int cid, String cname, String cdescription) {
        this.cid = cid;
        this.cname = cname;
        this.cdescription = cdescription;
    }

    public Cateogry(String cname, String cdescription) {
        this.cname = cname;
        this.cdescription = cdescription;
    }

    public Cateogry() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdescription() {
        return cdescription;
    }

    public void setCdescription(String cdescription) {
        this.cdescription = cdescription;
    }
    
    
}
