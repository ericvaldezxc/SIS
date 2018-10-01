package com.example.eric.sis;

/**
 * Created by eric on 29/09/2018.
 */

public class GradesBodyModel {
    private String subjdesc;
    private String subjcode;
    private String grade;
    private String finalgrade;
    private String subcredunit;
    private String section;
    private String fullname;


    public GradesBodyModel( String subjdesc, String subjcode, String grade,String finalgrade, String subcredunit,String section, String fullname) {
        this.subjdesc = subjdesc;
        this.subjcode = subjcode;
        this.grade = grade;
        this.finalgrade = finalgrade;
        this.subcredunit = subcredunit;
        this.section = section;
        this.fullname = fullname;
    }

    public String getSubjdesc() {
        return subjdesc;
    }

    public String getSubjcode() {
        return subjcode;
    }

    public String getGrade() {
        return grade;
    }

    public String getFinalgrade() {
        return finalgrade;
    }

    public String getSubcredunit() {
        return subcredunit;
    }

    public String getSection() {
        return section;
    }

    public String getFullname() {
        return fullname;
    }
}
