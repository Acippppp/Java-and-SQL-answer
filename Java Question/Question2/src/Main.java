import java.io.*;
import java.nio.file.Paths;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {

        String csvFile = "employees.csv";

        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            String line;
            double totalSalary = 0.0;
            int employeeCount = 0;
            while ((line = br.readLine()) != null) {
                // Split the line by the CSV separator (usually a comma)
                String[] employeeData = line.split(",");
                if (employeeData.length >= 3) {
                    int employeeID = Integer.parseInt(employeeData[0].trim());
                    String name = employeeData[1].trim();
                    double salary = Double.parseDouble(employeeData[2].trim());

                    // Print employee details
//                    System.out.println("Employee_ID: " + employeeID);
//                    System.out.println("Name: " + name);
//                    System.out.println("Salary: " + salary);

                    totalSalary += salary;
                    employeeCount++;
                }

            }
            if (employeeCount > 0) {
                double averageSalary = totalSalary / employeeCount;
                System.out.println("Average Salary: " + averageSalary);
            } else {
                System.out.println("No valid employee records found in the CSV file.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}