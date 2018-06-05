class AboutController < ApplicationController
  def index
  	@page_title = 'About us';
  	@page_body = "Have you ever wanted to share your bathroom stories without being called gross or filthy? That's what this page is all about! Welcome to the web's very own bathroom 'instagram' or as I like to call it Shitstagram!";
  	@page_body2 = "Here you can post all types of bathroom stories from posts intended for comedy to even posts that may be in regards to some potentially worrying health issues that you are hoping the community might be able to answer to save you a trip to the hospital! Not everyone has to be an expert on the bowel movements on here, you just gotta know how to sit back and enjoy a good bathroom story maybe while working on creating your own!";
  end
end
