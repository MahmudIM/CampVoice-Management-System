package lk.ijse.cms.model;

public class User {
    private String id;
    private String name;
    private String password;
    private String role;

    public User() {
    }

    public User(String id, String name, String password, String role) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public User(int id, String username, String password, String role) {
        this.id = String.valueOf(id);
        this.name = username;
        this.password = password;
        this.role = role;
    }

    public void show() {
        System.out.println("User ID: " + id);
        System.out.println("Name: " + name);
        System.out.println("Password: " + password);
        System.out.println("Role: " + role);
    }

    public String getId() {
        return id;
    }

    // This method exists...
    public String getName() {
        return name;
    }

    // ...but your Login.java needs THIS one:
    public String getUsername() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    // Added Setters just in case you need them later
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }
}