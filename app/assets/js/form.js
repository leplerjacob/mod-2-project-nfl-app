var counter = 1;
var limit = 10;
console.log("hi")
addInput = (e) => {
    console.log("Hi")
    if (counter == limit)  {
        alert("You have reached the limit of adding " + counter + " inputs");
   }
   else {
        var newdiv = document.createElement('div');
        newdiv.innerHTML = "Entry " + (counter + 1) + " ";
        document.getElementById(form).appendChild(newdiv);
        counter++;
   }
   e.preventdefault();
}