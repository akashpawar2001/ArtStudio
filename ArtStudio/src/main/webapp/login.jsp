<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Poppins"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
  </head>

  <style>
    body {
      font-family: "Poppins";
    }
    .custom-bg {
      position: relative;
    }

    .custom-bg::before {
      content: "";
      position: absolute;
      background-size: cover;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
        url("https://www.affordable.pk/uploads/blog/1641910889_Untitled%20design%20(7).jpg");
      opacity: 1; /* Keep opacity at 1 */

      z-index: -1;
    }
    .form_flex {
      display: flex;
      transition: transform 1s ease;
    }
    .flex-row-reverse {
      flex-direction: row-reverse;
    }
    .form_flex.slide-out {
      transform: translateX(5%);
    }
    .form_flex.slide-in {
      transform: translateX(-5%);
    }
  </style>
  <body class="bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 relative">
  <%String status=(String)request.getAttribute("STATUS"); %>
    <div class="mx-auto p-5 flex justify-center items-center pt-10">
      <div class="custom-bg bg-cover w-[800px] h-[450px] text-white">
        <div class="flex form_flex  ">
          <div class="bg-white md:w-[500px] w-full h-[450px] ">
            <form action="login"  class="block sign_in mx-auto">
              <!-- sign in form  -->
              <div
                class="w-full bg-white p-3 md:rounded-l-0 rounded-l-lg rounded-r-lg flex items-center justify-center text-gray-950 text-center relative"
              >
                <div class="p-5">
                  <div class="mb-5">
                    <div class="mb-2 flex items-center justify-center">
                      <a href="login" class="flex items-center gap-2">
                        <img src="images/icons8-artist-50.png" width="30px">ARTSTUDIO
                      </a>
                    </div>

                    <div
                      class="md:hidden block text-xl md:text-2xl mb-2 font-normal"
                    >
                      Hello Again!
                    </div>
                    <div
                      class="md:hidden block text-xs md:text-sm mb-2 font-normal text-gray-400"
                    >
                      welcome to the world of artStudio.
                    </div>
                  </div>
                  <div class="mb-[40px]">
                    <div class="relative mb-2">
                      <input
                        type="email"
                        id="floatingEmail"
                        name="userEmail"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatingEmail"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >Email</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <i class="fa-solid fa-at"></i>
                      </span>
                    </div>
                    <div class="relative mb-2">
                      <input
                        type="password"
                        id="floatingPassword"
                        name="userPassword"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatingPassword"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >Password</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <!-- Lock icon as inline SVG -->
                        <i class="fa-solid fa-lock"></i>
                      </span>
                    </div>

                    <div class="flex items-center justify-between">
                      <div class="text-xs text-gray-400">Remember me</div>
                      <div class="text-xs text-indigo-500 font-medium">
                        Recover Password
                      </div>
                    </div>
                  </div>
                  <%if(status!=null){ %>
                   <div class="mb-5"> 
                  <p class="text-red-500">Invalid Credential</p>
                  </div>
                  <%} %>
                  <div class="mb-5">
                    <button
                      class="w-full text-center text-white bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 rounded p-2 text-sm"
                    >
                      Login
                    </button>
                  </div>
                 
                  <div class="hidden md:flex md:items-center md:justify-center">
                    <div
                      class="mx-2 p-3 bg-white rounded-full shadow-lg text-center"
                    >
                      <i class="fa-brands fa-facebook-f text-indigo-500 "></i>
                    </div>
                    <div
                      class="mx-2 p-3 bg-white rounded-full shadow-lg text-center"
                    >
                      <i class="fa-brands fa-instagram text-orange-300"></i>
                    </div>
                    <div
                      class="mx-2 p-3 bg-white rounded-full shadow-lg text-center"
                    >
                      <i class="fa-brands fa-twitter text-sky-500"></i>
                    </div>
                    <div
                      class="mx-2 p-3 bg-white rounded-full shadow-lg text-center"
                    >
                      <i class="fa-brands fa-whatsapp text-green-300"></i>
                    </div>
                  </div>
                  <div
                    class="block md:hidden absolute bottom-7 left-0 right-0 flex justify-center items-center text-sm text-gray-400"
                  >
                    Don't have an account yet ?
                    <span
                      class="font-bold text-indigo-500 mx-1 cursor-pointer"
                      id="showSignUpFrom"
                      >Sign up</span
                    >
                  </div>
                </div>
              </div>
            </form>

            <form action="createUser" class="sign_up hidden mx-auto">
              <div
                class="w-full bg-white p-3 md:rounded-l-0 rounded-l-lg rounded-r-lg flex items-center justify-center text-gray-950 text-center relative"
              >
                <div class="p-5">
                  <div class="mb-5">
                    <div class="mb-2 flex items-center justify-center">
                       <a href="login" class="flex items-center gap-2">
                        <img src="images/icons8-artist-50.png" width="30px">ARTSTUDIO
                      </a>
                    </div>

                    <div
                      class="md:hidden block text-xl md:text-2xl mb-2 font-normal"
                    >
                      Welcome To Family !
                    </div>
                    <div
                      class="md:hidden block text-xs md:text-sm mb-2 font-normal text-gray-400"
                    >
                      welcome to the world of artStudio.
                    </div>
                  </div>
                  <div class="mb-[7px]">
                    <div class="relative mb-2">
                      <input
                        type="text"
                        id="floatingfName"
                        name="firstName"
                        required="required"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatingfName"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >First Name</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <!-- Lock icon as inline SVG -->
                        <i class="fa-solid fa-user"></i>
                      </span>
                    </div>
                    <div class="relative mb-2">
                      <input
                        type="text"
                        id="floatinglName"
                        name="lastName"
                        required="required"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatinglName"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >Last Name</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <!-- Lock icon as inline SVG -->
                        <i class="fa-solid fa-user"></i>
                      </span>
                    </div>
                    <div class="relative mb-2">
                      <input
                        type="email"
                        id="floatingEmail"
                        name="emailAddress"
                        required="required"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatingEmail"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >Email</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <i class="fa-solid fa-at"></i>
                      </span>
                    </div>
                    <div class="relative mb-2">
                      <input
                        type="tel"
                        id="floatingContact"
                        name="contact"
                        required="required"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatingContact"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >Contact</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <i class="fa-solid fa-at"></i>
                      </span>
                    </div>
                    <div class="relative mb-2">
                      <input
                        type="password"
                        id="floatingPassword"
                        name="password"
                        required="required"
                        class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-950 bg-transparent border border-t-0 border-r-0 border-l-0 border-gray-400 appearance-none focus:outline-none focus:ring-0 focus:border-indigo-600 peer"
                        placeholder=""
                      />
                      <label
                        for="floatingPassword"
                        class="absolute text-sm text-gray-500 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white px-2 peer-focus:px-2 peer-focus:text-indigo-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1"
                        >Password</label
                      >
                      <span
                        class="absolute top-1/2 right-2 -translate-y-1/2 text-gray-400"
                      >
                        <!-- Lock icon as inline SVG -->
                        <i class="fa-solid fa-lock"></i>
                      </span>
                    </div>

                    
                  </div>
                  <div class="mt-5">
                    <button
                      class="w-full text-center text-white bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 rounded p-2 text-sm"
                    >
                      Register
                    </button>
                  </div>
                 
                  <div
                    class="block md:hidden mt-10 flex justify-center items-center text-sm text-gray-400"
                  >
                    Already a member ?
                    <span
                      class="font-bold text-indigo-500 mx-1 cursor-pointer"
                      id="showSignInFrom"
                      >Sign in</span
                    >
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div
            class="hidden buttons md:flex md:items-center md:justify-center mx-auto h-full"
          >
            <div
              class="mt-5 signup block text-center w-[230px] text-center"
              id="signupButton"
            >
              <div class="mb-2">
                <span class="md:text-2xl lg:text-3xl text-xl">Hello Again</span>
              </div>
              <div>
                <span class="mt-2 text-sm text-gray-300"
                  >Lorem ipsum dolor sit amet consectetur adipisicing.
                </span>
              </div>
              <button
                class="mx-auto mt-[230px] w-[90px] p-3 border border-gray-300 text-center rounded-full text-sm"
              >
                Sign Up
              </button>
            </div>
            <div class="mt-5 signin hidden text-center" id="signinButton">
              <div class="mb-2">
                <span class="md:text-2xl lg:text-3xl text-xl"
                  >Be a member !</span
                >
              </div>
              <div>
                <span class="mt-2 text-sm text-gray-300"
                  >Lorem ipsum dolor sit amet consectetur adipisicing elit.
                </span>
              </div>
              <button
                class="mx-auto mt-[230px] w-[90px] p-3 border border-gray-300 text-center rounded-full text-sm"
              >
                Sign In
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      const showSignUpFrom = document.getElementById("showSignUpFrom");
      const showSignInFrom = document.getElementById("showSignInFrom");
      const signupButton = document.getElementById("signupButton");
      const signinButton = document.getElementById("signinButton");
      const signUpForm = document.querySelector(".sign_up");
      const signInForm = document.querySelector(".sign_in");
      const parentDiv = document.querySelector(".form_flex");

      showSignUpFrom.addEventListener("click", function () {
        signUpForm.classList.remove("hidden");
        signUpForm.classList.add("block");
        signInForm.classList.remove("block");
        signInForm.classList.add("hidden");
      });
      showSignInFrom.addEventListener("click", function () {
        signUpForm.classList.remove("block");
        signUpForm.classList.add("hidden");
        signInForm.classList.remove("hidden");
        signInForm.classList.add("block");
      });

      signupButton.addEventListener("click", function () {
        signUpForm.classList.remove("hidden");
        signUpForm.classList.add("block");
        signInForm.classList.remove("block");
        signInForm.classList.add("hidden");
        signupButton.classList.add("hidden");
        signinButton.classList.remove("hidden");
        parentDiv.classList.remove("slide-in");
        parentDiv.classList.add("slide-out");
        parentDiv.classList.add("flex-row-reverse");
      });

      signinButton.addEventListener("click", function () {
        signUpForm.classList.add("hidden");
        signUpForm.classList.remove("block");
        signInForm.classList.add("block");
        signInForm.classList.remove("hidden");
        signupButton.classList.remove("hidden");
        signinButton.classList.add("hidden");
        parentDiv.classList.remove("slide-out");
        parentDiv.classList.add("slide-in");
        parentDiv.classList.remove("flex-row-reverse");
      });
      setTimeout(()=>{
    	  document.getElementById('toast-message').classList.add("hidden");
      },2000)
      
    </script>
  </body>
</html>