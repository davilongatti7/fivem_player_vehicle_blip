# Carro do Player / Player Vehicle Blip

## PT-BR

Script simples para FiveM que mostra o blip do veículo do jogador no mapa, mesmo quando ele sai do carro. O blip aparece se for o veículo do jogador ou se ele estiver dirigindo.

### Como usar

1. Coloque a pasta do script dentro de `resources` do seu servidor.
2. No `server.cfg`, adicione:
   ```txt
   ensure fivem_player_vehicle_blip
   ```
3. Reinicie o servidor ou carregue o recurso.

### Arquivos

- `client.lua`: lógica do blip do veículo
- `fxmanifest.lua`: configuração do recurso

## EN

Simple FiveM script that shows the player's vehicle blip on the map even when the player exits the car. The blip appears if the vehicle belongs to the player or if the player spawned it.

### How to use

1. Put the script folder into your server's `resources` directory.
2. In `server.cfg`, add:
   ```txt
   ensure fivem_player_vehicle_blip
   ```
3. Restart the server or start the resource.

### Files

- `client.lua`: vehicle blip logic
- `fxmanifest.lua`: resource config
