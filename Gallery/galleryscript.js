function SelectPicture(MyPicture) {

  if (document.getElementById("currentPicture")) {
    const element = document.getElementById("currentPicture");
    element.remove();
  }

  const GalleryElement = document.querySelector(".Gallery");
  GalleryElement.style.display = 'none';
  const CloseUpElement = document.querySelector(".CloseUp");
  CloseUpElement.style.display = 'block';
  const parentElement = document.querySelector(".MainCloseUp");
  const newElement = document.createElement('img');
  newElement.src = MyPicture;
  newElement.style.maxWidth = "90%";
  newElement.style.height = "auto";
  newElement.id = "currentPicture";
  newElement.style.maxHeight = "calc(100vh - 120px)";
  newElement.style.flex = 1;
  parentElement.appendChild(newElement);

  const CloseUpBarElement = document.querySelector(".CloseUpBar");
  if (CloseUpBarElement.childElementCount < 1 ) {
    AddPictures(".CloseUpBar","80px");
  }
  CloseUpBarElement.style.overflowX = "auto"; // Options: 'visible', 'hidden', 'scroll', 'auto'
  CloseUpBarElement.style.flexWrap = "nowrap";

  document.body.style.backgroundColor = "rgb(106, 106, 106)";

  history.pushState(null, null, window.location.href);
  window.addEventListener('popstate', CloseCloseUp);

 }
 
 function AddPictures(SectionName,PictureHeight) {
  const parentElement = document.querySelector(SectionName);
  const pictures = ["ChapelCake", "ChapelFlowers", "ChapelFront", "ChapelGate"];

  for (let i = 0; i < pictures.length; i++) {

    const newElement = document.createElement('img');
    newElement.src = '/gallery/images/'+pictures[i]+'.JPG';
    newElement.style.width = PictureHeight;
    newElement.style.height = "auto";
    newElement.onclick = function() {
    SelectPicture(this.src);
  };
    //newElement.onclick = SelectPicture(this);
    parentElement.appendChild(newElement); 
    
  }
} 

function CloseCloseUp() {
  const GalleryElement = document.querySelector(".Gallery");
  GalleryElement.style.display = 'block';
  const CloseUpElement = document.querySelector(".CloseUp");
  CloseUpElement.style.display = 'none';
  document.body.style.backgroundColor = "lightblue";
  window.removeEventListener('popstate', CloseCloseUp);
}

//const CloseXElement = document.querySelector(".CloseX");
//CloseXElement.onclick = CloseCloseUp();

AddPictures(".ImageGallery","200px");

const screenWidth = document.documentElement.clientWidth;
console.log(`Screen width: ${screenWidth}px`);