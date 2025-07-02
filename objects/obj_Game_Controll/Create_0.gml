/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

alarm[0] = 60;
alarm[1] = 60;

// distancia total percorrida
total_distance = 0;

// Nível e fase
current_level = 1;
current_stage = 1;
max_level = 5; // sempre termina com o boss no nível 5
distance_per_level = 1000; // distancia por nivel

// Controle do boss
boss_spawned = false;

// Controle de dificuldade (exemplo)
enemy_spawn_rate = 60;

show_debug_message("Controle iniciado - Fase 1, Nível 1");
