package mvc_jdbc_test.controller;

import JDBCConnector.JDBCConnector;
import mvc_jdbc_test.entity.Customer;
import mvc_jdbc_test.view.CustomerView;

import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class MainController {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("\n=== 고객 관리 시스템 ===");
            System.out.println("1. 고객 목록 조회");
            System.out.println("2. 고객 정보 수정");
            System.out.println("3. 고객 정보 삭제");
            System.out.println("4. 종료");
            System.out.print("메뉴 선택: ");
            int menu = sc.nextInt();
            sc.nextLine();

            if (menu == 1) {
                Connection con = JDBCConnector.getConnection();
                customerListAndView(con);
            } else if (menu == 2) {
                Connection con = JDBCConnector.getConnection();
                updateCustomerInteractive(con, sc);
            } else if (menu == 3) {
                Connection con = JDBCConnector.getConnection();
                deleteCustomerInteractive(con, sc);
            } else if (menu == 4) {
                System.out.println("프로그램 종료");
                break;
            } else {
                System.out.println("잘못된 입력입니다.");
            }
        }
        sc.close();
    }

    public static void customerListAndView(Connection con) {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM 고객";

        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerid(rs.getString("고객아이디"));
                c.setCustomername(rs.getString("고객이름"));
                c.setAge(rs.getInt("나이"));
                c.setLevel(rs.getString("등급"));
                c.setJob(rs.getString("직업"));
                c.setReward(rs.getInt("적립금"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("조회 오류: " + e.getMessage());
        }

        CustomerView cv = new CustomerView();
        cv.printHead();
        for (Customer c : list) {
            cv.printCustomer(c);
            System.out.println();
        }
        cv.printFooter();
    }

    public static void updateCustomerInteractive(Connection con, Scanner sc) {
        System.out.print("수정할 고객 ID 입력: ");
        String id = sc.nextLine();

        Customer before = findCustomer(con, id);
        if (before == null) {
            System.out.println("해당 고객이 존재하지 않습니다.");
            return;
        }

        System.out.println("기존 고객 정보:");
        new CustomerView().printCustomer(before);

        System.out.print("새 등급 입력: ");
        String newLevel = sc.nextLine();
        System.out.print("새 적립금 입력: ");
        int newReward = sc.nextInt();
        sc.nextLine();

        String sql = "UPDATE 고객 SET 등급=?, 적립금=? WHERE 고객아이디=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newLevel);
            ps.setInt(2, newReward);
            ps.setString(3, id);
            int result = ps.executeUpdate();
            if (result > 0) {
                System.out.println("고객 정보 수정 완료.");
                Customer after = findCustomer(con, id);
                System.out.println("수정된 고객 정보:");
                new CustomerView().printCustomer(after);
            } else {
                System.out.println("수정 실패.");
            }
        } catch (SQLException e) {
            System.out.println("수정 중 오류: " + e.getMessage());
        }
    }

    public static void deleteCustomerInteractive(Connection con, Scanner sc) {
        System.out.print("삭제할 고객 ID 입력: ");
        String id = sc.nextLine();

        Customer target = findCustomer(con, id);
        if (target == null) {
            System.out.println("해당 고객이 존재하지 않습니다.");
            return;
        }

        System.out.println("삭제 대상 고객 정보:");
        new CustomerView().printCustomer(target);
        System.out.print("정말 삭제하시겠습니까? (y/n): ");
        String confirm = sc.nextLine();

        if (confirm.equalsIgnoreCase("y")) {
            String sql = "DELETE FROM 고객 WHERE 고객아이디=?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, id);
                int result = ps.executeUpdate();
                if (result > 0) {
                    System.out.println("삭제 완료: " + id);
                } else {
                    System.out.println("삭제 실패.");
                }
            } catch (SQLException e) {
                System.out.println("삭제 중 오류: " + e.getMessage());
            }
        } else {
            System.out.println("삭제 취소됨.");
        }
    }

    private static Customer findCustomer(Connection con, String id) {
        String sql = "SELECT * FROM 고객 WHERE 고객아이디=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setCustomerid(rs.getString("고객아이디"));
                c.setCustomername(rs.getString("고객이름"));
                c.setAge(rs.getInt("나이"));
                c.setLevel(rs.getString("등급"));
                c.setJob(rs.getString("직업"));
                c.setReward(rs.getInt("적립금"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println("고객 검색 오류: " + e.getMessage());
        }
        return null;
    }
}
