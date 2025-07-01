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

