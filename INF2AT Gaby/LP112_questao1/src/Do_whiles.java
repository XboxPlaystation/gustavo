/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author aluno
 */
public class Do_whiles {
    public static void main(String[] args) {
        int i = 1;
        int soma = 0;
        do{
            System.out.println("I: "+i);
            soma = soma+i;
            i++;
        }while (i <=100);
        System.out.println("A soma é de: "+soma);
    }
   
}
