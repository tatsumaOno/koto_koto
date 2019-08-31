import Vue from 'vue/dist/vue.esm'

new Vue({
	el: '.service_page_r_form_image',
	data(){
		return {
			uploadedImage: '',
		  };
	},
	methods: {
		onFileChange(e) {
		  let files = e.target.files || e.dataTransfer.files;
		  this.createImage(files[0]);
		},
		// アップロードした画像を表示
		createImage(file) {
		  let reader = new FileReader();
		  reader.onload = (e) => {
			this.uploadedImage = e.target.result;
		  };
		  reader.readAsDataURL(file);
		},
	  },  
});