\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uvamath}[2017/10/27 0.4 Bachelor Wiskunde LaTeX document class]
\LoadClassWithOptions{scrreprt}
\RequirePackage{graphicx}

\DeclareOption{english}{
% English values for translatable constant text
\def\supervisortextsingular{Supervisor}
\def\supervisortextplural{Supervisors}
\def\titletext{Title}
\def\authortextsingular{Author}
\def\authortextplural{Authors}
\def\datetext{End date}
\def\examinertextsingular{Examiner}
\def\examinertextplural{Examiners}
\def\secondgradertextsingular{Second grader}
\def\secondgradertextplural{Second graders}
\def\thesistext{Bachelor thesis Mathematics}
\def\thesisWNtext{Bachelor thesis Mathematics and Physics \& Astronomy}
\def\thesisWItext{Bachelor thesis Mathematics and Computer Science}
\def\secondyearprojecttext{Project report Mathematics year 2}
\def\compalgtext{Computer algebra-\LaTeX}
\def\kdvitext{Korteweg-de Vries Institute for Mathematics}
\def\uvatext{University of Amsterdam}
\def\fnwitext{Faculty of Sciences}
\def\ivitext{Informatics Institute}
}


% Default values for translatable constant text
\def\supervisortextsingular{Begeleiding}
\def\supervisortextplural{Begeleiding}
\def\titletext{Titel}
\def\authortextsingular{Auteur}
\def\authortextplural{Auteurs}
\def\datetext{Einddatum}
\def\examinertextsingular{Examinator}
\def\examinertextplural{Examinators}
\def\secondgradertextsingular{Tweede beoordelaar}
\def\secondgradertextplural{Tweede beoordelaars}
\def\thesistext{Bachelorscriptie Wiskunde}
\def\thesisWNtext{Bachelorscriptie Wiskunde en Natuur- \& Sterrenkunde}
\def\thesisWItext{Bachelorscriptie Wiskunde en Informatica}
\def\secondyearprojecttext{Projectverslag Wiskunde jaar 2}
\def\compalgtext{Computeralgebra-\LaTeX}
\def\kdvitext{Korteweg-de Vries Instituut voor Wiskunde}
\def\uvatext{Universiteit van Amsterdam}
\def\fnwitext{Faculteit der Natuurwetenschappen, Wiskunde en Informatica}
\def\ioptext{Institute of Physics}
\def\ivitext{Instituut voor Informatica}


% Variable text commands
\def\institute#1{\gdef\@institute{#1}}
\def\instituteaddress#1{\gdef\@instituteaddress{#1}}
\def\coverimage#1{\gdef\@coverimage{#1}}
\def\supervisors#1{\gdef\@supervisors{#1}}
\def\examiner#1{\gdef\@examiners{#1}}
\def\secondgrader#1{\gdef\@secondgrader{#1}}

% Options for various projects

\DeclareOption{complatex}{
    \def\whichprojecttext{\compalgtext}
    \institute{
    \kdvitext \\\smallskip
    \fnwitext\\\smallskip
    \uvatext\\\bigskip
    \includegraphics[width=0.070\hsize]{uvalogo}
    }

    \instituteaddress{\kdvitext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.kdvi.uva.nl}{}
    }
}

\DeclareOption{tweedejaarsproject}{
    \def\whichprojecttext{\secondyearprojecttext}
    \institute{
    \kdvitext \\\smallskip
    \fnwitext\\\smallskip
    \uvatext\\\bigskip
    \includegraphics[width=0.070\hsize]{uvalogo}
    }

    \instituteaddress{\kdvitext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.kdvi.uva.nl}{}
    }
}

\DeclareOption{bachelorscriptie}{
    \def\whichprojecttext{\thesistext}
    \institute{
    \kdvitext \\\smallskip
    \fnwitext\\\smallskip
    \uvatext\\\bigskip
    \includegraphics[width=0.070\hsize]{uvalogo}
    }

    \instituteaddress{\kdvitext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.kdvi.uva.nl}{}
    }
}

\DeclareOption{dubaWN}{
    \def\whichprojecttext{\thesisWNtext}
    \institute{
    \ioptext \\\smallskip
    \kdvitext \\\smallskip
    \fnwitext\\\smallskip
    \uvatext\\\bigskip
    \includegraphics[width=0.070\hsize]{uvalogo}
    }

    \instituteaddress{\ioptext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.iop.uva.nl}{} \bigskip \\
    \kdvitext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.kdvi.uva.nl}{}
    }
}

\DeclareOption{dubaWI}{
    \def\whichprojecttext{\thesisWItext}
    \institute{
    \ivitext \\\smallskip
    \kdvitext \\\smallskip
    \fnwitext\\\smallskip
    \uvatext\\\bigskip
    \includegraphics[width=0.070\hsize]{uvalogo}
    }

    \instituteaddress{\ivitext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.ivi.uva.nl}{} \bigskip \\
    \kdvitext\\
    \uvatext\\
    Science Park 904, 1098 XH Amsterdam\\
    \url{http://www.kdvi.uva.nl}{}
    }
}

%\DeclareOption*{}
\ProcessOptions%\relax

\setkomafont{disposition}{\bfseries}
%\RequirePackage[a4paper]{geometry}

% Default values for variable text
\coverimage{}
\supervisors{\relax}
\examiner{\relax}
\secondgrader{\relax}

% Author command
\newcounter{authors}
\def\@authordetails{}
\def\@authors{}
\renewcommand\author[2][\relax]{
    \ifnum\value{authors}>0\relax
        \addtocounter{authors}{1}
        \xdef\@authors{\@authors, #2}
        \protected@xdef\@authordetails{\@authordetails\protect{\\} \indent #2\if#1\relax\else{, #1}\fi}
    \else
        \addtocounter{authors}{1}
        \gdef\@authors{#2}
        \gdef\@authordetails{#2, #1}
    \fi
}

% Supervisor command
\newcounter{supervisornum}
\def\@supervisordetails{}
\def\@supervisors{}
\renewcommand\supervisors[2][\relax]{
  \stepcounter{supervisornum}
  \ifnum\value{supervisornum}=1
    \gdef\@supervisors{#2}
    \gdef\@supervisordetails{#2\ifx#1\relax\else, #1\fi}
  \else
    \g@addto@macro\@supervisors{, #2}
    \g@addto@macro\@supervisordetails{, #2\ifx#1\relax\else, #1\fi}
  \fi
}

% Examiner command
\newcounter{examinernum}
\def\@examinerdetails{}
\def\@examiner{}
\renewcommand\examiner[2][\relax]{
  \stepcounter{examinernum}
  \ifnum\value{examinernum}=1
    \gdef\@examiner{#2}
    \gdef\@examinerdetails{#2\ifx#1\relax\else, #1\fi}
  \else
    \g@addto@macro\@examiner{, #2}
    \g@addto@macro\@examinerdetails{, #2\ifx#1\relax\else, #1\fi}
  \fi
}

% Second grader command
\newcounter{secondgradernum}
\def\@secondgraderdetails{}
\def\@secondgrader{}
\renewcommand\secondgrader[2][\relax]{
  \stepcounter{secondgradernum}
  \ifnum\value{secondgradernum}=1
    \gdef\@secondgrader{#2}
    \gdef\@secondgraderdetails{#2\ifx#1\relax\else, #1\fi}
  \else
    \g@addto@macro\@secondgrader{, #2}
    \g@addto@macro\@secondgraderdetails{, #2\ifx#1\relax\else, #1\fi}
  \fi
}


% Maketitle command
\renewcommand{\maketitle}{
\pagestyle{empty}
\vspace*{30pt}
{\centering
{\LARGE \textbf{\bfseries \@title}\par}\bigskip
{\Large \@authors
\par}\bigskip
{\Large \@date\par}\bigskip\bigskip
{\large \whichprojecttext\par}\medskip
\if\@supervisors\relax
\else
  \ifnum\value{supervisornum}=1
    {\large\supervisortextsingular: \@supervisors\par}\bigskip
  \else
    {\large\supervisortextplural: \@supervisors\par}\bigskip
  \fi
\fi
\vspace{\stretch{1}}
\@coverimage
\vspace{\stretch{1}}

\@institute

\vspace{-70pt}
}
\newpage
\pagestyle{plain}
}

% Abstract and info page
\renewenvironment{abstract}{\section*{\abstractname}}{
\vfill
%\section*{Gegevens}
\noindent
\titletext: \@title\\
\ifnum\value{authors} < 2%
\authortextsingular: \@authordetails\\
\else
\authortextplural:\\ \indent\@authordetails\\
\fi
%
\ifnum\value{supervisornum} < 2%
\supervisortextsingular: \@supervisordetails\\
\else
\supervisortextplural: \@supervisordetails\\
\fi
%
\if\@examiner\relax\else
\ifnum\value{examinernum} < 2%
\examinertextsingular: \@examinerdetails\\
\else
\examinertextplural: \@examinerdetails\\
\fi \fi
%
\if\@secondgrader\relax\else
\ifnum\value{secondgradernum} < 2%
\secondgradertextsingular: \@secondgraderdetails\\
\else
\secondgradertextplural: \@secondgraderdetails\\
\fi \fi
\datetext: \@date

\bigskip\noindent
\@instituteaddress
\newpage
}



\endinput
