<?php

//Adicionar as notas dentro do Array!
$ListaDeNotas = ["25", 10, 5.9, 4.99999];

function validationApproved($ListaDeNotas)
{

    $results = [];

    foreach ($ListaDeNotas as $value) {
        if (!is_numeric($value) || $value < 0 || $value > 10) {
            echo (array_push($results, "Item invalido!"));
        }
    }

    foreach ($ListaDeNotas as $value) {
        if ($value < 5 && is_numeric($value)) {
            echo (array_push($results, "Reprovado!"));
        } elseif ($value < 7 && is_numeric($value)) {
            echo (array_push($results, "Exame!"));
        } elseif ($value < 11 && is_numeric($value)) {
            echo (array_push($results, "Aprovado!"));
        }
    }

    print_r($results);

}

validationApproved($ListaDeNotas);
