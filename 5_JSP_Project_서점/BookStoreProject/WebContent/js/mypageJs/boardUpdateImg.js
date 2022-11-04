/**
 * 
 */
 	
 $(()=>{
	
	console.log('boardUpdateimg');
	let count = 0;

    function deleteImg(){
        let button = document.querySelector(".board-table_beFile_btn")
        let imgDiv = document.querySelector(".img")
        let imgResult = document.querySelector(".board_beimage_result").value
        let imgNew = document.querySelector(".board-table_inputFile")
        
        if(count == 0 ){
            count ++;
            button.classList.add('clicked')
            imgDiv.classList.add('clicked_btn')
            imgResult = count
            imgNew.removeAttribute("disabled",false) 
            
        }else{
            button.classList.remove('clicked')
            imgDiv.classList.remove('clicked_btn')
            count = 0
            imgResult = count
            imgNew.setAttribute("disabled",true)
        }
        
    }
	
	
})	
 	