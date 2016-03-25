/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.other;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.stereotype.Component;

/**
 *
 * @author Aleks
 */
public class XLSParser {

    private static String readCell(Row row) {
        String buf = "";
        Iterator<Cell> cells = row.iterator();
        while (cells.hasNext()) {
            Cell cell = cells.next();
            int cellType = cell.getCellType();
            if (cell.getCellStyle().getLocked() == false) {
                switch (cellType) {
                    case Cell.CELL_TYPE_STRING:
                        buf += cell.getStringCellValue();
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        buf += (int) cell.getNumericCellValue();
                        break;

                    case Cell.CELL_TYPE_FORMULA:
                        buf += cell.getNumericCellValue();
                        break;
                    default:
                        buf += " ";
                        break;
                }
            }
        }
        return buf;
    }

    private static String readCell(Row row, int offset, int count) {
        String buf = "";
        Iterator<Cell> cells = row.iterator();
        int index = 0;
        while (cells.hasNext()) {
            Cell cell = cells.next();

            int cellType = cell.getCellType();
            if (cell.getCellStyle().getLocked() == false) {
                if (index >= offset && index < offset + count) {
                    switch (cellType) {
                        case Cell.CELL_TYPE_STRING:
                            buf += cell.getStringCellValue();
                            break;
                        case Cell.CELL_TYPE_NUMERIC:
                            buf += (int) cell.getNumericCellValue();
                            break;

                        case Cell.CELL_TYPE_FORMULA:
                            buf += cell.getNumericCellValue();
                            break;

                    }
                }
                index++;
            }
        }
        return buf;
    }

    public static String parse(String name) {

        String result = "";
        InputStream in = null;
        HSSFWorkbook wb = null;
        try {
            in = new FileInputStream(name);
            wb = new HSSFWorkbook(in);
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("!!!!sheet count:" + wb.getNumberOfSheets());
        for (int i = 0; i < wb.getNumberOfSheets(); i++) {
            System.out.println("!!!!sheet[" + i + "]:" + wb.getSheetName(i));
        }
        for (int i = 0; i < wb.getNumberOfSheets(); i++) {
            Sheet sheet = wb.getSheetAt(i);
            Iterator<Row> it = sheet.iterator();
            String buf = "";
            while (it.hasNext()) {
                Row row = it.next();

                //result += row.getRowNum() + ":";
                switch (row.getRowNum() + 1) {
                    case 13:
                        result += readCell(row);
                        result += "<br>";
                        break;
                    case 14:
                        result += readCell(row);
                        result += "<br>";
                        break;
                    case 15:
                        result += readCell(row);
                        break;
                    case 16:
                        result += readCell(row);
                        result += "<br>";
                        break;
                    case 18:
                        result += readCell(row);
                        break;
                    case 19:
                        result += readCell(row);
                        break;
                    case 20:
                        result += readCell(row);
                        break;
                    case 21:
                        result += readCell(row);
                        break;
                    case 22:
                        result += readCell(row);
                        result += "<br>";
                        break;
                    case 25:
                        result += readCell(row);
                        break;
                    case 26:
                        result += readCell(row);
                        result += "<br>";
                        break;
                    default:
                        result += readCell(row);
                        result += "<br>";
                        break;
                }

//            if (row.getRowNum() + 1 != 34 || row.getRowNum() + 1 != 34) {
//                result += readCell(row);
//            } else {
//                result += "[" + readCell(row, 0, 7) + "][" + readCell(row, 7, 10);
//            }
            }
        }
        return result;
    }

    public static String parseStatisticDoc(String name) {

        String result = "";
        InputStream in = null;
        HSSFWorkbook wb = null;
        try {
            in = new FileInputStream(name);
            wb = new HSSFWorkbook(in);
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("!!!!sheet count:" + wb.getNumberOfSheets());
        for (int i = 0; i < wb.getNumberOfSheets(); i++) {
            System.out.println("!!!!sheet[" + i + "]:" + wb.getSheetName(i));
        }

        Sheet sheet = wb.getSheetAt(0);
        Iterator<Row> it = sheet.iterator();
        while (it.hasNext()) {
            Row row = it.next();
            Iterator<Cell> cells = row.iterator();

            //  row.getCell(0).getStringCellValue()
            switch (row.getRowNum()) {

            }
            result += "\n";
        }

        return result;
    }

}
