/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author aluno
 */
public class Fors {
    public static void main(String[] args) {
       // Criar um programa que imprima todos os números de 1 até 100 e a soma deles ao
        //final.
        int soma = 0;
        for (int i = 1; i <=100;i++){
            System.out.println("I: "+i);
            soma = soma+i;
            //soma += i; (pode ser assim tmb)
        }
        System.out.println("A soma é: "+soma);
    }
}
