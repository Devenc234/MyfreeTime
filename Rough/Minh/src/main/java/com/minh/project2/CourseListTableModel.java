package com.minh.project2;

/*course list tabel model
 * alllows mapping of java objects into tablr objects
 *
 */
import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

public class CourseListTableModel extends AbstractTableModel
{
    private String [] columnNames = {"Name","Instructor","CRN","Credits"};
    private ArrayList<Course> courseListTable;

    // Copy the list from CourseList into courseListTable
    public CourseListTableModel(CourseList input)
    {
        courseListTable = input.getCourses();
    }
    public CourseListTableModel(ArrayList<Course> input){ courseListTable = input;}

    // Return the arraylist courseListTable
    public ArrayList<Course> getCourseList()
    {
        return courseListTable;
    }

    // Methods from the AbstractTableModel
    public int getColumnCount()
    {
        return columnNames.length;
    }

    public int getRowCount()
    {
        int size;
        if (courseListTable == null) {
            size = 0;
        }
        else
        {
            size = courseListTable.size();
        }
        return size;
    }

    public Object getValueAt(int row, int col)
    {
        Object temp = null;
        if (col == 0)
        {
            temp = courseListTable.get(row).getName();
        }
        else if (col == 1)
        {
            temp = courseListTable.get(row).getInstructor();
        }
        else if (col == 2)
        {
            temp = new Integer(courseListTable.get(row).getCrn());
        }
        else if(col==3)
        {
            temp = new Double(courseListTable.get(row).getCredits());
        }
        return temp;
    }

    // needed to show column names in JTable
    public String getColumnName(int col)
    {
        return columnNames[col];
    }

    // Required for proper sorting of data
    public Class getColumnClass(int col)
    {
        if (col == 2)
        {
            return Integer.class;
        }
        else if(col==3)
        {
            return Double.class;
        }
        else
        {
            return String.class;
        }
    }

}