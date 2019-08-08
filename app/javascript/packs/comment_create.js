
import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

new Vue({
    el: '.myservice_contents_comment',
    data: {
	  detail: ''
	},
    methods: {
      click(id){
        axios
      	.post(`/services/${id}/comments`,{
			  comment: {
				  detail: this.detail
			  }
		  })
      	.then(response => {
			  console.log(response)
		  })
      }
    }
  })