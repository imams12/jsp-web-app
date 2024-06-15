<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webapp.Student" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaeaea;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #119388;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
    <script>
        $(document).ready(function() {
            $(".studentId").click(function() {
                alert($(this).data("name"));
            });
        });
    </script>
</head>
<body>
<h1>Welcome <%= request.getSession().getAttribute("userId") %></h1>
<table>
    <thead>
    <tr>
        <th>Department</th>
        <th>Student ID</th>
        <th>Marks</th>
        <th>Pass %</th>
    </tr>
    </thead>
    <tbody>
    <%-- Prepare data and calculate pass percentages --%>
    <%
        List<Student> students = (List<Student>) request.getAttribute("students");

        // Calculate department-wise pass percentages
        Map<String, Float> deptPassPercentages = new HashMap<>();

        // Iterate over departments to calculate pass percentages
        for (Student student : students) {
            String department = student.getDepartment();

            // Calculate total students and passed students for the department
            int totalStudents = (int) students.stream().filter(s -> s.getDepartment().equals(department)).count();
            int deptPassCount = (int) students.stream().filter(s -> s.getDepartment().equals(department) && s.getMarks() >= 40).count();

            float passPercentage = (float) deptPassCount / totalStudents * 100;
            deptPassPercentages.put(department, passPercentage);
        }

        // Sort departments alphabetically
        List<String> sortedDepartments = deptPassPercentages.keySet().stream()
                .sorted()
                .collect(Collectors.toList());

        // Display data with grouped department and pass percentages
        for (String department : sortedDepartments) {
            Float passPercentage = deptPassPercentages.get(department);

            // Find students belonging to this department
            List<Student> deptStudents = students.stream()
                    .filter(s -> s.getDepartment().equals(department))
                    .collect(Collectors.toList());

            // Display one row for this department
    %>
    <tr>
        <td rowspan="<%= deptStudents.size() %>"><%= department %></td>
        <td class="studentId" data-name="<%= deptStudents.get(0).getStudentId() %>"><%= deptStudents.get(0).getStudentId() %></td>
        <td><%= deptStudents.get(0).getMarks() %></td>
        <td rowspan="<%= deptStudents.size() %>"><%= String.format("%.2f", passPercentage) %></td>
    </tr>
    <%
        // Display remaining students for this department, if any
        for (int i = 1; i < deptStudents.size(); i++) {
    %>
    <tr>
        <td class="studentId" data-name="<%= deptStudents.get(i).getStudentId() %>"><%= deptStudents.get(i).getStudentId() %></td>
        <td><%= deptStudents.get(i).getMarks() %></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>
