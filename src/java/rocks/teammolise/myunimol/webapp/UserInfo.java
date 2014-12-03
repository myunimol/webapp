package rocks.teammolise.myunimol.webapp;

/**
 * Il bean del'utente con le informazioni da inserire nella sessione
 * @author Federica Mauriello
 */
public class UserInfo {
    private String name, surname, studentId, studentClass, username, password, taxes, careerPlan, availableExams, enrolledExams ;

    public String getTaxes() {
        return taxes;
    }

    public void setTaxes(String taxes) {
        this.taxes = taxes;
    }

    public String getCareerPlan() {
        return careerPlan;
    }

    public void setCareerPlan(String careerPlan) {
        this.careerPlan = careerPlan;
    }

    public String getAvailableExams() {
        return availableExams;
    }

    public void setAvailableExams(String availableExams) {
        this.availableExams = availableExams;
    }

    public String getEnrolledExams() {
        return enrolledExams;
    }

    public void setEnrolledExams(String enrolledExams) {
        this.enrolledExams = enrolledExams;
    }
    public UserInfo(){
        
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String userId) {
        this.studentId = userId;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }
    
}
