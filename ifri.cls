%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modified on 16/04/2008 by L. Grossard grossard@unilim.fr %
% Updated IFRI final-year project template by ZOHOU Pierre Jérôme on 02/03/2020 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifri}[6/6/2013 custom CV class]
\LoadClass[a4paper,11pt,oneside]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Package loading               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[T1]{fontenc}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
% Load French through Babel's locale data. This keeps the bilingual front
% matter available even on TeX installations that do not ship french.ldf.
\babelprovide[import]{french}
\usepackage[usenames,dvipsnames,svgnames,table]{xcolor} % Colors and their available naming schemes
\usepackage{setspace}
\usepackage[]{graphicx} % Image insertion
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{siunitx}
\usepackage{mathcomp} % Upright mu symbol: $\tcmu$
\usepackage{multirow}
\usepackage{geometry} % Page layout: top, bottom, left and right margins
\usepackage[Lenny]{fncychap} % Customize chapter headings
\usepackage{palatino} % Font selection
\usepackage{float} % Keep figures at the requested position
\usepackage{pdfpages} % Include pages from another PDF document
\usepackage[hyphens]{url}
    \def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>%
\do\]\do\)\do\,\do\?\do\'\do+\do\=\do\#\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\%\do\=}%
%\usepackage{color} % Colors and their available naming schemes
% Enable and color all links
\usepackage[ 
            colorlinks=true,% Enable colored links
            linkcolor=RoyalBlue,% Set the color of standard links
            ]{hyperref}

%\usepackage[nonumberlist, acronym, toc]{glossaries} % Glossary formatting
\usepackage[acronym, toc]{glossaries} % Glossary formatting
%\usepackage[nonumberlist,style=altlist]{glossaries}
% \renewcommand*{\glsgroupskip}{}
% \renewcommand*{\glsseeformat}[3][\seename]{%
% (\xmakefirstuc{#1} \glsseelist{#2}.)}
 
\usepackage{fancyhdr}
\usepackage{lastpage} % Last page
\usepackage{titlesec} % Heading customization
\usepackage[strict]{changepage} % Automatic frame-width adjustment
\usepackage{framed} % Define custom frames
\usepackage{listings} % Source-code listings
\usepackage{listingsutf8} % UTF-8 source-code listings
\usepackage{caption}
\usepackage[english]{minitoc} % Mini tables of contents
\usepackage{pifont}
\usepackage{pdflscape} % Landscape pages
\usepackage{courier} % Font used in source-code listings


% Source-code colors
\definecolor{javared}{rgb}{0.6,0,0} % for strings
\definecolor{javagreen}{rgb}{0.25,0.5,0.35} % comments
\definecolor{javapurple}{rgb}{0.5,0,0.35} % keywords
\definecolor{javadocblue}{rgb}{0.25,0.35,0.75} % javadoc
\definecolor{lbcolor}{rgb}{0.9,0.9,0.9}  
\lstset{
%language=Java,
basicstyle=\ttfamily,
basicstyle=\scriptsize,
upquote=true,
numbers=left,
numberstyle=\tiny\color{black},
stepnumber=1,
numbersep=5pt,
tabsize=2,
showspaces=false,
showstringspaces=false,
extendedchars=true,
backgroundcolor=\color{lbcolor}, 
literate={á}{{\'a}}1 {ã}{{\~a}}1 {é}{{\'e}}1,
frame=leftline
}

\lstdefinestyle{Shell}{delim=[il][\bfseries]{BB}}

\definecolor{gris}{rgb}{68,68,68}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{lgray}{gray}{0.97} % Title page
\definecolor{bookColor}{cmyk}{0 , 0  , 0   , 0.98}  % 0.90\% of black
\usepackage{multirow} % Row spans in tables
\usepackage{longtable} % Tables spanning several pages
%\usepackage[chapter]{algorithm}
%\usepackage[english]{algorithm2e}
\usepackage{tocbibind}

\usepackage[english,linesnumbered,lined,boxed,commentsnumbered,ruled]{algorithm2e}
\usepackage{algpseudocode} % algorithmic
%\usepackage{algorithmic}

%\usepackage{auto-pst-pdf} 
\usepackage{pstricks,pst-node,pst-tree}

%%%%%%%%%% Algorithm customization

%\floatname{algorithm}{Algorithm}
% Change the comment style
%\renewcommand{\algorithmiccomment}[1]{// #1}
%\let\mylistof\listof
%\renewcommand\listof[2]{\mylistof{algorithm}{\textbf{List of Algorithms}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variable definitions     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\titreDuMemoire}[1]{\newcommand{\@titreDuMemoire}{#1}}
\newcommand{\typeMemoire}[1]{\newcommand{\@typeMemoire}{#1}}
\newcommand{\etudiant}[1]{\newcommand{\@etudiant}{#1}}
\newcommand{\encadrants}[1]{\newcommand{\@encadrants}{#1}}
\newcommand{\jurys}[1]{\newcommand{\@jurys}{#1}}
\newcommand{\dateSoutenance}[1]{\newcommand{\@dateSoutenance}{#1}}
\newcommand{\optionFormation}[1]{\newcommand{\@optionFormation}{#1}}
\newcommand{\anneeScolaire}[1]{\newcommand{\@anneeScolaire}{#1}}
\newcommand{\titre}[1]{\newcommand{\@titre}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{tmargin=2cm,bmargin=2cm,lmargin=2cm,rmargin=2cm}
\setlength\headheight{15pt}
\renewcommand{\baselinestretch}{1.2} % Line spacing
\pagestyle{headings}


\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The monBloc block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{fondBleu}{rgb}{0.95,0.95,1}

\newenvironment{formal}{%
  \def\FrameCommand{%
    \hspace{1pt}%
    {\color{black}\vrule width 2pt}%
    {\color{lgray}\vrule width 4pt}%
    \colorbox{lgray}%
  }%
  \MakeFramed{\advance\hsize-\width\FrameRestore}%
  %\noindent\hspace{-4.55pt}% Disable indentation
  %\noindent
  \begin{adjustwidth}{}{7pt}%
  \vspace{0pt}\vspace{0pt}%
}
{%
  \vspace{2pt}\end{adjustwidth}\endMakeFramed%
}


\newcommand{\monBloc}[1]{
\begin{formal}
\emph{{#1}}
\end{formal}
}	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Epigraph command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\epigraphe}[3]{
    \begin{formal}
	\ding{125}    
    {\itshape #1}
    \ding{126}
    \end{formal}
    {\raggedleft \textsc{#2} #3\par}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numbering customization         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hierarchy level 3
\setcounter{secnumdepth}{3}	% Number four levels
\setcounter{tocdepth}{2}	% Display two levels in the table of contents

% Page break after the chapter title
\def\chapitre#1{\chapter{#1}\newpage}
% Part counter in the form A, B, ...
%\renewcommand\thepart{\Alph{part}}
% Chapter counter in the form 1), 2), ...
%\renewcommand{\thechapter}{\arabic{chapter}}
% Section counter in the form I, II, ...
%\renewcommand{\thesection}{\Roman{section}}
% Section counter in the form I, II, ...
%\renewcommand{\thesection}{\Roman{section}}
% Subsection counter in the form 1), 2), ...
%\renewcommand{\thesubsection}{\arabic{subsection})}
% Subsubsection counter in the form 1), 2), ...
%\renewcommand{\thesubsubsection}{\arabic{subsubsection})}
% Separate numbering for tables
%\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
% Separate numbering for figures
%\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
% Separate numbering for the table of contents
%\renewcommand{\glsaddall}{\arabic{chapter}.\arabic{glossary}}

\newcommand\dedicace{\chapter*{Dedication}\addcontentsline{toc}{chapter}{Dedication}}
\newcommand\remerciements{\chapter*{Acknowledgements}\addcontentsline{toc}{chapter}{Acknowledgements}}
\newcommand\introduction{\chapter*{Introduction}\addcontentsline{toc}{chapter}{Introduction}}
\newcommand\conclusion{\chapter*{Conclusion}\addcontentsline{toc}{chapter}{Conclusion}}
\newcommand\resume{\chapter*{}\addcontentsline{toc}{chapter}{Abstract}}
\newcommand\annexe{\chapter*{}\addcontentsline{toc}{chapter}{Appendices}}

% \renewcommand\glsaddall{\chapter*{Glossary}\addcontentsline{toc}{chapter}{Glossary}}

% \newcommand\resume{\subsubsection*{}\addcontentsline{toc}{chapter}{Abstract}}

\renewcommand\printglossaries{\chapter*{Glossary}\addcontentsline{toc}{chapter}{Glossary}}

\newcommand\printsigles{\chapter*{Acronyms and abbreviations}\addcontentsline{toc}{chapter}{Acronyms and abbreviations}}


\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

%\fancyfoot[R]{\thepage / \pageref{LastPage}}
\fancyfoot[C]{\thepage}
\fancyhead[L]{\tiny \leftmark}
\fancyhead[R]{\scriptsize \rightmark}

% Abstract title-page formatting
% http://www.latex-community.org/forum/viewtopic.php?f=44&t=13708


\if@titlepage
  \renewenvironment{abstract}{%
      %\null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \Huge \abstractname
        \@endparpenalty\@M
      \end{center}\fancyhf{}}%
     {
     %\par\vfil\null
     }
\fi


% \newglossarystyle{clong}{%
%  \renewenvironment{theglossary}%
%      {\begin{longtable}{p{.3\linewidth}p{\glsdescwidth}}}%
%      {\end{longtable}}%
%   \renewcommand*{\glossaryheader}{}%
%   \renewcommand*{\glsgroupheading}[1]{}%
%   \renewcommand*{\glossaryentryfield}[5]{%
%     \glstarget{##1}{##2} & ##3\glspostdescription\space ##5\\}%
%   \renewcommand*{\glossarysubentryfield}[6]{%
%      & \glstarget{##2}{\strut}##4\glspostdescription\space ##6\\}%
%   %\renewcommand*{\glsgroupskip}{ & \\}%
% }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of contents customization %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tocloft}
%\renewcommand{\cftchapnumwidth}{\setlength{0.7cm}}
%\renewcommand{\cftsecnumwidth}{\setlength{0.7cm}}
%\renewcommand{\cftsubsecnumwidth}{\setlength{0.7cm}}
%\renewcommand{\cftsubsubsecnumwidth}{\setlength{0.7cm}}

%%%%%%%%% Comment out the following lines to use uppercase %%%%%%%%
%%%%%%%%%                    page headers                    %%%%%%%%

  \renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
  \renewcommand{\chaptermark}[1]{%
    \markboth{\if@mainmatter\@chapapp\ \thechapter. \fi\ #1}%
    {\if@mainmatter\@chapapp\ \thechapter. \fi\ #1}}

% Section customization
\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection}{0.5em}{}[\hspace{1ex}] % \titlerule by Ezin

% Part-title customization

\titleclass{\part}{page}
\titleformat{\part}[display]
  {\centering\normalfont\huge\bfseries}
  {\centering\normalfont\normalsize\scshape\partname\ \centering{\thepart}}
  {2ex}
  {\titlerule\vspace{1ex}}
  [\vspace{2ex}\titlerule]

{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}


% Remove the final full stop
\renewcommand*{\glspostdescription}{}
% Add a colon after glossary terms
\renewcommand{\glsnamefont}[1]{\textbf{#1 :  }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Multiple references to the same footnote
%% http://www.pommegyver.be/2010/11/latex-references-multiples-au-meme-footnote/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\footnoteremember}[2]{
\footnote{#2}
\newcounter{#1}
\setcounter{#1}{\value{footnote}}
}

\newcommand{\footnoterecall}[1]{
\footnotemark[\value{#1}]
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{nomencl}
\renewcommand{\nomname}{Acronyms and Abbreviations}
\makenomenclature 
%\newcommand\resume{\chapter*{}\addcontentsline{toc}{chapter}{Abstract}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Title-page elements %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\listofalgorithmes}{\tocfile{\listalgorithmcfname}{loa}}

\newcommand{\pageDeGarde}{
%\pagecolor{lgray}

\begin{titlepage}
\begin{center}
\begin{tabular}{c}
\textsf{{\scriptsize REPUBLIC OF BENIN}}
\end{tabular}
\end{center}

\vspace{-1.75cm}
\begin{flushleft}
\hspace{-0.5cm}
\begin{tabular}{p{3.5cm}}
\begin{flushright}
\includegraphics[scale=0.5]{images/logoUAC1.png}\\
\end{flushright}
\end{tabular}
\hfill
\begin{tabular}{p{8.5cm}}
\begin{center}
{\scriptsize \textsf{MINISTRY OF HIGHER EDUCATION \\AND SCIENTIFIC RESEARCH}\\}
\vspace{0.25cm}
{\scriptsize \textbf{\textsf{UNIVERSITY OF ABOMEY-CALAVI}}\\}
\vspace{0.25cm}
{\footnotesize \textbf {\textsf{INSTITUTE OF TRAINING AND RESEARCH\\ IN COMPUTER SCIENCE}\\}}
\vspace{0.25cm}
{\scriptsize P.O. Box 526 Cotonou, Tel.: +229 01 55 02 80 70\\}
\vspace{-0.25cm}
{\scriptsize \url{http://www.ifri-uac.bj/} Email: \href{mailto:contact@ifri.uac.bj}{contact@ifri.uac.bj}}
\end{center}
\end{tabular}
\hfill
\begin{tabular}{p{3.5cm}}
\begin{flushleft}
\includegraphics[scale=0.5]{images/logoIfri.png}
\end{flushleft}
\end{tabular}
\end{flushleft}
%\vfill
\begin{center}

{\textbf{{\Huge THESIS \\}}}
\vspace{0.5cm}
{\large Submitted in partial fulfilment of the requirements for the award of\\}
\vspace{0.5cm}

{\large \bf \centering \@typeMemoire \\ }
\vspace{0.5cm}

{\large \centering \textbf{Specialization:} \@optionFormation \\ }
\vspace{0.5cm}

{ \textbf{Presented by:} \\}
{\@etudiant{}}\\
\vspace{1cm}

%{\rule{\textwidth}{0.2mm}}\vspace{3mm} \\
{{\huge {\bf \centering \@titreDuMemoire}}}\\
%{\rule{\textwidth}{0.2mm}}\\
\vspace{2cm}
{ \textbf{Supervised by:} \\}
{ \@encadrants{}}\\
\vspace{1cm}

{ \textbf{Jury members:} \\}
{ \@jurys{}}\\

\vfill
\end{center}

\begin{center}
{ Academic Year: \bf \@anneeScolaire }
\end{center}


\end{titlepage}
}
% Generate indexes
\makeindex
%Activate glossary commands
\makeglossaries

\author{}
\date{}
