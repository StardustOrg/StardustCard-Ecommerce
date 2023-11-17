/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author joaov
 */
public class Utils {

    public static String escapeSingleQuotes(String input) {
        if (input == null) {
            return null;
        }
        return input.replace("'", "''");
    }

}
