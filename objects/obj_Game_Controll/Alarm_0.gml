/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Seleção de obstaculos
var _obstacles = choose(obj_Obstacle_Big, obj_Obstacle_small);

//Criando os obstaculos
instance_create_layer(1120, 544, "Obstacles", _obstacles);

alarm[0] = 60 * random_range(.5, 2);




