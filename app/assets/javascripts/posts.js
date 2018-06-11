# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventLister("turbolinks:load, function() {

    var Posts = {
	    previewShot() {
	        if (window.File && window.FileList && window.FileReader){
	            function handleFileSelect(evt){
	                evt.stopPropagation();
	                evt.preventDefault();

	                 let files = evt.target.files || evt.dataTransfer.files;
	            }
	        }
	    }
    }
});
