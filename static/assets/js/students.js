
function saveCredentials(sectionCode, studentCode){
     sessionStorage.setItem("section_code", sectionCode);
     sessionStorage.setItem("student_code", studentCode);
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
                else window.location.replace('students-wait.html');
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
