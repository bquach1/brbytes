
const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

const charactersLength = characters.length;

function anchor(link,desc) { return `<a href="${link}">${desc}</a>`; }

function makeid(length) {
    let result = '';

    for ( let i = 0; i < length; i++ ) {
        let idx = Math.floor(Math.random() * charactersLength);
        result += characters.charAt(idx);
    }

    return result;
}

function studentsWait() {
    let linkon = false;
    let time = 30;
    document.getElementById('initial').innerText = time;
    setInterval(() => {
        if(time > 0) {
            document.getElementById('timer').innerText = time;
            time--; 
        }
        else { window.location.replace('students.html'); }
        if(time < 10 && !linkon) {
            let fallback = "students-fallback.html?v=" + makeid(7);
            let newLink = anchor(fallback,"course list.");
            document.getElementById('courselist').innerHTML = newLink;
            linkon = true;
        }
    }, 1000);
}

function saveCredentials(sectionCode, studentCode){
     sessionStorage.setItem("section_code", sectionCode);
     sessionStorage.setItem("student_code", studentCode);
}

function mainForm() {
    return {
        formData: {
            email: ''
        },
        state: 0, // 0:not submitted, 1:waiting, 2:returned info, 3:returned failure
        teacherInfo: null,
        loading: false,
        tryAgain() { window.location.reload(); },
        submitEmail() {
            this.state = 1;
            let url = '/caincenter/loi21_submitted_teachers'
                + `?teacher_email=eq.${this.formData.email}`;
            fetch(url)
                .then((res) => res.json())
                .then((res) => {
                    if(res.length > 0) {
                        this.state = 2;
                        this.teacherInfo = res;
                    }
                    else this.state = 3;
                });
        },
        submitLabel() {
            if(this.state === 1) { return 'Please wait...'; }
            return 'Submit';
        }
    };
}

function loginForm() {
    return {
        formData: {
            sec: '',
            stu: ''
        },
        message: '',
        foundLink: false,
        loading: false,
        problem: false,
        courseUrl: '',
        /*
        time: new Date(),

        init() {
            setInterval(function(){
                this.time = new Date();
                console.log(this.time);
            },1000);
        },

        getTime() {
            return moment(this.time).format('DD MMMM, YYYY HH:mm:ss');
        },
        */
        submitData() {
            this.loading = true;
            this.message = '';

            fetch('/coursesapi/rpc/section_url', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(this.formData)
            })
            .then((res) => res.json())
            .then((res) => {
                console.log(`fetch: ${res}`);
                this.courseUrl = res;
                if(this.courseUrl
                   && typeof(this.courseUrl) === 'string'
                   && this.courseUrl.startsWith('/courses')) {
                    this.message = "Link to your course";
                    this.foundLink = true;
                    saveCredentials(this.formData.sec,this.formData.stu);
                    window.location.replace(this.courseUrl);
                }
                else {
                    let waitUrl = "students-wait.html?v=" + makeid(7);
                    window.location.replace(waitUrl);
                }
                // else this.message = "";
            })
            .catch((err) => {
                console.log(`ERROR: ${err}`);
            })
            .finally(() => {
                //setTimeout(function(){this.loading=false},3000);
                this.problem = true;
                this.stu='';
                this.sec='';
                this.loading = false;
            });
        },
        
        submitLabel() {
            if(this.loading) { return 'Please wait...'; }
            return 'Submit';
        }
    };
}
