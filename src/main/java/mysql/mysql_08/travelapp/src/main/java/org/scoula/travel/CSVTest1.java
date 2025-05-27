package org.scoula.travel;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

import java.io.FileReader;
import java.io.IOException;

public class CSVTest1 {
    public static void main(String[] args) throws CsvValidationException, IOException {
        CSVReader csvReader = new CSVReader(new FileReader("travel.csv"));
        String[] line;
        while ((line=csvReader.readNext())!=null){
            System.out.println(String.join(",",line));
        }
    }
}