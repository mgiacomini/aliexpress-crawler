#Instruções de uso

##Configuração do sistema:
Ter uma máquina que possa rodar o código, baixar a ultima versão do ruby: https://www.ruby-lang.org/pt/downloads/
Ter o Mozilla Firefox, de preferência com a atualização desligada
Ter uma conta na Aliexpress
Ter um usuário administrador no site da wordpress e efetuar a seguinte configuração:

	Usuários > Adicionar Novo(ou editar)> no fim do formulário, selecionar a seguinte opção:
	WooCommerce Chaves de API - Gerar uma Chave de API
	Opção Ler/Escrever
	Clicar em Salvar/Atualizar

##Configuração da Planilha:
Modificar a tabela com as informações a seguir:
nome do produto: não obrigatória
link do produto: usar link do site, ex: http://bijuchique.com/shop/colar-garrafa-de-cristais-vermelho-2/, obrigatório
link aliexpress: link completo do anúncio na aliexpress, obrigatório
opções: colocar em ordem as opções do site da aliexpress ex: option_1 preencher com '3' caso seja a terceira opção da esquerda para a direita e assim por diante, caso fique em branco, a primeira opção da esquerda será selecionada

**Importante quanto a planilha: Não alterar formato, cabeçalho ou ordem das colunas, gerará erro no sistema**

##Configuração da aplicação:
No arquivo app.rb (abrir o mesmo no bloco de notas)
preencher os seguintes campos:
  "http://exemplo.com/" com a url do site
	Para os abaixo, pegar informações do perfil do usuário do Wordpress:
  "ck_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", #Consumer Key Wordpress
  "cs_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", #Consumer Secret Wordpress
	Nome da planilha (manter na mesma pasta e com a mesma extensão)
  "livro.csv" #Nome da planilha

	Preencher abaixo com informações do usuário da Aliexpress
  'user@email.com', #Email de usuário Aliexpress
  'password' #Eenha Aliexpress

**Importante: não apagar as aspas ou outro conteúdo, apenas substituir o conteúdo entre as aspas no mesmo padrão**

##Executar aplicação:
Após instalar o Ruby, rodar no terminal (ou cmd para Windows) os seguintes comandos:

  cd pasta de instalação/aliexpress
  gem install bundler
  bundle install
  ruby app.rb

##Erros
Durante a execução, é possível acompanhar o andamento pelo terminal, erros serão informados para que possam ser tratados

##Contato
Em caso de problemas ou modificações, contato:
Jessica Moura de Sousa
jessicams91@hotmail.com