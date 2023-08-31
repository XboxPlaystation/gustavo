/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lp112_questao2;

import java.util.Scanner;

/**
 *
 * @author aluno
 */
public class fors {
    public static void main(String[] args) {
        //Elabore um programa em que o usuário informe um número e imprima todos os
        //números de 1 até o número informado.
        
        Scanner scan = new Scanner(System.in);
        System.out.println("Informe um número: ");
        int numero = scan.nextInt();
        for (int i = 1; i <= numero; i++){
            System.out.println("i: "+i);
        }
    }
}
