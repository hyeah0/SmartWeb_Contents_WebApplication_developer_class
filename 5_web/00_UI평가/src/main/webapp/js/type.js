// 패널 클릭시 클릭된 이미지만 active 클래스 추가되고 나머지는 active 클래스 삭제된다.

const panels = document.querySelectorAll('.panel');
const texts = document.querySelectorAll(".text");

function removeActiveClasses(){
    panels.forEach((panel)=>{
        panel.classList.remove('active');
    })
    texts.forEach((text)=>{
        text.classList.add('hidden');
    })
}

panels.forEach((panel, index)=>{
    panel.addEventListener('click', () =>{
        removeActiveClasses();
        panel.classList.add('active');
        
        texts[index].classList.remove('hidden');
        // console.log(panels + index + "/" + texts[index]);
    })
})