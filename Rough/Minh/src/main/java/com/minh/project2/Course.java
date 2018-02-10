package com.minh.project2;

/*course class
 * Minh  Nguyen
 * 11/28/17
 */

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Course {
    private String name;
    private String instructor;
    private int crn;
    private double credits;

    private Course(String n, String i, int crn, double cred) {
        name = n.trim();
        instructor = i.trim();
        this.crn = crn;
        credits = cred;
    }
    public Course() {
        this("","",0,0.0);
    }
    // Getter and setters
    public void setName(String s) {
        name = s.trim();
    }
    public void setInstructor(String s) {
        instructor = s.trim();
    }
    public void setCrn(int crn) {
        this.crn = crn;
    }
    public void setCredits(double cr) {
        credits = cr;
    }
    public String getName() {
        return name;
    }
    public String getInstructor() {
        return instructor;
    }
    public int getCrn() {
        return crn;
    }
    public double getCredits() {
        return credits;
    }
    public String toString() {
        return name + "," + instructor + "," +
                crn + "," + credits;
    }
    public String toJSON() {
        String temp = "    {\n";
        temp += "      \"name\" : \"" + name + "\",\n";
        temp += "      \"instructor\" : \"" + instructor +"\",\n";
        temp += "      \"crn\" : " + crn + ",\n";
        temp += "      \"credits\" : " + credits + "\n";
        temp += "    }";
        return temp;
    }
    public String toXML() {
        String temp = "  <course>\n";
        temp += "    <name>" + name + "</name>\n";
        temp += "    <instructor>" + instructor + "</instructor>\n";
        temp += "    <crn>" + crn + "</crn>\n";
        temp += "    <credits>" + credits + "</credits>\n";
        temp += "  </course>\n";
        return temp;
    }
}
/*course
        The route or direction followed by a ship, aircraft, road, or river.
        More »*/
