/**
 * 
 */
 console.log('coffeeTest js')
 
 let testRow = document.querySelectorAll('.row_in')
 let cnt = 0;
 testRow.forEach(function(e,index){
 
 	testRow[index].addEventListener('mouseover',function(){
 		
 		let paths = testRow[index].querySelectorAll('path')
 		paths.forEach(function(e,index){
 			paths[index].classList.add('hover_path')
 		})
 		testRow[index].querySelector('h3').classList.add('hover_txt')
 		testRow[index].querySelector('p').classList.add('hover_txt')
 	})
 	
 	testRow[index].addEventListener('mouseout',function(){
 		
 		let paths = testRow[index].querySelectorAll('path')
 		paths.forEach(function(e,index){
 			paths[index].classList.remove('hover_path')
 		})
 		testRow[index].querySelector('h3').classList.remove('hover_txt')
 		testRow[index].querySelector('p').classList.remove('hover_txt')
 		
 	})
 })
 
 function onclickA(type_num){
 	let nowTurn = parseInt(document.querySelector('.now_turn').value)
 	
	if(nowTurn<6){
 		location.href=`bean_test.do?turn=${nowTurn+1}&type=${type_num}`
 	}else{
 		location.href=`bean_test_result.do`
 	}
 }