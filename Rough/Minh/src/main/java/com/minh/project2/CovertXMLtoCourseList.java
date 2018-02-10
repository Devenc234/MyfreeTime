package com.minh.project2;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

public class CovertXMLtoCourseList {

    public static CourseList myXMLconverter(File xmlFile){

        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder;
        ArrayList<Course> courseList = new ArrayList<Course>();

        try {
            dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

            NodeList nodeList = doc.getElementsByTagName("course");
            //now XML is loaded as Document in memory, lets convert it to Object List

            for (int i = 0; i < nodeList.getLength(); i++) {
                courseList.add(getCourse(nodeList.item(i)));
            }
            //lets print Course list information
            for (Course c : courseList) {
                System.out.println(c.toString());
            }
        } catch ( IOException e1) {
            e1.printStackTrace();
        } catch (ParserConfigurationException e2){
            e2.printStackTrace();
        } catch (SAXException e3){
            e3.printStackTrace();
        }

        CourseList courseListObject = new CourseList(courseList);
        return courseListObject;
    }

    private static Course getCourse(Node node) {
        //XMLReaderDOM domReader = new XMLReaderDOM();
        Course course = new Course();
        if (node.getNodeType() == Node.ELEMENT_NODE) {
            Element element = (Element) node;
            course.setName(getTagValue("name", element));
            course.setInstructor(getTagValue("instructor",element));
            course.setCrn(Integer.parseInt(getTagValue("crn", element)));
            course.setCredits(Double.parseDouble(getTagValue("credits",element)));
        }
        return course;
    }
    private static String getTagValue(String tag, Element element) {
        NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
        Node node = (Node) nodeList.item(0);
        return node.getNodeValue();
    }

}
