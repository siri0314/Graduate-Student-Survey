 <!-- Sreelalitha -->
<!-- This page is used to display retrieved details from the database of a student ID -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>GMU Survey Form</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <style>
    .custom-style {
      border: 5px solid #006633;
      box-shadow: 10px 10px #FFCC33;
      font-family: Myriad pro;
      font-weight: bolder;
    }

    .space{
      margin-top: 20px;
    }

    label{
      margin-top: 10px;
      font-weight: bolder;
    }

    div.fixed {
      position: fixed;
      bottom: 0;
      right: 0;
    }

    .column {
      float: left;
      width: 33.33%;
      padding: 5px;
    }

    .row::after {
      content: "";
      clear: both;
      display: table;
    }
  </style>
    <!-- Custom styles for this template -->
  </head>
  <body class="bg-light">
  <div style="display: none">
    <div id="error_dialog" title="Please resolve these errors!" >
      <p id="error_text" style="color: red;">Errors</p>
    </div>
  </div>


  <div style="background-color: #006633 ">
      <img class="d-block mx-auto " src="img/mason-logo.png" alt="George Mason Logo  " width="250" height="150">
  </div>

  <div class ="space">
  <div class="container">
  <h2 class="py-2 text-center custom-style">${stdbean.getStudentid()} Student Data</h2> 

  <div id="DisplayHere"></div>
  <div id="NewUser"></div>

  <div class="row">
    <div class="col-md-8 mx-auto">
      <form class="py-3 needs-validation" id="studForm" method="post" action="Mainservlet" autocomplete="on">



        <div class="mb-3">
          <label for="fname">First Name<label style="color: red">*</label></label>
          <div class="input-group">
            <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name"   value="${stdbean.getFname()}" readonly>
          </div>
            <div class="invalid-feedback" style="width: 100%;">
              Please enter First Name.
            </div>
            <div id="errorfName" style="color: red"></div>
        </div>

        <div class="mb-3">
          <label for="lname">Latest Name<label style="color: red">*</label></label>
          <div class="input-group">
            <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name"  value="${stdbean.getLname()}" readonly >
          </div>
            <div class="invalid-feedback" style="width: 100%;">
              Please enter Last Name.
            </div>
            <div id="errorlName" style="color: red"></div>
        </div>

        <div class="mb-3">
          <label for="studentid">Student ID<label style="color: red">*</label></label>
          <div class="input-group">
            <input type="text" class="form-control" id="studentid" name="studentid" placeholder="G01122334"  value="${stdbean.getStudentid()}" readonly >
          </div>
            <div class="invalid-feedback" style="width: 100%;">
              Please enter Student ID.
            </div>
            <div id="errorStudentid" style="color: red"></div>
        </div>

        

        <div class="mb-3">
          <label for="email">Email ID<label style="color: red">*</label></label>
          <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" value="${stdbean.getEmail()}" readonly>
          <div class="invalid-feedback">
            Please enter a valid email address.
          </div>
          <div id="errorEmail" style="color: red"></div>
        </div>

        <div class="mb-3">
          <label for="address">Street Address<label style="color: red">*</label></label>
          <input type="text" class="form-control" id="streetaddress" name="streetaddress" placeholder="1234 Main St" value="${stdbean.getStreetaddress()}" readonly>
          <div id="errorStreet" style="color: red"></div>
          <div class="invalid-feedback">
            Please enter your street address.
          </div>
        </div>

        <div class="mb-3">
          <label for="city">City<label style="color: red">*</label></label>
          <input type="text" class="form-control" id="city" name="city" placeholder="City" value="${stdbean.getCity()}" readonly>
          <div class="invalid-feedback" style="width: 100%;">
            Please enter city.
          </div>
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">Country<label style="color: red">*</label></label>
            <input type="text" class="form-control" id="country" name="country" placeholder="country" value="${stdbean.getCountry()}" readonly>
            <div class="invalid-feedback" style="width: 100%;">
            Please enter country.
          </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">State<label style="color: red">*</label></label>
            <input type="text" class="form-control" id="state" name="state" placeholder="state" value="${stdbean.getState()}" readonly>
            <div class="invalid-feedback" style="width: 100%;">
            Please enter state.
          </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="zipcode">Zipcode<label style="color: red">*</label></label>
            <input type="number" class="form-control" id="zipcode" name="zipcode" placeholder="zipcode" value="${stdbean.getZipcode()}" readonly>
            <div class="invalid-feedback" style="width: 100%;">
            Please enter zipcode.
          </div>
          </div>
        </div>


        <div class="mb-3">
          <label for="data">Data</label>
          <input type="text" class="form-control" id="data" name="data" placeholder="1,2,3,4,5,6,7,8,9,10" onblur="calcMax()" value="${stdbean.getData()}" readonly>
          <div id="errorMsg" style="color: red"></div>
        </div>

        <div class="mb-3">
          <label for="telephone">Telephone number</label>
          <input type="number" class="form-control" id="telephone" name="telephone" placeholder="555-555-5555" value="${stdbean.getTelephone()}" readonly>
        </div>

        <div class="mb-3">
          <label for="url">URL<span class="text-muted">(Optional)</span></label>
          <input type="text" class="form-control" id="url" name="url" placeholder="http://username_example.com" value="${stdbean.getUrl()}" readonly>
        </div>

        <div class="mb-3">
          <label for="surveydate">Date of Survey</label>
          <input type="date" class="form-control" id="surveydate" name="surveydate" placeholder="mm-dd-yyyy" value="${stdbean.getSurveydate()}" readonly>
        </div>

        <hr class="mb-4">
        <h5>What did you like most about the campus</h5>

        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="students" name="likemost" value="Students" ${Students}>
          <label class="custom-control-label" for="students">Students</label>
        </div>

        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="location" name="likemost" value="Location" ${Location}>
          <label class="custom-control-label" for="location">Location</label>
        </div>

        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="campus" name="likemost" value="Campus" ${Campus}>
          <label class="custom-control-label" for="campus">Campus</label>
        </div>

        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="atmosphere" name="likemost" value="Atmosphere" ${Atmosphere}>
          <label class="custom-control-label" for="atmosphere">Atmosphere</label>
        </div>

        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="dormrooms" name="likemost" value="Dormrooms" ${Dormrooms}>
          <label class="custom-control-label" for="dormrooms">Dorm-rooms</label>
        </div>

        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="sports" name="likemost" value="Sports" ${Sports}>
          <label class="custom-control-label" for="sports">Sports</label>
        </div>

        <hr class="mb-4">
        <h5>How did you get interested in the university<label style="color: red">*</label></h5>

        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="friends" name="interestInUniversity" type="radio" class="custom-control-input" value="Friends" ${stdbean.getInterestInUniversity() == 'Friends' ? 'checked' : ''} >
            <label class="custom-control-label" for="friends">Friends</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="television" name="interestInUniversity" type="radio" class="custom-control-input" value="Television" ${stdbean.getInterestInUniversity() == 'Television' ? 'checked' : ''}>
            <label class="custom-control-label" for="television">Television</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="internet" name="interestInUniversity" type="radio" class="custom-control-input" value="Internet" ${stdbean.getInterestInUniversity() == 'Internet' ? 'checked' : ''}>
            <label class="custom-control-label" for="internet">Internet</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="others" name="interestInUniversity" type="radio" class="custom-control-input" value="Others" ${stdbean.getInterestInUniversity() == 'Others' ? 'checked' : ''}>
            <label class="custom-control-label" for="others">Others</label>
          </div>
        </div>

        <hr class="mb-4">
        <h5>Additional Comments</h5>
        <textarea id="comments" name="comments" rows="4" cols="100" readonly>${stdbean.getComments()}</textarea>

        <hr class="mb-4">
        <h5>Please select high-school graduation date</h5>

        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="graduationMonth">Month</label>
            <input list="month" name="month" value="${stdbean.getMonth()}" readonly>
              <datalist id="month">
                <option value="January">
                <option value="February">
                <option value="March">
                <option value="April">
                <option value="May">
                <option value="June">
                <option value="July">
                <option value="August">
                <option value="September">
                <option value="October">
                <option value="November">
                <option value="December">
              </datalist>
          </div>

          <div class="col-md-6 mb-3">
            <label for="graduationYear">Year</label>
            <input type="number"  min="1950" max="2020" step="1" id="graduationYear" name="graduationYear" placeholder="yyyy" value="${stdbean.getGraduationYear()}" readonly>
          </div>
        </div>

        <hr class="mb-4">
        <h5>How likely are you to recommend this school to other prospective students</h5>

        <div class="mb-3">
          <select id="recommend" name="recommend" >
            <option value="veryLikely" ${veryLikely}>Very Likely</option>
            <option value="likely" ${likely}>Likely</option>
            <option value="unlikely" ${unlikely}>Unlikely</option>
          </select>
        </div>
 
        <hr class="mb-4">
        <div class="row ">
          <button class="col-md-5 btn btn-primary btn-lg btn-block" type="reset" value="Reset" style="margin-top: 0.5rem; margin-right: 0.5rem" onclick="FormReset()">Reset</button>
          <button class="col-md-5 btn btn-primary btn-lg btn-block" type="submit" onclick="">Submit</button>
        </div>
      </form>
    </div>
  </div>
  </div>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2021 George Mason University</p>
  </footer>
</div>

<div class="fixed">
  <a href="https://www2.gmu.edu/">
    <img class="d-block mx-auto mb-4" src="img/mason-logo2.png" width="100" height="100">
  </a>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script type = "text/javascript">
  var now = new Date();
  var hour = now.getHours(); 
  var name;
  var timeis;
  if ( hour < 12 )
  {
    timeis = "Good Morning ";
  }
  else
  {
    hour = hour - 12;
    if ( hour < 6 )
      timeis =  "Good Afternoon ";
    else
      timeis =  "Good Evening ";
  }

  function deleteCookie() 
  { 
    console.log("Entered deleteCookie");
    setCookie('name', '', -1); 
    location.reload();
  }


  function setCookie(name, value, days) {
    var d = new Date;
    d.setTime(d.getTime() + 24*60*60*1000*days);
    document.cookie = name + "=" + value + ";path=/;expires=" + d.toGMTString();
  }
  function getCookie(name) {
    var v = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return v ? v[2] : '';
  }

  temp = getCookie('name');
  console.log(temp);
  if(temp=='')
  {
    name = window.prompt( "Please enter your name", "" );
    setCookie('name',name,3);
  } 
  else
  {
    name = temp;
  }
  document.getElementById("DisplayHere").innerHTML = "<h5>"+timeis+name+", welcome to SWE642 Assignment"+"</h5>"
  document.getElementById("NewUser").innerHTML = "<a href='javascript:deleteCookie()'> Not "+name+"? Please click here</a>"


  function calcMax()
  {
    console.log("Entered calcMax");
    var inputString = document.getElementById( "data" ).value;
    var tokens = inputString.split( "," ); 
    var sum=0;
    if (tokens.length <10) 
    {
      errorMsg
      document.getElementById("errorMsg").innerHTML = "Please Enter atleast 10 numbers";
    }
    else
    {
      document.getElementById("errorMsg").innerHTML = "";
      var error = 0;
      for (var i=0; i<tokens.length; i++)
      {
          tokens[i] = parseInt(tokens[i], 10);
          sum+= tokens[i];
          if (tokens[i]>100 || tokens[i]<1) 
          {
            error = 1;
          }
      }

      if (error==1) 
      {
        document.getElementById("errorMsg").innerHTML = "Please Enter numbers only between 1 to 100";
      }
      else
      {
        var max = Math.max.apply(Math,tokens);
        var avg = sum/tokens.length;
        document.getElementById("average").innerHTML = avg;
        document.getElementById("maximum").innerHTML = max;
      }
    }
  }

  //Zipcodes code:

  function checkZipcodes(enteredZip) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var data = JSON.parse(xhttp.responseText) 
      var zips = data.zipcodes
      console.log(zips[0].zip);
      console.log("Entered zip is:"+zips.length)

      var zipValid = 0;
      for (i = 0; i < zips.length; i++) {
        if (enteredZip == zips[i].zip) 
        {
          zipValid = 1;
          document.getElementById("getCity").innerHTML = zips[i].city;
          document.getElementById("getState").innerHTML = zips[i].state;
          document.getElementById("errorZip").innerHTML = '';
        }
      }

      if (zipValid != 1)
      {
          document.getElementById("getCity").innerHTML = 'NA';
          document.getElementById("getState").innerHTML = 'NA';
          document.getElementById("errorZip").innerHTML = 'Please enter a valid zipcode';
      }
    }
  };
  xhttp.open("GET", "http://mason.gmu.edu/~rthota/testaccess/zipcodes.json", true);
  xhttp.send();
  }





//Onclick Validate function
  function validateFields()
  {
    var name = document.getElementById("name").value;
    var reName = /^[A-Za-z]+$/;
    var alertMsg = "";
    if(!reName.test(name))
    {
      document.getElementById("errorName").innerHTML = 'Please enter a valid name';
      document.getElementById("name").value = "";
      alertMsg += "Please enter a valid name\n";
    }
    else
    {
      document.getElementById("errorName").innerHTML = '';
    }


    var reStreet = /^[!*+=&^%$#<>()\[\]\\.,;:\s@"]+$/;
    var streetaddress = document.getElementById("streetaddress").value;
    if (streetaddress == '') 
    {
      document.getElementById("errorStreet").innerHTML = 'Please enter a streetaddress';
      document.getElementById("streetaddress").value = "";
      alertMsg += "Please enter a street address\n";
    }
    else
    {
      if(reStreet.test(streetaddress))
      {
        document.getElementById("errorStreet").innerHTML = 'Please enter a valid streetaddress';
        document.getElementById("streetaddress").value = "";
        alertMsg += "Please enter a valid street address\n";
      }
      else
      {
        document.getElementById("errorStreet").innerHTML = '';
      }
    }


    var reEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var email = document.getElementById("email").value;
    if (email == '') 
    {
      document.getElementById("errorEmail").innerHTML = 'Email id cannot be empty';
      document.getElementById("email").value = "";
      alertMsg += "Please enter an email id\n";

    }
    else
    {
      if(!reEmail.test(email))
      {
        document.getElementById("errorEmail").innerHTML = 'Please enter a valid Email id';
        document.getElementById("email").value = "";
        alertMsg += "Please enter a valid email id\n";
      }
      else
        document.getElementById("errorEmail").innerHTML = '';
    }

    var checkedNum = document.querySelectorAll('input[type="checkbox"]:checked').length
    if (checkedNum < 2) 
    {
      //document.querySelectorAll('input[type="checkbox"]').checked = false;
      alertMsg += "Please check atleast two checkboxes\n";
    }

    //var radioChecked = document.getElementsByName("interestInUniversity").checked
    var radioChecked = document.querySelector('input[name = "interestInUniversity"]:checked')
    if (radioChecked == null) 
    {
      alertMsg += "Please select a radio button";
    }

    if (alertMsg!='') 
    {
      alert(alertMsg);
      return false;
    }
    else
    {
      return true;
    }
  }

//Onclick FormReset function
  function FormReset()
  {
    document.getElementById("studForm").reset()
  }

</script> 

</body>
</html>
