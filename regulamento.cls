% Descaradamente copiado do PPGCC - Autor: Daniel Lucrédio
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{regimento}[2014/10/29 Regimento class]

% Pacotes necessários
\RequirePackage[margin=2.0cm]{geometry} % Para configurar margens
\RequirePackage[utf8]{inputenc} % Para caracteres com acento
\RequirePackage{etoolbox} % Para comando if (teste de parágrafo único)
\RequirePackage[draft,silent,nomargin,footnote]{fixme} % Pacote para notas
\RequirePackage{needspace} % Para evitar quebra de página depois de um título
\RequirePackage[brazil]{babel} % Para hifenização correta em português
\RequirePackage{array} % Para conseguir fazer tabela com conteúdo centralizado e largura fixa de coluna

\newcommand{\sline}{\specialrule{.1em}{.05em}{.05em}}
\renewcommand{\baselinestretch}{2}
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

\fxsetup{theme=color} % Configuração das notas
\definecolor{fxtarget}{rgb}{0.8000,0.0000,0.0000} % Configuração das notas

%Comando para inserir uma nota
\newcommand{\nota}[2]{\fxnote*{#2}{#1}}

% Configurações de parágrafo
\setlength{\parindent}{0cm} % sem recuo
\setlength{\parskip}{0.3cm} % espaço entre parágrafos

% Comando para centralizar sem gerar espaço antes
% e depois da linha
\newenvironment{nscenter}
 {\parskip=0pt\par\nopagebreak\centering}
 {\par\noindent\ignorespacesafterend}

% Comando para definir o centro (Ex: CCET)
\newcommand*{\centro}[1]{\gdef\@centro{\uppercase{#1}}}
\newcommand*{\@centro}{}

% Comando para definir a coordenacao
\newcommand*{\coordenacao}[1]{\gdef\@coordenacao{#1}}
\newcommand*{\@coordenacao}{}

% Comando para definir a coordenacao
\newcommand*{\curso}[1]{\gdef\@curso{#1}}
\newcommand*{\@curso}{}

% Comando para definir o título do documento
\newcommand*{\tituloDocumento}[1]{\gdef\@tituloDocumento{\uppercase{#1}}}
\newcommand*{\@tituloDocumento}{}

% Comando que imprime o título do documento
\newcommand{\imprimirTituloDocumento}{%
\begin{nscenter}
{\Large \uppercase{\textbf{Universidade Federal de São Carlos}}}
\end{nscenter}

\begin{nscenter}
{\Large \textbf{\@centro}}
\end{nscenter}

\vspace{0.3cm}

\begin{nscenter}
{\large \textbf{\@coordenacao}}
\end{nscenter}
\vspace{1.0cm}
\begin{nscenter}
\textbf{\@tituloDocumento}
\end{nscenter}
\vspace{0.3cm}
%\listoffixmes
}

\newcounter{CAnexo}
\setcounter{CAnexo}{0}
\renewcommand{\theCAnexo}{\Roman{CAnexo}}

\newcounter{CTitulo}
\setcounter{CTitulo}{0}
\renewcommand{\theCTitulo}{\Roman{CTitulo}}

\newcounter{CCapitulo}
\setcounter{CCapitulo}{0}
\renewcommand{\theCCapitulo}{\Roman{CCapitulo}}


\newcounter{CArtigo}
\setcounter{CArtigo}{0}

\newcounter{CParagrafo}
\setcounter{CParagrafo}{0}

\newcounter{CInciso}
\setcounter{CInciso}{0}
\renewcommand{\theCInciso}{\Roman{CInciso}} 

\newcounter{CAlinea}
\setcounter{CAlinea}{0}
\renewcommand{\theCAlinea}{\alph{CAlinea}} 


% Comando para anexos
\newcommand{\anexo}[1]{%
\refstepcounter{CAnexo}
\vspace{0.7cm}
\Needspace{7\baselineskip}
\begin{nscenter}
\uppercase{\textbf{Anexo \theCAnexo}}
\end{nscenter}
\begin{nscenter}
\textit{\textbf{#1}}
\end{nscenter}

}

% Comando para títulos
\newcommand{\titulo}[1]{%
\refstepcounter{CTitulo}
\vspace{0.7cm}
\Needspace{7\baselineskip}
\begin{nscenter}
\uppercase{\textbf{Título \theCTitulo}}
\end{nscenter}
\begin{nscenter}
\textit{\textbf{#1}}
\end{nscenter}
}

% Comando para capítulos
\newcommand{\capitulo}[1]{%
\refstepcounter{CCapitulo}
\vspace{0.7cm}
\Needspace{7\baselineskip}
\begin{nscenter}
\uppercase{Capítulo \theCCapitulo}
\end{nscenter}
\begin{nscenter}
\textit{#1}
\end{nscenter}
}

% Comando para artigos
\newcommand{\artigo}[1]{%
\ifnumequal{\theCParagrafo}{1}{\errmessage{Erro: Utilize o comando paragrafounico no artigo \theCArtigo}}{}
\refstepcounter{CArtigo}
\setcounter{CParagrafo}{0}
\setcounter{CInciso}{0}
\setcounter{CAlinea}{0}
\textbf{Art. \theCArtigo}~- #1
}

% Comando para parágrafos
\newcommand{\paragrafo}[1]{%
\refstepcounter{CParagrafo}
\setcounter{CInciso}{0}
\setcounter{CAlinea}{0}
\S\theCParagrafo\textordmasculine~- #1

}

% Comando para parágrafo único
\newcommand{\paragrafounico}[1]{%
\setcounter{CInciso}{0}
\setcounter{CAlinea}{0}
Parágrafo único~- #1

}
% Comando para inciso
\newcommand{\inciso}[1]{%
\refstepcounter{CInciso}
\setcounter{CAlinea}{0}
\theCInciso~- #1
}

% Comando para inciso
\newcommand{\alinea}[1]{%
\refstepcounter{CAlinea}
\theCAlinea) #1
}

\newcommand{\refpar}[1]{%
\S\ref{#1}\textordmasculine}


\newcommand{\nro}{%
N\textsuperscript{\underline{o}}~}

\newcommand{\ordMasc}{%
\textsuperscript{\underline{o}}~}

\newcommand{\ordFem}{%
\textsuperscript{\underline{a}}~}

% Colunas com tamanho fixo, do tipo l, c e r
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
