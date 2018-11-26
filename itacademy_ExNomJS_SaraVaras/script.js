//Array nombre
var nombre = ['S', 'A', 'R', 'A'];
//Array apellido
var apellido = ['V', 'A', 'R', 'A', 'S'];
//Array fullname
var FullName = [];
FullName.push(nombre + ', ,' + apellido);
console.log(FullName);
//Función map
var contador = new Map()

//bucle para leer array 
for (x=0;x<nombre.length;x++){

    //condicional que detecta si hay algun número dentro del array y lo muestra en consola
    if (isNaN(nombre[x])==false){
        console.log(nombre[x], 'Els noms de persones no contenen números!')
    }
    //condicional que detecta si la letra es vocal o consonante y lo muestra en consola
    else if (nombre[x]=='A' || nombre[x]=='E' || nombre[x]=='I'|| nombre[x]=='O' ||nombre[x]=='U' ){
        console.log(nombre[x], 'és VOCAL')
    }
    else{
        console.log(nombre[x], 'és CONSONANT')
    }
    
    
}
//función map(contador letras)
nombre.forEach(function(letra) {
    if (contador.has(letra)) {
       contador.set(letra, contador.get(letra) + 1)
 } else {
   contador.set(letra, 1)
 }
});

console.log(contador);




