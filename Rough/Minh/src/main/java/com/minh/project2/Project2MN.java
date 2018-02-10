package com.minh.project2;/*main driver program for the project
 * Minh Nguyen
 * 11/28/17
 */
import javax.swing.*; // JFrame, JMenuBar, JMenu, JMenuItem

import java.awt.event.*; // ActionListener, ActionEvent
import com.fasterxml.jackson.databind.ObjectMapper;  // For JSON parsing
import java.io.*;  // For file handling
import java.io.IOException;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.util.*;

class Project2MN extends JFrame implements ActionListener
{
    // Declare a JTable object
    private JTable table;

    // Declare a CourseListTableModel object
    private CourseListTableModel tableModel;

    // Declare a CourseList object
    private CourseList myList;

    Project2MN(String title)
    {
        // Sets title for the JFrame
        super(title);

        // Sets postion, width, height
        setBounds(40,40,600,480);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Create list of course - currently empty
        myList = new CourseList();

        // Set the CourseListTableModel object to myList
        tableModel = new CourseListTableModel(myList);

        // Create a new JTable based on tableModel
        table = new JTable(tableModel);

        // Allow sorting of rows based on columns
        table.setAutoCreateRowSorter(true);

        // Create a JScrollPane called scrollPane
        JScrollPane scrollPane = new JScrollPane(table);

        // Set size for scrollPane
        scrollPane.setPreferredSize(new Dimension(380,280));

        // Create a new panel
        JPanel panel = new JPanel();

        // Add scrollPane to panel
        panel.add(scrollPane);

        // Add panel to Frame
        add(panel,BorderLayout.CENTER);

        initMenu();
    }

    void initMenu()
    {
        // Create menubar
        JMenuBar menuBar = new JMenuBar();
        setJMenuBar(menuBar);

        // Create Menu
        JMenu file = new JMenu("File");
        // Create Quit item
        JMenuItem quit = new JMenuItem("Quit");
        quit.addActionListener(this);

        // Create Open JSON item
        JMenuItem openJSONItem = new JMenuItem("Open JSON");
        openJSONItem.addActionListener(this);

        // Create Save JSON item
        JMenuItem saveJSONItem = new JMenuItem("Save as JSON");
        saveJSONItem.addActionListener(this);

        //create a open XML item
        JMenuItem openXMLItem = new JMenuItem("Open XML");
        openXMLItem.addActionListener(this);

        // Add items to menu
        file.add(openJSONItem);
        file.add(openXMLItem);
        file.add(saveJSONItem);
        file.add(quit);
        // Add menu to menubar
        menuBar.add(file);
    }

    void saveJSON(String filename)
    {
        System.out.println("Saving file to "+filename);
        // Create a PrintWriter object to write to the filename provided
        PrintWriter outfile=null;
        try
        {
            outfile = new PrintWriter(filename);
        }
        catch(IOException e)
        {
            e.printStackTrace();
            System.exit(1);
        }
        // Get the array list from the table model
        ArrayList<Course> writeList = tableModel.getCourseList();
        // Create a CourseList object from the arraylist obtained above
        CourseList newCourseList = new CourseList(writeList);
        // Write the CourseList object in JSON format to outfile
        outfile.println(newCourseList.toJSON());
        outfile.close();

    }

    void openJSON(String filename)
    {
        // This method will parse the XML file and map it to the JTable
        // Create ObjectMapper object
        ObjectMapper mapper = new ObjectMapper();
        File file = new File(filename);
        CourseList myList =null;
        try
        {
            // Read the JSON file into a CourseList object
            myList = mapper.readValue(file,CourseList.class);
        }
        catch(IOException e)
        {
            e.printStackTrace();
            System.exit(1);
        }
        System.out.println(myList.toXML());
        // Map myList to a CourseListTableModel object tableModel
        tableModel = new CourseListTableModel(myList);
        // Update the JTable using setModel method
        table.setModel(tableModel);
    }

    void openXML(String filename)
    {
        // This method will parse the XML file and map it to the JTable
        // Create ObjectMapper object
        ObjectMapper mapper = new ObjectMapper();
        File file = new File(filename);
        CourseList myList =null;

        myList = CovertXMLtoCourseList.myXMLconverter(file);

        System.out.println(myList.toXML());
        // Map myList to a CourseListTableModel object tableModel
        tableModel = new CourseListTableModel(myList);
        // Update the JTable using setModel method
        table.setModel(tableModel);
    }

    public void actionPerformed(ActionEvent ae)
    {
        String choice = ae.getActionCommand();
        if (choice.equals("Quit"))
        {
            System.exit(0);
        }
        else if (choice.equals("Open JSON"))
        {
            // Set current folder as folder to view files
            JFileChooser fileCh = new JFileChooser("."); //current folder
            // Get the user choice
            int userChoice = fileCh.showOpenDialog(this);
            // if user presses ok
            if (userChoice == JFileChooser.APPROVE_OPTION)
            {
                String filename = fileCh.getSelectedFile().getAbsolutePath();
                // Call the method Handle the file
                openJSON(filename);
            }
        }
        //****************************************************************
        else if (choice.equals("Open XML"))
        {
            // Set current folder as folder to view files
            JFileChooser fileCh = new JFileChooser("."); //current folder
            // Get the user choice
            int userChoice = fileCh.showOpenDialog(this);
            // if user presses ok
            if (userChoice == JFileChooser.APPROVE_OPTION)
            {
                String filename = fileCh.getSelectedFile().getAbsolutePath();
                // Call the method Handle the file
                openXML(filename);
            }
        }

        //****************************************************************
        else if(choice.equals("Save as JSON"))
        {
            // Set current folder as folder to view files
            JFileChooser fileCh = new JFileChooser("."); //current folder
            // Get the user choice
            int userChoice = fileCh.showSaveDialog(this);
            // if user presses ok
            if (userChoice == JFileChooser.APPROVE_OPTION)
            {
                String filename = fileCh.getSelectedFile().getAbsolutePath();
                // Call the method to handle the file
                saveJSON(filename);
            }
        }
    }


}
