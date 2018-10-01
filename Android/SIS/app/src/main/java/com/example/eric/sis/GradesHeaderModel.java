package com.example.eric.sis;

/**
 * Created by eric on 29/09/2018.
 */

public class GradesHeaderModel {
    private String acadyear;
    private String course;
    private String sem;

    public GradesHeaderModel( String acadyear, String course, String sem) {
        this.acadyear = acadyear;
        this.course = course;
        this.sem = sem;
    }

    public String getAcadyear() {
        return acadyear;
    }

    public String getCourse() {
        return course;
    }

    public String getSem() {
        return sem;
    }

}
