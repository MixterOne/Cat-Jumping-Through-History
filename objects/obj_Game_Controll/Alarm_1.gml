/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _flying_Enemy = choose(obj_Flying_Enemy);

instance_create_layer(1056, 480, "Enemys", _flying_Enemy);

alarm[1] = 60 * random_range(2, 4);




