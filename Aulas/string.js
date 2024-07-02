//.length
const meuNome = 'Leonardo de Souza'
console.log(meuNome.length)//17

//charAt()
console.log("Leonardo".charAt(0)) //n

//indexOf()
console.log('Leonardo'.indexOf('o')) //2

//toUpperCase() e toLowerCase()
console.log('leonardo'.toUpperCase) //LEONARDO
console.log('LEONARDO'.toLocaleLowerCase) //leonardo

//slice()
let frase= "Mergulhando em tecnologia."
console.log(frase.slice(0,11)) // Mergulhando

//replace()

let comunicacao = " Olá, sr. nomeusuario!.";
console.log(comunicacao.replace("nomeusuario",'André')); // Olá, André

//concat()
let novaString = "Programe nas principais linguagens e plataformas: ";
console.log(novaString.concat("JavaScript,").concat(" Python,").concat(" e C#."))
//Programe nas principais linguagens e plataformas: javascript, python, e c#

//split()
let linguagens = "JavaScript;Java;C#;PHP;Python;Go;Vb;SQL;C;C++";
let arrayLinguagens = linguagens.split(";");
console.log(arrayLinguagens) // [JavasScript,Java,C#]

//trim()
let login = "      leo@emailteste.com     ";
let loginSemEspaco = login.trim();
console.log(loginSemEspaco); //leo@emailteste.com