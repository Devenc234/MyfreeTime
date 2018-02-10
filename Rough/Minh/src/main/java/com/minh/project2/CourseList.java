package com.minh.project2;

/*courseList class
 * Minh  Nguyen
 * 11/28/17
 */

// Role of this class: Map JSON file to an arraylist

import java.util.ArrayList;
public class CourseList
{
    private ArrayList<Course> courses;

    public CourseList()
    {
        courses = new ArrayList<Course>();
    }
    // Newly added constructor
    public CourseList(ArrayList<Course> input)
    {
        courses=input;
    }
    public void add(Course c) {
        courses.add(c);
    }
    public ArrayList<Course> getCourses() {
        return courses;
    }

    public String toXML() {
        String temp = "<?xml version=\"1.0\" ?>\n";
        temp += "<courses>\n";
        for (Course course : courses) {
            temp += course.toXML();
        }
        temp += "</courses>";
        return temp;
    }
    public String toJSON() {
        String temp = "{\n";
        temp += "  \"courses\" : [\n";
        for (int i = 0; i < courses.size(); i++) {
            temp += courses.get(i).toJSON();
            if (i < courses.size() - 1) {
                temp += ",";
            }
            temp += "\n";
        }
        temp += "  ]\n";
        temp += "}";
        return temp;
    }


}