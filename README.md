# Projetos pedagógicos CC e EC

Esta versão $\LaTeX$ dos documentos é derivada das últimas revisões realizadas nos projetos de curso.

## Para editores das versões anteriores

Houve algumas modificações na estrutura do código original para *ambos os projetos*:

1. O novo pacote `atributos.sty` foi adicionado.
1. O arquivo `comandos.tex` foi substituído pelos seguintes pacotes `disciplinas.sty` e `anotacoes.sty`
1. Os arquivos principais `pp_bcc.tex` e `ppc_enc.tex` foram alterados para incluir os novos pacotes com `\usepackage{}` e suprimir o `\input{comandos.tex}`
1. Todos os arquivos na pasta `shared` foram alterados para o novo formatdo da macro `\disciplina{}{}` (veja na sequência).

## Descrição do pacotes

### Pacote `atributos.sty`
Este pacote define comandos para o armazenamento de informações para uso futuro, de forma equivalente a variáveis. 

Um valor armazenado contém uma _classe_ e um _atributo_.

As seguintes macros são definidas:

* `\NovoAtributo{classe}{atributo}{valor}`: Cria um novo _atributo_ dentro de _classe_ com valor _valor_ (exemplo: `\NovoAtributo{ori}{codigo}{1001487}`); a tentativa de criar um atributo já existente gera erro.
* `\Atributo{classe}{atributo}`: Obtém o valor armazenado (por exemplo, `\Atributo{ori}{codigo}` produz o texto __10014876__).
* `\SeExisteAtributo{classe}{atributo}{código se sim}{código se não}`: Condicional que executa um código se o atributo existir ou outro, caso contrário (exemplo: `\SeExisteAtributo{calculo1}{prerequisitos}{\Atributo{calculo1}{prerequisitos}}{\Atributo{calculo1}{codigo} não possui pré-requisitos.}`).

### Pacote `disciplinas.sty`
Os comandos para a criação de disciplinas foram mantidos, em sua maioria, com a mesma interface que apresentavam no antigo `comandos.tex`, por razões de compatibilidade. Este é caso de, por exemplo, macros como `\titulo{}`, `\ementa{}` e `\bibliografia{}{}`.

A macro `\disciplina{}` foi modificada para `\disciplina{}{}`, sendo acrescentado um parâmetro obrigatório a mais. O primeiro parâmetro é o nome abreviado da disciplina, usado automaticamente como _classe_ na criação de atributos; o segundo parâmetro contém os demais comandos usados para definir nome, créditos, ementas e etc., como no formato original.

Os demais comandos foram alterados para automaticamente criarem um atributo e, assim, preservar seu valor para referência futura. Deste modo, dentro de `\disciplina{aed1}{...}`, o comando `\titulo{Algoritmos e estruturas de dados 1}` automaticamente cria um valor que pode ser referenciado por `\Atributo{aed1}{titulo}`.

Comando adicional:
* `\MostraDisciplina{}`: Apresenta a ficha de caracterização de uma disciplina (exemplo: `\MostraDisciplina{cap}`.)

 ### Pacote `competencias.sty`
Neste pacote são definidas macros para a criação e referenciação de competências, usando o pacote `atributos.sty`.

* `\NovaCompetencia{nome-de-referência}{especificação}`: Cria uma competência definindo atributos que usam como _classe_ `nome-de-referência`. O segundo parâmetro é formado por uma lista separada por vírgulas de pares `chave = valor` (veja na sequência).
* `\TabelaCompetencias{}`: Apresenta um quadro com a descrição de uma competência definida.
* `\MostraCompetencias{}`: Apresenta a versão da ficha de caracterização da disciplina na versão de competências - criada para o apêndice do PPC/EC (exemplo: `\MostraCompetencias{ori}`).

Neste pacote há uma função geral auxiliar de repetição, de uso não restrito às competências:

* `\ExecuteLista{\variavel}{lista}{comandos}`: Executa `comandos` para cada valor de `\variavel` (tem que ser uma macro) na lista separada por vírgulas `lista`. Por exemplo: `\ExecuteLista{\atrib}{titulo, creditos, bibliografiabasica}{Na disciplina \Atributo{aed2}{titulo}, o atributo \atrib\ tem valor \Atributo{aed2}{\atrib}\par}`.

Para as competências, sejam gerais ou específicas, são definidos os seguintes atributos:
* `aspecto`: O aspecto da competência, como _Aprender_, _Empreender_ etc., usado apenas em competências gerais.
* `sigla`: A sigla da UFSCar da competência (como CG_UFSCar_Aprender para _Aprender_, por exemplo). 
* `descrição`: Texto com a descrição da competência.
* `especificas`: Uma lista de competências específicas, usada apenas caso seja uma competência geral (veja exemplo).

Como exemplo, a competência geral _Aprender_ é especificada da seguinte forma, sendo `cg-aprender` a classe dos atributos associado e `ce-ap-1` uma das competências específicas.:
```
\NovaCompetencia{cg-aprender}{%
    aspecto = Aprender,
    sigla = CG\_UFSCar\_Aprender,
    descricao = {Aprender de forma autônoma e contínua},
    especificas = {ce-ap-1, ce-ap-2, ce-ap-3, ce-ap-4},
}
\NovaCompetencia{ce-ap-1}{%
    sigla = CE\_Ap\_1,
    descricao = {Interagir com fontes diretas (observação e coleta de dados em situações naturais e experimentais)},
}
\NovaCompetencia{ce-ap-2}{%
    sigla = CE\_Ap\_2,
    descricao = {Interagir com fontes indiretas (os diversos meios de comunicação, divulgação e difusão: \textit{abstract}, relatórios técnico-científicos, relatos de pesquisa, artigos de periódicos, livros, folhetos, revistas de divulgação, jornais, arquivos, mídia eletro-eletrônica e outras, específicos da comunidade científica ou não)},
}
\NovaCompetencia{ce-ap-3}{%
    sigla = CE\_Ap\_3,
    descricao = {Selecionar e examinar criticamente essas fontes, utilizando critérios de relevância, rigor, ética e estética},
}
\NovaCompetencia{ce-ap-4}{%
    sigla = CE\_Ap\_4,
    descricao = {Realizar o duplo movimento de derivar o conhecimento das ações e as ações do conhecimento disponível},
}
```
