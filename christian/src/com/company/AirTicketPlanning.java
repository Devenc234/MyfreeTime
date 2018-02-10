package com.company;

import java.util.Scanner;



public class AirTicketPlanning { //defines class

    /**
     * Main method
     */
    public static void main(String[] args) {

        String[] airports = {"JFK","BOS","ORD","MSP","LAX"};
        //list of airports
        System.out.println("Airport List:");
        System.out.println("-----------------");
        System.out.println("0: JFK" + "\n1: BOS" + "\n2: ORD" + "\n3: MSP" + "\n4: LAX");
        System.out.println("-----------------\n");

        //user input
        System.out.println("Input the number associated with the origin airport: ");
        Scanner input1 = new Scanner(System.in);
        int x = input1.nextInt();
        //need to add an if-else statement in case the user inputs a value that isn't between 0 and 4
        //System.out.println("Sorry, that is an invalid input.");

        System.out.println("Input the number associated with the destination airport:");
        Scanner input2 = new Scanner(System.in);
        int y = input2.nextInt();
        //need to add an if-else statement in case the user inputs a value that isn't between 0 and 4
        //System.out.println("Sorry, that is an invalid input.");

        //how do I get the program to print the name of the source and destination
        //(and any other airport in between the two) airports and output the expected
        //time of the flight between a pair of airports

        int n = 5; //number of vertices
        //price
        int[][] Price = {
                {0, 160, 175, 210, 380},
                {130, 0, 120, 215, 330},
                {230, 150, 0, 90, 260},
                {210, 210, 100, 0, 230},
                {420, 340, 200, 210, 0}
        };

/*        AirTicketPlanning g1 = new AirTicketPlanning (n, Price);
        g1.bellman_ford(0);
        g1.display_distance();*/

        Dijkstras_Shortest_Path dsp = new Dijkstras_Shortest_Path(n);
        dsp.dijkstra_algorithm(Price,x);
        System.out.println("The Shorted Path from " + airports[x] + " to " + airports[y] + " is: ");
        for (int i = 1; i <= dsp.getDistances().length - 1; i++)
        {
            if (i == y)
                System.out.println(x + " to " + i + " is "
                        + dsp.getDistances()[i]);
        }




        System.out.println("-----------------");

        //expected time of flight between airports
        int[][] Time = {
                {0, 2, 2, 3, 7},
                {2, 0, 3, 3, 7},
                {2, 3, 0, 2, 4},
                {3, 3, 2, 0, 4},
                {7, 7, 4, 4, 0}
        };

/*        AirTicketPlanning g2 = new AirTicketPlanning (n, Time);
        g2.bellman_ford(0);*/
    }

}
