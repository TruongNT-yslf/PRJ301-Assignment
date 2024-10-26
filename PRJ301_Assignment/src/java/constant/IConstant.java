/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constant;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */

public class IConstant {

    private IConstant() {
    }
    
    public static String NAME_REGEX = "^[a-zA-Z ]+$";
    public static String TEXT_REGEX = "^[A-Za-z0-9 ,\\.]+$";
    public static String USERNAME_REGEX = "^[a-zA-Z0-9._-]{3,20}$";
    public static String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

}
