/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;


import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public abstract class AccessControlController extends BaseRequiredAuthenticationController {

    protected boolean isAuthorized(HttpServletRequest req, User account) {
        return true;
    }

    protected abstract void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException;

    protected abstract void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        if (isAuthorized(req, account)) {
            doAuthorizedGet(req, resp, account);
        } else {
            resp.sendError(403, "You do not have right to access this feature!");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        if (isAuthorized(req, account)) {
            doAuthorizedPost(req, resp, account);
        } else {
            resp.sendError(403, "You do not have right to access this feature!");
        }
    }
}
