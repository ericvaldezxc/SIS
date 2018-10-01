package com.example.eric.sis;

/**
 * Created by eric on 27/09/2018.
 */

public class ScheduleModel {
    private String subjcode;
    private String subjdesc;
    private String subjsched;

    public ScheduleModel( String subjcode, String subjdesc, String subjsched) {
        this.subjcode = subjcode;
        this.subjdesc = subjdesc;
        this.subjsched = subjsched;
    }

    public String getSubjsched() {
        return subjsched;
    }

    public String getSubjdesc() {
        return subjdesc;
    }

    public String getSubjcode() {
        return subjcode;
    }
}
