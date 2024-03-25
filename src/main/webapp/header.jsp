<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');
	*{
		padding:0;
		margin:0;
		white-space : nowrap;
		
	}
	body,html{
		height:100%;
		width:100%;
		background:mint;
	}
	
	header{
		background:linear-gradient(45deg, blue, red);
		height:15%;
		text-align:center;
		font-size:1.5em;
		line-height:120px;	
	}
	section{
		background:mint;
		margin-left:0;
	}
	footer{
		height:5%;
		background-color:gray;
		text-align:center;
		line-height:40px;
		padding: 10px;
  		clear: both; /* Clear floats */
	}

  
	nav {
	    background-color: black;
	    width: 200px;
	    float: left;
	    height: 100vh; /* 100% height of the viewport */
	    overflow-y: auto; /* Enable vertical scrollbar */
 	 }
  
  	nav ul {
	    list-style-type: none;
	    padding: 0;
  	}
  
	  nav li {
	    padding: 10px;
	    margin-top:15px;
	  }
  
	  nav li a {
	    text-decoration: none;
	    color: white;
	  }
	  section {
	    padding: 20px;
	    margin-left: 220px; 
	  }
	caption{
		text-align:left;
		color:hotpink;
	}
	.container > table,.container >form >table {
        width: 50%;
        margin-left:auto;
        margin-right:auto;
        margin-top:30px;
        background: #ffffff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border: 1px solid gray;
    }
    .container >td{
    	border:1px solide black;
    
    }
    table td{
    	text-align:center;
    	margin-left:150px;
    }
    table tr td:first-child {
        color: hotpink;
    }
    label {
        font-weight: bold;
        
    }
    
    	
    	
    
   
	input[type="text"],
	input[type="number"],
	input[type="date"],
	input[type="tel"],
	select,
	input[type="password"]{
		width: calc(100% - 24px); /* 수정된 부분 */
        
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box; 
    }
   
   
    
    input[type="checkbox"] {
        
        margin-left: 10px;
    }

    
	#gender{
		text-align:left;
	}
    .buttons {
        text-align: center;
    }
    .register-btn,
    .cancel-btn {
        padding: 10px 20px;
        margin: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .register-btn {
        background-color: #4caf50;
        color: #fff;
    }
    .cancel-btn {
        background-color: #f44336;
        color: #fff;
    }
    
   .lab{
   		font-weight: bolder;
   }
   .lab > td{
   		margin-bottom:30px;
   		
   }
    /* 상품등록 */
    
    
    .manufacturer{
   		width : 97%;
    }

</style>
</head>
<body>
<header>
	<h2>수강신청 도우미 사이트</h2>
</header>
</body>
</html>