$(document).ready(function(){
var sh=$(this).next().css("display");
var pb=$(".paraBtn");
$(".paraBtn").click(function(){
	var sh=$(this).next().css("display");
    $(this).next().slideToggle("500");
	if(sh=="none"){$(this).children("p").html("-")}
	else{$(this).children("p").html("+")}
  });
$("#showAll").click(function(){
	pb.next().show("500");
	pb.children("p").html("-");
	$("#showAll").css("display","none");
	$("#hideAll").css("display","block");
	});
$("#hideAll").click(function(){
	pb.next().hide("500");
	pb.children("p").html("+");
	$("#hideAll").css("display","none");
	$("#showAll").css("display","block");
	});
});

$(document).ready(function(){
$("#size").click(function(){
    $("#funBox").slideUp("slow");
	$("#sizeBox").slideDown("slow");
	$("#paraBox	").slideUp("slow");
	$("#xxBox").slideUp("slow");
	$("#size").addClass("pmOnclick");
	$("#function").removeClass("pmOnclick");
	$("#para").removeClass("pmOnclick");
	$("#xx").removeClass("pmOnclick");
  });
 $("#function").click(function(){
    $("#funBox").slideDown("slow");
	$("#sizeBox").slideUp("slow");
	$("#paraBox	").slideUp("slow");
	$("#xxBox").slideUp("slow");
	$("#size").removeClass("pmOnclick");
	$("#function").addClass("pmOnclick");
	$("#para").removeClass("pmOnclick");
	$("#xx").removeClass("pmOnclick");
  });
  $("#para").click(function(){
    $("#funBox").slideUp("slow");
	$("#sizeBox").slideUp("slow");
	$("#paraBox	").slideDown("slow");
	$("#xxBox").slideUp("slow");
	$("#size").removeClass("pmOnclick");
	$("#function").removeClass("pmOnclick");
	$("#para").addClass("pmOnclick");
	$("#xx").removeClass("pmOnclick");
  });
   $("#xx").click(function(){
    $("#funBox").slideUp("slow");
	$("#sizeBox").slideUp("slow");
	$("#paraBox	").slideUp("slow");
	$("#xxBox").slideDown("slow");
	$("#size").removeClass("pmOnclick");
	$("#function").removeClass("pmOnclick");
	$("#para").removeClass("pmOnclick");
	$("#xx").addClass("pmOnclick");
  });
});
