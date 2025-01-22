void main() {
  int idade = 69;
  if(idade < 16){
    print("Não vota");
  }else if(idade >=16&& idade <18){
    print("Voto optativo");
  }else if(idade >=18&& idade <70){
    print ("Voto obrigatório");
  }else{
    print ("Voto Facultativo");
  }
}