<h1>API em Dart</h2>
<p>Este é um projeto de API em Dart que estou desenvolvendo para fins de estudo.</p>
<h2>Pré-requisitos</h2>
<p>Para executar esta API em sua máquina, você precisará ter o seguinte instalado:</p>
<ul>
<li>Dart SDK: <a>https://dart.dev/get-dart</a></li>
<li>Node.js: <a>https://nodejs.org/en/download</a></li>
</ul>
<h2>Instalação</h2>

<ul>
<li>Faça o download do projeto</li>
<li>Navegue até a pasta do projeto em seu terminal</li>
<li>Execute o seguinte comando para baixar as dependências:</li>
</ul>

```bash
npm i
pub get
```
<ul>
<li>Para iniciar a API, execute o seguinte comando:</li>
</ul>

```bash
dart_frog dev
```
<h2>Rotas disponíveis</h2>
<p>A API atualmente possui as seguintes rotas:</p>

<ul>
<li>GET /: retorna uma mensagem de boas-vindas.</li>
<li>GET /users: retorna uma lista de usuários.</li>
<li>GET /users/:id: retorna as informações do usuário com o ID especificado.</li>
<li>POST /users: cria um novo usuário com as informações enviadas no corpo da requisição.</li>
<li>PUT /users/:id: atualiza as informações do usuário com o ID especificado, com as informações enviadas no corpo da requisição.</li>
<li>DELETE /users/:id: exclui o usuário com o ID especificado.</li>
</ul>