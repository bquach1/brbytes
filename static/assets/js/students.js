function loginForm() {
    return {
        formData: {
            sec: '',
            stu: ''
        },
        message: '',
        loading: false,
        submitLabel: 'Submit',
        foundLink: false,
        courseUrl: '',

        submitData() {
            this.submitLabel = "Please wait...";
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
                }
                else this.message = "";
            })
            .catch((err) => {
                console.log(`ERROR: ${err}`);
            })
            .finally(() => {
                this.loading = false;
                this.submitLabel = 'Submit';
            });
        }
    };
}
