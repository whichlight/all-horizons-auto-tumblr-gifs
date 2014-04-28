var setup;
var draw;

$("document").ready(function(){

  var frames = [];
  var saveFrames = false;
  var time=0;
  var lights = [];
  var DECAY = random(0.15,0.9); //0.15 to 0.9
  var DURATION= random(2,5); //2 to 5
  var RATE_BIRTH = Math.floor(random(5,20)); //from 5 to 25

  var front = random(1);
  var back = random(1);
  var fsat = random(1);
  var bsat = random(1);
  var saved = false;
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/?num='+RATE_BIRTH, true);
            xhr.send();

  setup = function(){
    createGraphics(600,600);
    colorMode("hsb");//all 0 to 1
    console.log('setup done');
  }

  draw = function() {
    noStroke();
    fill(back,bsat,1);
    rect(0, 0, width, height);

    if(time%RATE_BIRTH==0){
      lights.push(new LightBar());
    }

    for (var i=0; i<lights.length; i++) {
      lights[i].display();
      lights[i].update();
      if(lights[i].y>height/DURATION+20){
        lights.splice(i,1);


        if(saveFrames==true){
          saveFrames=false;
          //done
          if(saved){


          }
        }
        if(!saved){


            saveFrames=true;
            saved = true;
        }
      }
    }

    if (saveFrames) {
      var img =  document.getElementsByTagName("canvas")[0].toDataURL();
      var png = img.split(',')[1];
      console.log("image saving: " + time);
      uploadImage(png);
    }
    time++;

  }

  function uploadImage(data){
      var xhr = new XMLHttpRequest();
      xhr.open('POST', '/', true);
      xhr.setRequestHeader("Content-Type", 'image/png')
      xhr.send(data);
  }

  function LightBar() {
    this.y = 5;
  }

  LightBar.prototype.update = function(){
    this.y++;
  }

  LightBar.prototype.display = function() {
    noStroke();
    var alpha =255*(1-Math.pow(((DURATION*this.y)/height),DECAY));
    if(alpha<1){alpha=1;}
    fill(front,fsat,1, alpha);
    rect(0, height/2-this.y, width, 2*this.y);
  }
});
