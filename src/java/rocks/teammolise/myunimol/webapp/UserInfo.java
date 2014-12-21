package rocks.teammolise.myunimol.webapp;

/**
 * Il bean del'utente con le informazioni da inserire nella sessione
 * @author Federica Mauriello
 */
public class UserInfo {
    private String name;
    private String surname;
    private String studentId;
    private String studentClass;
    private String username;
    private String password;
    private String taxes;
    private String careerPlan;
    private String availableExams;
    private String enrolledExams;
    
    private String course;
    private String department;
    private String coursePath;
    private int courseLength;
    private String registrationDate;

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

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getCoursePath() {
		return coursePath;
	}

	public void setCoursePath(String coursePath) {
		this.coursePath = coursePath;
	}

	public int getCourseLength() {
		return courseLength;
	}

	public void setCourseLength(int courseLength) {
		this.courseLength = courseLength;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	
	public int getTotalCFU() {
		return this.courseLength * 60;
	}
}
