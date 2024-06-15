package com.example.webapp;

public class Student {
    private String department;
    private String studentId;
    private int marks;

    public Student(String department, String studentId, int marks) {
        this.studentId = studentId;
        this.department = department;
        this.marks = marks;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }
}
