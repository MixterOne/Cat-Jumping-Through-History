/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Verifica se o player está presente
if (instance_exists(obj_Player))
{
	// Atualiza distância percorrida com base na velocidade do jogador
	total_distance += obj_Player.velo_cat;

	// Debug: mostrar distância no console
    show_debug_message("Distância: " + string(total_distance));

	// Calcular o nível com base na distância
	var _calculated_level =  floor(total_distance / distance_per_level)
	
	// Se avançou de nível
	if (_calculated_level > current_level && _calculated_level <= max_level)
	{
		current_level = _calculated_level;
	
		if (current_level < max_level)
		{
			chance_to_new_level(); // mudar para novo nivel;
		}
		else if (!boss_spawned) 
		{
			spawnar_boss(); // spawna o boss da fase
			boss_spawned = true;
		}
	}
}

//Funções

function chance_to_new_level()
{
	// Aumenta a dificuldade (exemplo)
	if (enemy_spawn_rate > 10) {
        enemy_spawn_rate -= 5;
    }
	
	 // Trocar cenário, inimigos, etc.
    show_debug_message("Nível " + string(current_level) + " iniciado");
	
	// Troca de fundo, spawnar novos tipos de inimigo, etc
}

function spawnar_boss() {
    // Cria o boss mais à frente do jogador
    var boss_x = obj_Player.x + 400;
    var boss_y = obj_Player.y - 32;

    instance_create_layer(boss_x, boss_y, "Enemys", obj_Boss_L1);

    show_debug_message("BOSS apareceu!");
}

