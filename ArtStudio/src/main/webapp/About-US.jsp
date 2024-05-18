<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>ArtStudio</title>
 <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-rose-100 to-teal-100">
<%@include file="includes/Navbar.jsp" %>
<section class="overflow-hidden">
    <div class="px-4 mx-auto sm:px-6 lg:px-8 max-w-7xl">
        <div class="grid items-center grid-cols-1 md:grid-cols-2">

            <div>
                <h2 class="text-3xl font-bold leading-tight text-black sm:text-4xl lg:text-5xl">Hey, Welcome To The Art Studio..
                    <br class="block sm:hidden" />
                </h2>
                <p class="max-w-lg mt-3 text-xl leading-relaxed text-gray-600 md:mt-8">
                    Our artist specializes in creating beautiful, detailed charcoal and pencil sketches of people, places, and pets. 
                    Whether you are looking for a portrait sketch of a loved one, a custom sketch of your favorite vacation spot, or a commission of your friend, our artist has the skills and expertise to create a piece of art that you will treasure for a lifetime. 
                </p>

                <p class="mt-4 text-xl text-gray-600 md:mt-8">
                    <span class="relative inline-block">
                        <span class="absolute inline-block w-full bottom-0.5 h-2 bg-yellow-300"></span>
                    <span class="relative"> Want to surprise someone special? </span>
                    </span>
                    <br class="block sm:hidden" />Then order a <a href="order" title=""
                        class="transition-all duration-200 text-sky-500 hover:text-sky-600 hover:underline">Sketch</a>
                </p>
            </div>

            <div class="relative">
                <img class="absolute inset-x-0 bottom-0 -mb-48 -translate-x-1/2 left-1/2" src="https://cdn.rareblocks.xyz/collection/celebration/images/team/1/blob-shape.svg" alt="" />

                <img class="relative w-full xl:max-w-lg xl:mx-auto 2xl:origin-bottom 2xl:scale-110" src="https://cdn.rareblocks.xyz/collection/celebration/images/team/1/business-woman.png" alt="" />
            </div>

        </div>
    </div>
</section>

<%@include file="includes/footer.jsp" %>

</body>
</html>