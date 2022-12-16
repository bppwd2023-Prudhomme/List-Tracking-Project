document.addEventListener("turbo:load", function(){

  permissableBox = document.querySelector("#permissible_type");

  if(permissableBox != null){
    permissableBox.addEventListener("change", function(){
      
      $.ajax({
          url: "/permissions/permisChange",
          type: "get",
          data: {
            permType: permissableBox.value
          },
          success: function(data) {console.log("yuurrrr")},
          error: function(data) {console.log("bleeergh")}
      });
      
    })
  }

})