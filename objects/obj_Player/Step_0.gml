/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

velo_cat = 6;


//---Movimentação do jogador---

if (keyboard_check(ord("D")) or keyboard_check(vk_right))
{
	if (x < room_width - 32) // Limite da direita
	{
		x += velo_cat;
	}
	else
	{
		x = room_width - 32; // Corrige se ultrapassar
	}
}

if (keyboard_check(ord("A")) or keyboard_check(vk_left))
{
	if (x > 0) // Limite da esquerda
	{
		x -= velo_cat;
	}
	else
	{
		x = 0; // Corrige se ultrapassar
	}
}

//Checando posição Y

if (y >= 544)
{
	//Verificando se está no chão
	y = 544;
	force_jump = 0;
	if (keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up))
	{
		force_jump = force_jump - 18;
	}
	
	//Player Down
	if (keyboard_check(ord("S")) or keyboard_check(vk_down))
	{
		//Mudando a Sprite
		sprite_index = spr_Player_Down;
	}else
	{
		sprite_index = spr_Player
	}
}
else
{
	// Fazendo o player cair mais rapido
	if (keyboard_check(ord("S")) or keyboard_check(vk_down))
	{
		grav_game = 2;
	}
	else
	{
		grav_game = 0.7;
	}
	//Gravidade para fazer cair
	force_jump += grav_game;
}

//Alterando eixo Y
y = y + force_jump;


// Sistema de armas - Seleção

// Trocar de arma com as teclas 1, 2, 3
if (keyboard_check_pressed(ord("1"))) arma_selecionada = 0;
if (keyboard_check_pressed(ord("2"))) arma_selecionada = 1;
if (keyboard_check_pressed(ord("3"))) 
{
	arma_selecionada = 2;
}


if (instance_exists(obj_arma_instanciada)) {
    with (obj_arma_instanciada) instance_destroy();
}

switch (arma_selecionada) {
    case 0:
        //obj_arma_instanciada = instance_create_layer(x, y, "Instances", obj_arma_pistola);
        break;
    case 1:
        //obj_arma_instanciada = instance_create_layer(x, y, "Instances", obj_arma_shotgun);
        break;
    case 2:
        obj_arma_instanciada = instance_create_layer(x, y - 32, "Instances", obj_Pistol);
        break;
}

// Controle de cooldown de tiro
if (!pode_atirar) {
    tempo_tiro += 1;
    if (tempo_tiro >= cooldown_tiro) {
        pode_atirar = true;
        tempo_tiro = 0;
    }
}

// Atirar (botão esquerdo do mause)
if (mouse_check_button_pressed(mb_left) && pode_atirar) {
    pode_atirar = false;

    switch (arma_selecionada) {
        case 0: 
            //instance_create_layer(x + 16, y, "Tiros", obj_bullet_pistola);
            break;

        case 1: // Shotgun (3 projéteis)
            //for (var i = -1; i <= 1; i++) {
            //    var t = instance_create_layer(x + 16, y, "Tiros", obj_bullet_shotgun);
            //    t.direction = i * 15; // ângulo de dispersão
            //}
            break;

        case 2: // Pistola
			
            var alvo = noone;
		    var menor_dist = 10000; // número alto o suficiente

		    // Procurar inimigo mais próximo
		    with (obj_Enemy_Base) {
		        var dist = point_distance(other.x, other.y, x, y);
		        if (dist < menor_dist) {
		            menor_dist = dist;
		            alvo = id;
		        }
		    }

		    var laser = instance_create_layer(x + 16, y, "Bullet", obj_Bullet_Laser);

		    if (instance_exists(alvo)) {
		        laser.direction = point_direction(laser.x, laser.y, alvo.x, alvo.y);
		    } else {
		        laser.direction = 0; // segue reto se não tiver alvo
		    }
		            break;
		    }
}

