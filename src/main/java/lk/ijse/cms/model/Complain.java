package lk.ijse.cms.model;

public class Complain {
    private int id;
    private String title;
    private String description;
    private String status; // e.g., "Pending", "Resolved"
    private String remarks; // This is the Admin's FEEDBACK
    private String created_at;
    private String studentId; // Changed from user_id to be specific
    private String department; // NEW
    private String course; // NEW
    private String category;

    public Complain() {
    }

    // Comprehensive Constructor for the Student System
    public Complain(int id, String title, String description, String status, String remarks,
            String created_at, String studentId, String department, String course, String category) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = status;
        this.remarks = remarks;
        this.created_at = created_at;
        this.studentId = studentId;
        this.department = department;
        this.course = course;
        this.category = category;
    }

    // Getters and Setters for New Fields
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

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    // Existing Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
}