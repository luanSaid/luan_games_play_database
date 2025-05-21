# 🎮 Projeto de Banco de Dados para um site fictício de distribuição gratuita de jogos e aplicativos (luan_games_play)

Projeto desenvolvido como trabalho final da disciplina de **Banco de Dados**, no curso de **Ciência da Informação**.

## 🧠 Descrição do Projeto

Este projeto simula o banco de dados de um **site que oferece downloads gratuitos de jogos e aplicativos**, além de promover **torneios virtuais** relacionados aos jogos disponíveis.

O sistema contempla regras de negócio específicas, gestão de clientes, torneios, downloads e desenvolvedores, utilizando modelagem relacional e comandos SQL para manipulação dos dados.

---

## 🏗️ Cenário

- O site permite que usuários baixem **jogos e aplicativos originais, gratuitos e autorizados pelos desenvolvedores**.
- Oferece uma variedade de gêneros de jogos (ação, luta, suspense, estratégia, etc.) e aplicativos (redes sociais, editores, ferramentas e outros).
- Organiza **torneios virtuais e presenciais**, sendo obrigatório que cada usuário esteja vinculado a um torneio.
- **Cada cliente só pode participar de um único torneio por vez**, conforme exigência dos patrocinadores, para maximizar o alcance e a divulgação.
- As premiações dos torneios são feitas em **coins**, uma moeda virtual utilizada para adquirir melhorias no próprio torneio (ex.: habilidades, armas, skins, etc.).
- **Jogos e aplicativos são multiplataforma**, funcionando em diferentes sistemas operacionais.
- O lucro do site vem de **parcerias e merchandising** das marcas e consoles, através dos torneios promovidos.

---

## 🔗 Regras de Negócio

- 🎯 Cadastro obrigatório para clientes, contendo: nome, idade, sexo, login, senha, número de vitórias e código do torneio.
- 🎮 Cada jogo possui: nome, descrição, tamanho e código.
- 📱 Cada app possui: nome, descrição, tamanho e código.
- 🖥️ Cada plataforma possui: nome, versão e código.
- 👨‍💻 Cada desenvolvedor possui: nome, empresa e código.
- 🏆 Cada torneio possui: nome, modalidade, número de vagas, coin (prêmio) e código do local.
- 💰 Cada patrocinador possui: nome, verba e código do torneio.
- 📍 Cada local possui: nome e código.

### 🔸 Relacionamentos:

- Cada usuário pode baixar vários jogos e aplicativos.
- Cada jogo/aplicativo pode estar vinculado a vários usuários.
- Cada torneio pode ter um ou mais jogadores.
- Cada cliente pode participar de **apenas um torneio**.
- Cada torneio pode ter um ou mais patrocinadores.
- Cada patrocinador pode financiar vários torneios.
- Cada torneio ocorre em um local (físico ou virtual).
- Cada local pode sediar vários torneios.
- Jogos e aplicativos são compatíveis com múltiplas plataformas.
- Cada plataforma roda diferentes jogos e aplicativos.
- Jogos e aplicativos podem ser desenvolvidos por um ou mais desenvolvedores.
- Cada desenvolvedor pode criar um ou mais jogos/aplicativos.

---

## 🗺️ Modelo Relacional

| Entidade        | Atributos                                                                |
|-----------------|---------------------------------------------------------------------------|
| **local**        | nome, codigo                                                             |
| **torneio**      | nome, modalidade, n_vaga, coin, codigo_local, codigo                    |
| **patrocinador** | nome, verba, codigo_torneio, codigo                                     |
| **cliente**      | nome_cliente, idade, sexo, login, senha, n_vitoria, codigo_torneio, codigo |
| **app**          | nome, descricao, tamanho, codigo                                        |
| **jogo**         | nome, descricao, tamanho, codigo                                        |
| **desenvolvedor**| nome, empresa, codigo                                                   |
| **plataforma**   | nome, versao, codigo                                                    |
| **plataApp**     | codigo_app, codigo_plata, codigo                                        |
| **plataJogo**    | codigo_jogo, codigo_plata, codigo                                       |
| **baixaApp**     | codigo_cliente, codigo_app, codigo                                      |
| **baixaJogo**    | codigo_cliente, codigo_jogo, codigo                                     |
| **desenvolApp**  | codigo_desenvol, codigo_app, codigo                                     |
| **desenvolJogo** | codigo_desenvol, codigo_jogo, codigo                                    |

---

## 🏛️ Tecnologias Utilizadas

- SQL (MySQL) através do Cloud SQL Studio (Google Cloud Plataform);
- MySQL Workbench.

---

## 🚀 Funcionalidades do Banco

- Criação de tabelas e restrições de integridade (PK, FK, UNIQUE).
- Inserção de dados simulando um ambiente real.
- Consultas SQL (SELECT) para responder às regras de negócio.
- Operações de atualização (UPDATE) e remoção (DELETE).
- Cálculo de métricas como vitórias, pontos acumulados e faturamento do site.
