// ajax request to create line item
var createLineItem = function(colour, designId, size, qty, top, left, widthRatio, heightRatio){
  $.ajax({
    url: "/line_items",
    method: "POST",
    dataType: "JSON",
    data: {
      colour: colour,
      design_id: designId,
      size: size,
      qty: qty,
      top: top,
      left: left,
      width_ratio: widthRatio,
      height_ratio: heightRatio
    },
    success: function(data){ // update cart icon with number of items in cart
      $('.cart-confirm').html('<i class="fa fa-check" aria-hidden="true"></i>');
      // alert("item added to basket")
      console.log(data);
      if (data > 1){
        $(".fa-shopping-cart > span").text( " " + data + " items").css({
          fontFamily: "Helvetica",
          fontSize: "1.1em",
          fontWeight: "bold"
        });
      } else {
        $(".fa-shopping-cart").text( " " + data + " item").css({
          fontFamily: "Helvetica",
          fontSize: "1.1em",
          fontWeight: "bold"
        });
      }
      $("#qty").val(""); // reset qty field to empty
      $('#size option').prop('selected', function() { // reset size option dropdown to default 'S'
         return this.defaultSelected;
 });
      // $("#size").val("");
    },
    error: function(){
      alert("Something has gone wrong while adding item to your basket")
    }
  });
}

$(document).ready(function(){
  $(document).on("click", ".colour_thumbnail", function(){ // select t-shirt colour and update the shirt display
    var imgSrc = $(this).attr("img_src");
    var colour = $(this).attr("colour");
    // console.log("Taking the selected shirt colour")

    $("#tshirtTemplate").html(""); // clear the tshirtTemplate div to append new version
    $("#tshirtTemplate").append($("<img>").attr("src", imgSrc).attr("class", "tshirt").attr("colour", colour));
  });

  $(document).on("click", ".design_thumbnail", function(){ // select design to apply on t-shirt
    $(".design_container").html(""); // clear the design_container so there's only 1 design at a time
    var designUrl = $(this).attr("img_src");
    var designId = $(this).attr("id");
    var userUpload = $(this).attr("uploaded");
    console.log(userUpload)
    var $designImg = $("<img>").attr("src", designUrl).addClass("design_img").attr("id", designId);
    var $designContainer = $("<div>").addClass("design_container").append($designImg);

    if(userUpload == "true"){ // apply mix-blend-mode darken effect on user-uploaded design to make it appear like a png
      $designImg.css ({
        width: "180px",
        mixBlendMode: "darken"
      });
    } else {
      $designImg.css ({
        width: "180px"
      });
    };
    $designContainer.css({ // ensure position of the design can be placed on top of the t-shirt
      top: "160px",
      left: "170px",
      position: "absolute"
    });
    $(".main-container").append($designContainer);
    $designContainer.draggable(); // jquery draggable function to make the image draggable
    $designImg.resizable({
      aspectRatio: true,
      maxWidth: 200,
      containment: "#tshirtTemplate"
    });
    // $designImg.append("<div>").attr("id", "segrip");// jquery resizable function to make the image resizable
  });

  $("button").on("click", function(){
    var top = $(".design_container").position().top - $(".tshirt").position().top; // record the top position of the design image
    var left = $(".design_container").position().left - $(".tshirt").position().left; // record the left position of the design image
    var tshirtWidth = $(".tshirt").css("width");
    var tshirtHeight = $(".tshirt").css("height");
    var width = $(".design_img").css("width");
    var height = $(".design_img").css("height");
    var widthRatio = (parseInt(width.substr(0, width.length - 2)) / parseInt(tshirtWidth.substr(0, tshirtWidth.length - 2))).toFixed(2); // convert widths to integers and calculate ratios
    var heightRatio = (parseInt(height.substr(0, height.length - 2)) / parseInt(tshirtHeight.substr(0, tshirtHeight.length - 2))).toFixed(2);// convert heights to integers and calculate ratios
    console.log('recording image size and placement ratios')
    // console.log(width)
    // console.log(height)
    // console.log(tshirtWidth)
    // console.log(tshirtHeight)
    // console.log(widthRatio)
    // console.log(heightRatio)

    var colour = $(".tshirt").attr("colour");
    var designId = $(".design_img").attr("id");
    var qty = $("#qty").val();
    var size = $("#size").val();

    createLineItem(colour, designId, size, qty, top, left, widthRatio, heightRatio);
  });

  // cloudinary upload image function as an ajax request
  if($.fn.cloudinary_fileupload !== undefined) {
    $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();

    $('input.cloudinary-fileupload[type=file]').bind('fileuploadprogress', function(e, data) {
      var $msg = $("<span>").html("uploading image...")
      $('.progress_msg').append($msg);
    });

    $('input.cloudinary-fileupload[type=file]').unsigned_cloudinary_upload("mvmwmezx",
      { cloud_name: 'djvkbcwjg', tags: 'browser_uploads' },
      { multiple: true }
    ).bind('cloudinarydone', function(e, data) {
      $.ajax({
        url: "/designs",
        method: "POST",
        dataType: "JSON",
        data: {
          design:{
            img_src: data.result.secure_url,
            width: data.result.width,
            length: data.result.height,
            name: data.result.original_filename
          }
        },
        success: function(data){
          // var $msg = $("#upload-msg").html("uploading image...")
          var $span = $("<span>").addClass("design_thumbnail").attr("img_src", data.img_src).attr("id", data.id).attr("uploaded", "true");
          $img = $("<img>").attr("src", data.img_src);

          $span.append($img);

          $("#design_container").append($span); // append to the rest of the design container
          $('.progress_msg').html("");

        },
        error: function(){
          alert("Something has gone wrong while saving your image on our server")
        }
      })
    })
  }
})
