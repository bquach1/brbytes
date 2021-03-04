
function loginForm() {
    return {
        formData: {
            sec: '',
            stu: ''
        },
        message: '',
        foundLink: false,
        loading: false,
        courseUrl: '',

        /*
        time: new Date(),

        init() {
            setInterval(function(){
                this.time = new Date();
            },1000);
        },

        getTime() {
            return "Hello";
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
                this.courseUrl = res;
                if(this.courseUrl
                   && typeof(this.courseUrl) === 'string'
                   && this.courseUrl.startsWith('/courses')) {
                    this.message = "Link to your course";
                    this.foundLink = true;
                    window.location.replace(this.courseUrl);
                }
                else this.message = "";
            })
            .catch((err) => {
                console.log(`ERROR: ${err}`);
            })
            .finally(() => {
                this.loading = false;
            });
        },
        
        submitLabel() {
            if(this.loading) { return 'Please wait...'; }
            return 'Submit';
        }
    };
}
