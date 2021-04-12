
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

function showCourse(item) {
    let dColor = 'w3-light-green';
    if(item.needs_training === 'yes') dColor = 'w3-orange';
    let dTraining = '';
    if(item.needs_training === 'yes')
        dTraining = '<br><b>You need to attend the LSU Summer Institute before you can teach this course</b>';

    return `<div class="${dColor}">${item.course} ${dTraining}</div>`;
}

function mainForm() {
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiY2FpbmNlbnRlciJ9._UZFmVmDzJpuiKidPcKPVvfL1yO8K6QezcJ1OYjrin8";
    return {
        formData: {
            email: ''
        },
        // 0:not submitted, 1:waiting, 2:returned info, 3:returned failure
        // 4:confirmed 5:confirmation registered 6:rejection registered
        // 7:unknown error
        state: 0, 
        teacherInfo: null,
        loading: false,
        tryAgain() { window.location.reload(); },
        submitEmail() {
            this.state = 1;
            let url = '/api2/loi21_teacher_submissions'
                + `?teacher_email=eq.${this.formData.email}`;
            fetch(url, {
                method: "GET",
                headers: {
                    "Authorization": `Bearer ${token}`,
                    "Accept-Profile": "caincenter"
                }
            })
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
        },
        async submitConfirm(status) {
            let timestamp = (new Date()).toUTCString();
            let url = '/api2/loi21_teacher_submissions';
            let options = {
                method: 'PATCH',
                headers: {
                    "Content-Type": 'application/json',
                    "Authorization": `Bearer ${token}`,
                    "Content-Profile": "caincenter",
                }
            };
            let success = true;
            for(let item of this.teacherInfo) {
                let record = {
                    confirmation_status: status,
                    confirmation_date: timestamp
                };
                options.body = JSON.stringify(record);

                await fetch(url + '?id=eq.' + item.id, options)
                    .then((res) => { success = success && true; })
                    .catch((err) => { success = false; });
            };
            if(success && status === 'confirmed') { this.state = 5; }
            else if(success && status === 'rejected') { this.state = 6; }
            else { this.state = 7; }
        }
    };
}
