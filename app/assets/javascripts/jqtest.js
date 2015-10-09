$(document).ready(
    function(){
        $('.divtest').click(
            function(){
                $('.divtest').fadeOut('slow');
            }
        );
		$('.divtest1').click(
            function(){
                $('.divtest1').fadeTo('slow',0.5);
            }
        );
		
		$('.pull-me').click(function(){
			$('.panel').slideToggle(1000)
			}
		);
		
		
    }
);