% Template class for ATLAS HL-LHC Upgrade Project General Document Template, based on ATLAS note templates
% ---
% 2009-03-27 Marco Delmastro <Marco.Delmastro@cern.ch>
% 2015-03-01 modified for ATLAS Phase-II Scoping Document (FL: <Francesco.Lanni@cern.ch>)
% 2015-03-09 modified for ATLAS TDAQ Phase-II Trigger and Readout Requirements (FL: <Francesco.Lanni@cern.ch>)
% 2018-05-07 modified for ATLAS TDAQ Phase-II TDAQ General Document Template (FL: <Francesco.Lanni@cern.ch>)
% 2019-11-25 Steffen Stärz <Steffen.Staerz@cern.ch>
% - converted into ATLAS HL-LHC Upgrade Project Document Template
% - Renaming:
%    - tdaqTable -> ATLASPhaseIITable
%    - tdaqLongTable -> ATLASPhaseIILongTable
% ---
\ProvidesClass{ATLASPhaseII}[2019/11/25 version 0.9 ATLAS HL-LHC Upgrade Project General Document Template]
\NeedsTeXFormat{LaTeX2e}
\let\if@CoverPage\iffalse
\let\if@Draft\iftrue
\let\if@Note\iftrue

\DeclareOption{coverpage}{\let\if@CoverPage\iftrue}
\DeclareOption{nodraft}{\let\if@Draft\iffalse}
\DeclareOption{note}{\let\if@Note\iftrue}
\DeclareOption{book}{\let\if@Note\iffalse}
\let\if@noabstract\iffalse
\DeclareOption{noabstract}{\let\if@noabstract\iftrue}
\let\if@Usetikz\iftrue
\DeclareOption{nousetikz}{\let\if@Usetikz\iffalse}

\if@CoverPage \RequirePackage[clearpage,atlasnote]{atlascover}[2009/11/17] \fi
\ProcessOptions \relax

\RequirePackage{ATLASPhaseIIMacros}

% todo: what's the right way to load the report with those options?
\LoadClass[titlepage,a4paper,10pt]{report}
\PassOptionsToPackage{titlepage,a4paper,10pt,twoside}{report}
%-------------------------------------------------------------------------------
\RequirePackage{currfile}
\typeout{ ==== Processing \currfilename\ in \currfilepath\ === }
\typeout{ ====> Importing packge xkeyval}

%-------------------------------------------------------------------------------
\RequirePackage{color,colortbl}
\RequirePackage[usenames,x11names,dvipsnames,table]{xcolor}
\PassOptionsToPackage{usenames,x11names,dvipsnames,table}{xcolor}

%-------------------------------------------------------------------------------
% Definition of the colors to be used
%-------------------------------------------------------------------------------
% define the base color (such that xcolors AND tcolorbox know it)
\definecolor{midnightblue}{RGB}{0,103,149}
% color for the fading page header
\colorlet{cTDAQheader}{midnightblue}
% colors for the environment blocks
%  - frame
\colorlet{cTDAQblock}{cTDAQheader}
%  - shadow color
\colorlet{cTDAQblockshadow}{cTDAQblock}
%  - shadow opacity
\newcommand{\fTDAQblockshadow}{0.25}
% color scheme for the titles:
%  - take a basic color, make it 50% dark, and some 20 with the main color
%  - background color of the title on the left for definition
\colorlet{cTDAQblockdefinition}{blue!60!black!80!cTDAQblock}
%  - background color of the title on the left for (long) requirement
\colorlet{cTDAQblockrequirement}{red!60!black!80!cTDAQblock}
%  - background color of the title on the left for specification
\colorlet{cTDAQblockspecification}{cyan!60!black!80!cTDAQblock}
%  - background color of the title on the left for recommendation
\colorlet{cTDAQblockrecommendation}{black!80!cTDAQblock}
%  - background color of the title on the left for remark
\colorlet{cTDAQblockremark}{green!60!black!80!cTDAQblock}
%  - percentage of fading to white of background color of the title on the right
\newcommand{\nTDAQblockfadeto}{50}
% background color percentage of the original color w.r.t. white
\newcommand{\fTDAQblockbg}{7}

\RequirePackage{calc}
\RequirePackage{geometry}
\geometry{
  a4paper,%
  textwidth=16cm,%
  textheight=23.2cm,%
  marginparsep=7pt,%
  marginparwidth=2.5cm,%
  vcentering=true,%
  %twoside=true,% This offsets Right/Left page margins... To be checked With the other package...
  driver=pdftex%
}
\RequirePackage{subfigure}
\RequirePackage[subfigure,titles]{tocloft}
\PassOptionsToPackage{subfigure,titles}{tocloft}
\RequirePackage{tocvsec2}
\RequirePackage{framed}
% Upright greek letters
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{adjustbox}
%\RequirePackage{mathptmx} % removed to prevent error "Too many math alphabets"
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[varg]{txfonts}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\RequirePackage{array}
\RequirePackage{tabu}
\RequirePackage{tabularx}
\RequirePackage{tabulary}
\RequirePackage{diagbox}
%\RequirePackage{makecell}
\RequirePackage{float}
\RequirePackage{morefloats}
%\RequirePackage{mathrsfs} % removed to prevent error "Too many math alphabets"
\RequirePackage{newclude}
\RequirePackage{enumerate}
\RequirePackage{rotating}
%\RequirePackage{mathptmx}
%\RequirePackage{subfigure}

\RequirePackage{caption}
\PassOptionsToPackage{font=small,labelfont=bf, singlelinecheck=false}{caption}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{booktabs}
%\RequirePackage{maybemath} % removed to prevent error "Too many math alphabets"
\RequirePackage{siunitx} % for \SI

\ifpdf
  \RequirePackage{pdfcol}
%  \RequirePackage[pdftex,backref=page]{hyperref}
%  \PassOptionsToPackage{pdftex,backref=page}{hyperref}
  \RequirePackage[pdftex]{hyperref}
  \PassOptionsToPackage{pdftex}{hyperref}
  \@ifpackagelater{hyperref}{2011/12/31}{%
    \hypersetup{%
      plainpages=false,
      pdfpagelabels=true,
      bookmarks=true,
      bookmarksnumbered=true,
      bookmarksopen=true,
      bookmarksopenlevel=1,
      bookmarkstype=toc,
      linktocpage=true,
      colorlinks=true,
      allcolors=blue,
      pdfpagemode=UseOutlines,
      pdfinfo={Title={}},
      pdfborderstyle={/S/U/W 1}
    }}{}
\else
  \RequirePackage[pagebackref=page]{hyperref}
%  \PassOptionsToPackage{backref=page}{hyperref}
  \@ifpackagelater{hyperref}{2012/05/13}{%
    \hypersetup{%
      bookmarks=true,
      bookmarksnumbered=true,
      bookmarksopen=true,
      bookmarksopenlevel=1,
      bookmarkstype=toc,
      linktocpage=true,
      colorlinks=true,
      allcolors=blue,
    }}{}
\fi

\RequirePackage{ifthen}
\RequirePackage{xstring}
\RequirePackage{pageslts}
\typeout{Importing fancyhdr}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}

\RequirePackage{lineno}   % This is provided with the package

\RequirePackage{animate}
\RequirePackage{xspace}
\RequirePackage[italic]{hepparticles}
\RequirePackage[italic]{hepnames}

\RequirePackage{pifont}
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{booktabs}
\RequirePackage{stackengine}
\RequirePackage{pdflscape}
%\RequirePackage{floatrow}
\RequirePackage{threeparttablex}
\RequirePackage{chngcntr}

% This Is hugly... but titlesec defines them...
\global\let\headrule\relax
\global\let\footrule\relax
\RequirePackage{hhline}
\RequirePackage{afterpage}

\RequirePackage[sorting=none,backref=true,backend=bibtex,hyperref=true,style=numeric]{biblatex}
\PassOptionsToPackage{sorting=none,backref=true,backend=bibtex,hyperref=true,style=numeric}{biblatex}

% This is ugly... Need to define \thepage otherwise the lastpackage complains...
% Can't understand why it is not already defined....
\typeout{Defining Command \\thepage}
\providecommand{\thepage}{}
\typeout{Importing pageslts}
\RequirePackage{pageslts}

%-------------------------------------------------------------------------------
% Glossary
%-------------------------------------------------------------------------------
\typeout{ ===> Loading glossaries packages}
\RequirePackage[section]{glossaries}
%\RequirePackage[section,shortcuts,acronym,nonumberlist,style=altlist,nopostdot=true,xindy={language=english,codepage=utf8}]{glossaries}
\PassOptionsToPackage{nopostdot=true,xindy={language=english,codepage=utf8},nonumberlist,style=altlist,nogroupdisk,acronym,notoc,shortcuts,section=section}{glossaries}
\newcommand*{\glsgobblenumber}[1]{}
\newcommand*{\glsaddnp}[2][]{%
  \glsdoifexists{#2}{%
%     \def\@glsnumberformat{glsnumberformat}% DELETED
    \def\@glsnumberformat{glsgobblenumber}% NEW
    \edef\@gls@counter{\csname glo@#2@counter\endcsname}%
    \setkeys{glossadd}{#1}%
    \@gls@saveentrycounter
    \@do@wrglossary{#2}%
  }%
}
%% new code; modified \glsaddall
\renewcommand{\glsaddallunused}[1][]{%
  \edef\@glo@type{\@glo@types}%
  \setkeys{glossadd}{#1}%
  \forallglsentries[\@glo@type]{\@glo@entry}{%
    \ifglsused{\@glo@entry}{}{%
    \glsaddnp[#1]{\@glo@entry}}%
  }%
}
\RequirePackage{footnote}
\RequirePackage{tablefootnote}
%\RequirePackage{scrextend} % removed as incompatible with LaTeX2e <2019-10-01> patch level 1
\RequirePackage{xparse}
\RequirePackage{enumitem}
\RequirePackage{fancybox}
\RequirePackage{tcolorbox}
\RequirePackage{chngcntr}
\RequirePackage{attachfile}
\RequirePackage[pagestyles,explicit,newparttoc,outermarks]{titlesec}
\PassOptionsToPackage{pagestyles,outermarks}{titlesec}
\RequirePackage{titletoc}
\RequirePackage{etoolbox}
\RequirePackage[title,header]{appendix}
\PassOptionsToPackage{title,header}{appendix}
%\RequirePackage[noauto]{chappg}
%\PassOptionsToPackage{noauto}{chappg}

\RequirePackage{cleveref}
\PassOptionsToPackage{noabbrev,nameinlink}{cleveref}

\RequirePackage[tablegrid,hideauthorcolumn,nochapter,tocentry]{vhistory}
\PassOptionsToPackage{tablegrid,hideauthorcolumn,nochapter,tocentry}{vhistory}

\typeout{ ===> Revision history package: \vh@tablegrid }

% This Is fundamental otherwise you will Get Error Like \newrite
\RequirePackage{morewrites}

\RequirePackage{bookmark}
\RequirePackage{makeidx}

%-------------------------------------------------------------------------------
% Tikz/Pgfkeys/TColorBox environment
%-------------------------------------------------------------------------------
\if@Usetikz
  \RequirePackage{tikz}
  \RequirePackage{pgfkeys}
  \RequirePackage{tcolorbox}
\fi

%-------------------------------------------------------------------------------
\typeout{ ===> Redefining content style of part, chapter, section and subsections through titlecontents}
% Refer to the manual of "the titlesec, titleps and titletoc Packages":
% http://tug.ctan.org/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf

% We need to set the right margin (\contentsmargin{0pt}) for each element
% individually in order not to overwrite the global setting for the margin,
% otherwise the table of todos etc. is also affected.
% Let's define the filling options for all elements in the ToC
\def\tocfiller{\hspace{0.7em}\titlerule*[1pc]{.}\hspace{0.7em}}
% Now we define particular settings per element in the order contents, format, spacing

\typeout{   ... part}
\titleformat{\part}[frame]
  {\vspace{0.45\textheight}\normalfont}
  {\filright\footnotesize\enspace \partname\enspace\thepart\enspace}%Part \thepart\enspace}
  {8pt} {\Huge\bfseries\filcenter #1}

\typeout{     ... part options}
\let\titlesec@part\part
\renewcommand{\part}{\@ifstar\part@star\part@nostar}
\def\part@star#1{\NR@gettitle{#1}\titlesec@part*{#1}\renewcommand{\parttitle}{#1}}
\def\part@nostar{\@ifnextchar[\part@nostar@opt\part@nostar@nopt}
\def\part@nostar@nopt#1{\NR@gettitle{#1}\titlesec@part{#1}\renewcommand{\parttitle}{#1}}
\def\part@nostar@opt[#1]#2{\NR@gettitle{#2}\titlesec@part[#1]{#2}\renewcommand{\parttitle}{#2}}

\typeout{   ... chapter}
\titlecontents{chapter}%
  [3.em]% left: distance between the left text border and the TOC text (\contentslabel)
  {\contentsmargin{0pt}\Large\bfseries}% above-code
  {\contentslabel{2.1em}}% numbered-entry-format: the distance is measured left from the TOC text starting position to the label number's RIGHT side (but also depends on 'left' - it's not clear at all)
  {\hspace*{-2.1em}}% numberless-entry-format: negative of the numbered-entry-format to bring the text back to where usually the number is
  {\tocfiller\thecontentspage}% filler-page-format
\titleformat{\chapter}[display]
  {\vspace{0.01\textheight}\titlerule}
  {\vspace{2ex}{\bfseries\fontsize{50}{60}\selectfont\ifthenelse{\equal{\chaptertitlename}{Chapter}}{~\thechapter}{\chaptertitlename ~\thechapter}}}
  {1pt}{\titlerule\Huge\scshape\filright #1}
  [\vspace{0.02\textheight}]

\typeout{   ... section}
\titlecontents{section}
  [4.5em]% left
  {\contentsmargin{0pt}\large\bfseries}% above-code
  {\contentslabel{3.1em}}% numbered-entry-format
  {\hspace*{-3.1em}}% numberless-entry-format
  {\tocfiller\thecontentspage}% filler-page-format
\titleformat{\section}
  {\normalfont\LARGE\scshape}{\thesection}{1.0em}{#1}

\typeout{   ... subsection}
\titlecontents{subsection}
  [6.em]% left
  {\contentsmargin{0pt}}% above-code
  {\contentslabel{4.6em}}% numbered-entry-format
  {\hspace*{-4.6em}}% numberless-entry-format
  {\tocfiller\thecontentspage}% filler-page-format
\titleformat{\subsection}
  {\normalfont\Large\scshape}{\thesubsection}{1.0em}{#1}

\typeout{   ... subsubsection}
\titlecontents{subsubsection}
  [7.5em]% left
  {\contentsmargin{0pt}}% above-code
  {\contentslabel{5.6em}}% numbered-entry-format
  {\hspace*{-5.6em}}% numberless-entry-format
  {\tocfiller\thecontentspage}% filler-page-format
\titleformat{\subsubsection}
  {\normalfont\large\scshape}{\thesubsubsection}{1.0em}{#1}

\typeout{   ... define new class subsubsection}
\titleclass{\subsubsubsection}{straight}[\subsubsection]
\newcounter{subsubsubsection}
\renewcommand*\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\titlecontents{subsubsubsection}
  [9.em]% left
  {\contentsmargin{0pt}}% above-code
  {\contentslabel{6.6em}}% numbered-entry-format
  {\hspace*{-6.6.em}}% numberless-entry-format
  {\tocfiller\thecontentspage}% filler-page-format
\titleformat{\subsubsubsection}
  {\normalfont\large\scshape}{\thesubsubsubsection}{1.0em}{#1}
\titlespacing*{\subsubsubsection}
  {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\typeout{   ... paragraph}
\titleformat{\paragraph}[runin]
  {\normalfont\normalsize\scshape}{\theparagraph}{1.0em}{#1}

\typeout{   ... subparagraph}
\titleformat{\subparagraph}[runin]
  {\normalfont\normalsize\scshape}{\thesubparagraph}{1.0em}{#1}

\typeout{ ===> Redefining format of list of figures}
\renewcommand*{\listoffigures}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \section*{\listfigurename}%
  \@mkboth{\MakeUppercase\listfigurename}%
  {\MakeUppercase\listfigurename}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}

\typeout{ ===> Redefining format of list of tables}
\renewcommand*{\listoftables}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \section*{\listtablename}%
  \@mkboth{%
    \MakeUppercase\listtablename}%
  {\MakeUppercase\listtablename}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}

%-------------------------------------------------------------------------------
% \strTruncate and \splitheader commands
%-------------------------------------------------------------------------------
\providecommand{\strTruncate}[2]{}
\renewcommand{\strTruncate}[2]{%
  \StrLen{#1}[\mystrlen]
  \ifthenelse{\mystrlen > #2}{\StrLeft{#1}{#2}\ldots}{#1}
}

\DeclareRobustCommand\splitheader[2]{#1 #2}
\def\contsplitheader{}
\def\dosplitheader{%
\gdef\contsplitheader{}%
\DeclareRobustCommand\splitheader[2]{##1\gdef\contsplitheader{##2}}}

%-------------------------------------------------------------------------------
% \frontmatter definition
%-------------------------------------------------------------------------------
\DeclareRobustCommand\frontmatter{
  \pagenumbering{roman}
  \pagestyle{ATLASPhaseIIToc}
}

%-------------------------------------------------------------------------------
% \mainmatter definition
%-------------------------------------------------------------------------------
\DeclareRobustCommand{\mainmatter}{
  \pagenumbering{arabic}
  \pagestyle{ATLASPhaseIIDoc}
  \clearpage
  \captionsetup[figure]{labelfont=bf, textfont=sf, justification=justified, singlelinecheck=true}
  \captionsetup[table]{labelfont=bf, textfont=sf, justification=justified, singlelinecheck=false}
  \if@Note
    \counterwithin{figure}{chapter}
    \counterwithin{table}{chapter}
  \else
    \counterwithin{figure}{chapter}
    \counterwithin{table}{chapter}
  \fi
}

%-------------------------------------------------------------------------------
% \backmatter definition
%-------------------------------------------------------------------------------
\DeclareRobustCommand\backmatter{%
  \cleardoublepage
  \pagestyle{ATLASPhaseIIApp}
  \captionsetup[figure]{labelfont=bf, textfont=rm, justification=justified, singlelinecheck=true}
  \captionsetup[table]{labelfont=bf, textfont=sf, justification=justified, singlelinecheck=false}
  \counterwithin{figure}{chapter}
  \counterwithin{table}{chapter}
  \renewcommand{\theHchapter}{\thepart.appendix.\thechapter}
  \renewcommand{\theHsection}{\thepart.appendix.\thechapter.\thesection}
}

%-------------------------------------------------------------------------------
% \stdmakeheadrule and \stdmakefootrule commands
%-------------------------------------------------------------------------------
\DeclareRobustCommand{\stdmaketablehead}{%
  \ifodd\c@page%
    \raisebox{-0.7\baselineskip}{\tikztablerule[cTDAQheader]{\textwidth}{25.0pt}}%
  \else%
    \raisebox{-0.7\baselineskip}{\tikztablerule[cTDAQheader]{\textwidth}{25.0pt}}%
  \fi
}

\DeclareRobustCommand{\stdmakeheadrule}{%
  \raisebox{-0.7\baselineskip}{\tikzrule[cTDAQheader]{25.0pt}}%
}
\DeclareRobustCommand{\stdmakefootrule}{%
  \raisebox{-0.7\baselineskip}{\tikzrule[cTDAQheader]{25.0pt}}%
}

%-------------------------------------------------------------------------------
% ATLASPhaseIIDoc pagestyle
%-------------------------------------------------------------------------------
\typeout{ ===> Defining pagestyle ATLASPhaseIIDoc }
\newpagestyle{ATLASPhaseIIDoc}[\footnotesize\sffamily]{
  \renewcommand{\chaptername}{}
  \renewcommand{\chaptertitlename}{Chapter}
  \renewcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
    \thispagestyle{ATLASPhaseIIDoc}% original style: plain
    \global\@topnum\z@
    \@afterindentfalse
    \secdef\@chapter\@schapter
  }
  \pagenumbering{arabic}
  \renewcommand{\makeheadrule}{\stdmakeheadrule}
  \renewcommand{\makefootrule}{\stdmakefootrule}
  \sethead%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
    \else
      \color{white}\bf
    \fi
    \begin{tabular}[b]{l@{}}
    \footnotesize \@ShortDocTitle
    \ifthenelse{\equal{\thesection}{}}{}{\footnotesize%
      \makebox[0.35\textwidth][l]{:~\thesection~\sectiontitle}
    } % \strTruncate{\chaptertitle}{20} }
    \end{tabular}
  }
  {}
  {%
    \ifodd\c@page%
      \color{white}\bf
    \else
    \fi
    \begin{tabular}[b]{r@{}}
      {%
        \ifx\@lastModifiedDate\@empty\mbox{}%
        \else
          \@lastModifiedDate
        \fi%
      }
      {%
        \ifx\@draftversion\@empty\mbox{}%
        \else
          \;- Version \@draftversion
        \fi%
      }
      ~~%
    \end{tabular}
  }

  \setfoot%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
    \else
      \color{white}\bf
    \fi
    \ifthenelse{\equal{\thechapter}{}}{}{\footnotesize%
      \makebox[0.35\textwidth][l]{~~\thechapter. \chaptertitle}
    }% \strTruncate{\chaptertitle}{20} }
  }%
  {}%
  {%
    \ifodd\c@page%
      \color{white} Page {\textbf{\thepage}} of {\textbf{\hypersetup{linkcolor=white}\lastpageref{pg:lastpage}}}%
    \else
      Page {\textbf{\thepage}} of \textbf{\lastpageref{pg:lastpage}}%
    \fi%
    ~~%
  } %odd
}%end pagestyle

%-------------------------------------------------------------------------------
% ATLASPhaseIIApp pagestyle
%-------------------------------------------------------------------------------
\typeout{ ===> Defining pagestyle ATLASPhaseIIApp }
\newpagestyle{ATLASPhaseIIApp}[\footnotesize\sffamily]{
  \pagenumbering{arabic}
  \renewcommand\appendixname{Appendix}
  \renewcommand\chaptername{\appendixname}
  \renewcommand\chaptertitlename{\appendixname}
  \renewcommand*{\thechapter}{\Alph{chapter}}
  \patchcmd{\@chapter}{\refstepcounter{chapter}}{\refstepcounter{chapter}\setcounter{page}{1}}{}{}
  \renewcommand*{\thepage}{\thechapter.\arabic{page}}
  \renewcommand*{\chapter}{%
    \if@openright\cleardoublepage\else\clearpage\fi%
    \thispagestyle{ATLASPhaseIIApp}%
    \global\@topnum\z@%
    \@afterindentfalse%
    \setcounter{page}{1}%
    \secdef\@chapter\@schapter%
  }
  \renewcommand*{\thesection}{\thechapter.\arabic{section}}
  \renewcommand*{\thesubsection}{\thesection.\@arabic\c@subsection}
  \renewcommand*{\thesubsubsection}{\thesubsection.\@arabic\c@subsubsection}
  \renewcommand{\theparagraph}{\thesubsubsection.\@arabic\c@paragraph}
  \renewcommand{\thesubparagraph}{\theparagraph.\@arabic\c@subparagraph}
  \renewcommand*{\setthesection}{\thesection}
  \renewcommand*{\setthesubsection}{\thesubsection}
  \renewcommand{\makeheadrule}{\stdmakeheadrule}
  \renewcommand{\makefootrule}{\stdmakefootrule}
  \sethead%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
    \else
      \color{white}\bf
    \fi
    \begin{tabular}[b]{l@{}}
      \footnotesize \@ShortDocTitle
    \end{tabular}
  }
  {}
  {%
    \ifodd\c@page%
      \color{white}\bf
    \else
    \fi
    \begin{tabular}[b]{r@{}}
      {%
        \ifx\@lastModifiedDate\@empty\mbox{}%
        \else
          \@lastModifiedDate
        \fi
      }
      {%
        \ifx\@draftversion\@empty\mbox{}%
        \else
          \;- Version \@draftversion
        \fi
      }
      ~~%
    \end{tabular}
  }

  \setfoot%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
    \else
      \color{white}\bf
    \fi
    \ifthenelse{\equal{\thechapter}{}}{}{~~\footnotesize%
      \makebox[0.35\textwidth][l]{\chaptername~\thechapter: \chaptertitle} }
  }%
  {}%
  {%
    \ifodd\c@page%
      \color{white}\bf
    \else
    \fi
    \thepage%
    ~~%
  } %odd

}%end pagestyle

%-------------------------------------------------------------------------------
% ATLASPhaseIIToc pagestyle
%-------------------------------------------------------------------------------
\typeout{ ===> Defining pagestyle ATLASPhaseIIToc }
\newpagestyle{ATLASPhaseIIToc}[\footnotesize\sffamily]{
  \pagenumbering{roman}
  \renewcommand*{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi%
    \thispagestyle{ATLASPhaseIIToc}%
    \global\@topnum\z@%
    \@afterindentfalse%
    \secdef\@chapter\@schapter%
  }

  \renewcommand{\makeheadrule}{\stdmakeheadrule}
  \renewcommand{\makefootrule}{\stdmakefootrule}

  \sethead%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
    \else
      \color{white}\bf
    \fi
    \begin{tabular}[b]{l@{}}
      \footnotesize \@ShortDocTitle
    \end{tabular}
  }
  {}
  {%
    \ifodd\c@page%
      \color{white}\bf
    \else
    \fi
    \begin{tabular}[b]{r@{}}
      {%
        \ifx\@lastModifiedDate\@empty\mbox{}%
        \else
          \@lastModifiedDate
        \fi%
      }
      {%
        \ifx\@draftversion\@empty\mbox{}%
        \else
          \;- Version \@draftversion
        \fi
      }
      ~~%
    \end{tabular}
  }

  \setfoot%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
      \sl
    \else
      \color{white}\bf\sl
    \fi
    {~~\footnotesize\makebox[0.35\textwidth][l]{\ifthenelse{\equal{\sectiontitle}{}}{\chaptertitle}{\sectiontitle}}}
  }%
  {}%
  {%
    \ifodd\c@page%
      \color{white}\bf
    \else
    \fi
    \thepage%
    ~~%
  }% odd
}%end pagestyle

%-------------------------------------------------------------------------------
% ATLASPhaseIIBib pagestyle
%-------------------------------------------------------------------------------
\typeout{ ===> Defining pagestyle ATLASPhaseIIBib }
\newpagestyle{ATLASPhaseIIBib}[\footnotesize\sffamily]{
  \renewcommand\bibname{References}
  \renewcommand*{\chapter}{%
    \if@openright\cleardoublepage\else\clearpage\fi%
    \thispagestyle{ATLASPhaseIIBib}%
    \global\@topnum\z@%
    \@afterindentfalse%
    \addcontentsline{toc}{section}{\bibname}
    \secdef\@chapter\@schapter%
  }

% \titleformat{\chapter}{\normalfont\huge\bfseries}{\thechapter}{1.0em}{#1}
% \titlespacing*{\chapter}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

  \renewcommand{\theHchapter}{\thepart.biblio.\thechapter}
  \renewcommand{\makeheadrule}{\stdmakeheadrule}
  \renewcommand{\makefootrule}{\stdmakefootrule}

  \sethead%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
    \else
      \color{white}\bf
    \fi
    \begin{tabular}[b]{l@{}}
      \footnotesize \@ShortDocTitle
    \end{tabular}
  }
  {}
  {%
    \ifodd\c@page%
      \color{white}\bf
    \else
    \fi
    \begin{tabular}[b]{r@{}}
      {%
        \ifx\@lastModifiedDate\@empty\mbox{}%
      \else
      \@lastModifiedDate
      \fi%
      }
      {%
        \ifx\@draftversion\@empty\mbox{}%
        \else
          \;- Version \@draftversion
        \fi%
      }
      ~~%
    \end{tabular}
  }

  \setfoot%
  [][][]%
  {%
    \ifodd\c@page%
      \hspace{0.051\textwidth}% odd pages
      \sl
    \else
      \color{white}\sl
    \fi
    {~~\footnotesize\makebox[0.35\textwidth][l]{\bibname} }
    {\footnotesize\makebox[0.35\textwidth][l]{\ifthenelse{\equal{\bibname}{}}{References}{\bibname}}}
  }%
  {}%
  {%
    \ifodd\c@page%
      \color{white} Page {\textbf{\thepage}} of {\textbf{\hypersetup{linkcolor=white}\lastpageref{pg:lastpage}}}%
    \else
      Page {\textbf{\thepage}} of \textbf{\lastpageref{pg:lastpage}}%
    \fi%
    ~~%
  }% odd
}

\newcommand{\myline}{\specialrule{0.5pt}{1.pt}{1.pt}\specialrule{0.5pt}{1.pt}{1.pt}}

% the following defines macros that must be set in the document using this class
% the \def gives the default value
% the \newcommand overwrites this default value by the value set in the document using this class

% Path to the template seen from the (specification) document's root directory.
\def\@TemplatePath{template}
\newcommand{\TemplatePath}[1]{\def\@TemplatePath{#1}}

% (Full) Document title as appearing on the title page.
\def\@DocTitle{Generic ATLAS Phase-II Document}
\newcommand{\DocTitle}[1]{\def\@DocTitle{#1}}

% Short document title (used in header).
% Usage of \gls is not allowed here (otherwise EACH page would be listed in the glossary)
\def\@ShortDocTitle{Generic ATLAS Phase-II Document}
\newcommand{\ShortDocTitle}[1]{
	\noexpandarg
	\IfSubStr{#1}{\gls}{%
		\PackageError{ATLASPhaseII}{Don't use \protect\gls inside in \protect\ShortDocTitle!}{Forbidden: \protect\gls was found in the definition of \protect\ShortDocTitle!}%
	}{\def\@ShortDocTitle{#1}}
}

% List of authors, separate by `\\`.
\def\@DocAuthors{}
\newcommand{\DocAuthors}[1]{\def\@DocAuthors{#1}}

% List of people who checked the document, separate by `\\`.
\def\@DocCheckedBy{}
\newcommand{\DocCheckedBy}[1]{\def\@DocCheckedBy{#1}}

% List of people who approved the document, separate by `\\`.
\def\@DocApprovedBy{}
\newcommand{\DocApprovedBy}[1]{\def\@DocApprovedBy{#1}}

% Date of "creation" (= first upload to EDMS) of the document.
\def\@creationDate{}
\newcommand{\creationDate}[1]{\def\@creationDate{#1}}

% Date of last modification (= date of the latest upload to EDMS) of the document.
\def\@lastModifiedDate{\today}
\newcommand{\lastModifiedDate}[1]{\def\@lastModifiedDate{#1}}

% Draft version. Not to be set when in option `nodraft`.
\def\@draftversion{}
\newcommand{\draftversion}[1]{\def\@draftversion{#1}}

% Input file containing the abstract.
\def\@abstractFile{}
\newcommand{\abstractFile}[1]{\def\@abstractFile{#1}}

% EDMS document number
\def\@EDMSDocNo{}
\newcommand{\EDMSDocNo}[1]{\def\@EDMSDocNo{#1}}

% EDMS identification number
\def\@EDMSDocId{}
\newcommand{\EDMSDocId}[1]{\def\@EDMSDocId{#1}}

% EDMS document URL
\def\@EDMSDocUrl{}
\newcommand{\EDMSDocUrl}[1]{\def\@EDMSDocUrl{#1}}

% CDS document number
\def\@CDSDocNo{}
\newcommand{\CDSDocNo}[1]{\def\@CDSDocNo{#1}}

% CDS document URL
\def\@CDSDocUrl{}
\newcommand{\CDSDocUrl}[1]{\def\@CDSDocUrl{#1}}

% the color that glossary entries are highlighted in the main text
% expect something dark (on white background)
\def\@glsmaincolor{darkgray}
\newcommand{\glsmaincolor}[1]{\def\@glsmaincolor{#1}}

% the color that glossary entries are highlighted in the definition and requirement environments
% expect something light (on colorfull background)
\def\@glsenvcolor{gray!20}
\newcommand{\glsenvcolor}[1]{\def\@glsenvcolor{#1}}

% copyright footer (used)
\newcommand{\AtlasCopyrightFooter}{%
  \parbox[b]{\linewidth}{%
    \footnotesize\textit{ \copyright\ \the\year \ CERN for the benefit of the ATLAS Collaboration.
      \newline
      Reproduction of this article or parts of it is allowed as
      specified in the CC-BY-4.0 license.
    }
  }
}

\typeout{ ===> Defining maketitlepage }
\newcommand{\maketitlepage}{%
  \begin{titlepage}
    \begin{minipage}[t]{0.7\textwidth}
      \raggedright
      {\small \@ShortDocTitle}
    \end{minipage}%
    \begin{minipage}[t]{0.3\textwidth}
      \raggedleft
      \ifx\@EDMSDocNo\empty
      \else
        {\small ATLAS Doc.: \@EDMSDocNo}
        {\small EDMS Id: \@EDMSDocId}
      \fi

      \ifx\@CDSDocNo\empty
      \else
        {\small CDS No.: \@CDSDocNo}
      \fi
    \end{minipage}

    \centering
    \begin{minipage}{0.2\textwidth}
      \raggedright
      \includegraphics[width=0.83\textwidth]{\@TemplatePath/logos/AT_atlaslogo_2015}
    \end{minipage}%
    \begin{minipage}{0.6\textwidth}
      \hfill
    \end{minipage}%
    \begin{minipage}{0.2\textwidth}
      \raggedleft
      \includegraphics[width=0.83\textwidth]{\@TemplatePath/logos/AT_cernlogo}
%         \caption*{{\normalfont{Draft version \draftversion}}}
    \end{minipage}
    \begin{center}%
      {\normalsize \glsname{ATLAS} \PhaseTwo Upgrade Project} \\
      \vspace*{0.5cm}
      {\Huge \@DocTitle }
    \end{center}
    \vfill
    \if@noabstract
    \else
      \begin{center}
        \textbf{Abstract}
      \end{center}
      \raggedright
      \input{\@abstractFile}
      \vfill
    \fi
    \noindent
    \begin{tabularx}{\textwidth}{|p{0.35\textwidth}|p{0.3\textwidth}|X|}
      \hline
      \multicolumn{3}{|l|}{\bf\@ShortDocTitle} \\
      \hline
      \ifx\@EDMSDocNo\empty
      \else
        \multicolumn{1}{|l}{ATLAS Doc:} & \multicolumn{1}{l}{\@EDMSDocNo} & \\
        \multicolumn{1}{|l}{EDMS Id:}   & \multicolumn{1}{l}{\@EDMSDocId} & \\
        \multicolumn{1}{|l}{EDMS Url:}  & \multicolumn{2}{l|}{\url{\@EDMSDocUrl}}  \\
        \hline
      \fi
      \ifx\@CDSDocNo\empty
      \else
        \multicolumn{1}{|l}{CDS No.:}  & \multicolumn{1}{l}{\@CDSDocNo} & \\
        \multicolumn{1}{|l}{CDS Url:} & \multicolumn{2}{l|}{\url{\@CDSDocUrl}}  \\
        \hline
      \fi
      \multicolumn{1}{|l}{Version:}       & \multicolumn{1}{l}{\@draftversion} & \\
      \multicolumn{1}{|l}{Created:}       & \multicolumn{1}{l}{\@creationDate} & \\
      \multicolumn{1}{|l}{Last modified:} & \multicolumn{1}{l}{\@lastModifiedDate} & \\
      \myline
      \textbf{Prepared by:} &  \textbf{Checked by:} &  \textbf{Approved by:}\\
      & & \\
      \begin{minipage}[t]{\linewidth}
        \@DocAuthors
      \end{minipage}
      &
      \begin{minipage}[t]{\linewidth}
        \@DocCheckedBy
      \end{minipage}
      &
      \begin{minipage}[t]{\linewidth}
        \@DocApprovedBy
      \end{minipage}
      \\
      & & \\
      \hline
    \end{tabularx}

    \AtlasCopyrightFooter
  \end{titlepage}
  \thispagestyle{empty}
  \begin{center} \vspace*{\stretch{1}}[INTENTIONALLY BLANK PAGE]\vspace*{\stretch{1}} \end{center}
  \clearpage
  \setcounter{page}{3}
  \setcounter{table}{0}
}%end maketitlepage

% This some before-and-after code that surrounds the title page. It
% shouldn't need to be modified. I've pulled out the part that actually
% typesets the title page and placed it in the \maketitlepage command
% above.

\typeout{ ===> Redefining Command maketitle }
\renewcommand\maketitle{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \maketitlepage%
  %\end{titlepage}%
  \setcounter{footnote}{0}%
  \setcounter{page}{3}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@\DocAuthors\@empty
  \global\let\@DocCheckedBy\@empty
  \global\let\@DocApprovedBy\@empty
%  \global\let\@date\@empty % actually date doesn't appear anywhere on the document
  \global\let\@DocTitle\@empty
  \global\let\DocTitle\relax
  \global\let\@ShortDocTitle\@empty
  \global\let\ShortDocTitle\relax
  \global\let\date\relax
  \global\let\and\relax
}

\typeout{ ===> Defining icaption command }
% Use \icaption instead of \caption in tables and figures to get a
% caption that is indented. Note that the label should be included
% inside \icaption for it to work properly.
\newlength{\capindent}
\setlength{\capindent}{0.5cm}
\newlength{\capwidth}
\setlength{\capwidth}{\textwidth}
\addtolength{\capwidth}{-2\capindent}
\newlength{\figwidth}
\setlength{\figwidth}{\textwidth}
\addtolength{\figwidth}{-2.0cm}
\newcommand{\icaption}[2][!*!,!]{%
  \hspace*{\capindent}%
  \begin{minipage}{\capwidth}
    \ifthenelse{\equal{#1}{!*!,!}}%
      {\caption{#2}}%
      {\caption[#1]{#2}}
    \vspace*{3mm}
  \end{minipage}
}

\typeout{ ===> Defining itemize_dense environment with smaller spaces }
\newenvironment{enum_dense}{
  \begin{enumerate}
    \setlength{\itemsep}{1pt}
    \setlength{\parskip}{0pt}
    \setlength{\parsep}{0pt}
}{\end{enumerate}}

\typeout{ ===> Defining itemize_dense environments with smaller spaces }
\newenvironment{item_dense}{
  \begin{itemize}
    \setlength{\itemsep}{1pt}
    \setlength{\parskip}{0pt}
    \setlength{\parsep}{0pt}
}{\end{itemize}}

\typeout{ ===> Defining default fonts Arial }
\renewcommand{\rmdefault}{phv} % Arial
%\renewcommand{\sfdefault}{phv} % Arial

\typeout{ ===> Specify counters for section and toc depth }
\setcounter{secnumdepth}{6}
\setcounter{tocdepth}{4}

\typeout{ ===> Redefining commands For labelenum...i...iv }
\renewcommand{\labelenumi}{\arabic{enumi}. }
\renewcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii} }
\renewcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii} }
\renewcommand{\labelenumiv}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}.\arabic{enumiv} }

% Defaults for title page
\newdimen\AN@skipbeforetitle
\AN@skipbeforetitle=60\p@
\newcommand\skipbeforetitle[1]{
  \AN@skipbeforetitle=#1
}

%-------------------------------------------------------------------------------
\typeout{ ====> Definition of Column/Row Type in Table environments}
\newcommand*{\@rowstyle}{}
\ifdefined\rowstyle
  \renewcommand*{\rowstyle}[1]{% sets the style of the next row
    \gdef\@rowstyle{#1}%
    \@rowstyle\ignorespaces%
  }
\else
  \newcommand*{\rowstyle}[1]{% sets the style of the next row
    \gdef\@rowstyle{#1}%
    \@rowstyle\ignorespaces%
  }
\fi
\newcolumntype{=}{% resets the row style
  >{\gdef\@rowstyle{}}%
}
\newcolumntype{+}{% adds the current row style to the next column
  >{\@rowstyle}%
}
\newcommand\CostTableHeadStyle{%
  \rowcolor{NavyBlue}
  \rowstyle{\bfseries\textcolor{white}}
}

%-------------------------------------------------------------------------------
\typeout{===> Defining definition, requirement, specification, remark and recommendation environments}

\newcommand*{\flref}[2][Eq.~]{%
  \hyperref[{#2}]{#1(\ref*{#2})}%
}

\tcbuselibrary{skins}
\newcommand{\newlistofold}{\newlistof}
\let\newlistof\relax

\newcommand{\newlistof}[4][\@empty]{%
  \ifx \@empty#1\relax
    \newlistentry{#2}{#3}{0}
  \else
    \newlistentry[#1]{#2}{#3}{0}
  \fi
  \@namedef{ext@#2}{#3}
  \newcounter{#3depth}
  \setcounter{#3depth}{1}
  \if@cftkoma
    \@namedef{cftmark#3}{%
    \@mkboth{#4}{#4}}
  \else
    \@namedef{cftmark#3}{%
    \@mkboth{\MakeUppercase{#4}}{\MakeUppercase{#4}}}
  \fi
  \@namedef{listof#2}{%
    \@cfttocstart
    \section*{#4}
    \@nameuse{cftmark#3}
    \@starttoc{#3}%
    \@cfttocfinish
  }

  \@namedef{@cftmake#3title}{%
    \addpenalty\@secpenalty
    \vspace{\@nameuse{cftbefore#3titleskip}}%
    \@cftpagestyle
    {\interlinepenalty\@M
    {\@nameuse{cft#3titlefont}#4}{\@nameuse{cftafter#3title}}%
    \@nameuse{cftmark#3}%
    \par\nobreak
    \vskip \@nameuse{cftafter#3titleskip}%
    \@afterheading}
  }

  \expandafter\newlength\csname cftbefore#3titleskip\endcsname
  \expandafter\newlength\csname cftafter#3titleskip\endcsname
  \if@cfthaschapter
    \setlength{\@nameuse{cftbefore#3titleskip}}{50pt}
    \setlength{\@nameuse{cftafter#3titleskip}}{40pt}
    \if@cftkoma
      \@namedef{cft#3titlefont}{\size@chapter\sectfont}
    \else
      \@namedef{cft#3titlefont}{\normalfont\Huge\bfseries}
    \fi
  \else
    \setlength{\@nameuse{cftbefore#3titleskip}}{3.5ex \@plus 1ex \@minus .2ex}
    \setlength{\@nameuse{cftafter#3titleskip}}{2.3ex \@plus .2ex}
    \if@cftkoma
      \@namedef{cft#3titlefont}{\size@section\sectfont}
    \else
      \@namedef{cft#3titlefont}{\normalfont\Huge\bfseries}
    \fi
  \fi
  \@namedef{cftafter#3title}{}
  \@namedef{cft#3prehook}{}
  \@namedef{cft#3posthook}{}
}

%-------------------------------------------------------------------------------
% Definition environment
%-------------------------------------------------------------------------------
\typeout{   ... definition}
\newcommand{\listdefinitionname}{List of Definitions}
\newlistof[chapter]{definition}{lodef}{\listdefinitionname}
\newcommand{\definitionautorefname}{Definition}

\newenvironment{definition}[1][]{%
  \refstepcounter{definition}%
  \addcontentsline{lodef}{definition}{\protect\numberline{\thedefinition}\xspace #1}
  \begin{tcolorbox}[%
    before skip=0.35cm, colback=cTDAQblockdefinition!\fTDAQblockbg!white, colframe=cTDAQblock,%
    title={\bf \definitionautorefname\xspace \thedefinition: \let\inenvhead\inenvheader {\it #1} \let\inenvhead\notinenvheader},fonttitle=\bfseries,%
    title style={left color=cTDAQblockdefinition,right color=cTDAQblockdefinition!\nTDAQblockfadeto},%
    enhanced,shadow={2mm}{-1mm}{0mm}{fill=cTDAQblockshadow,opacity=\fTDAQblockshadow}%
  ]%
    \par
}{%
  \end{tcolorbox}%
}

\renewcommand*{\thedefinition}{\thechapter.\arabic{definition}}
\renewcommand{\cftlodeftitlefont}{\Large\bfseries}
\renewcommand{\cftafterlodeftitle}{\hfill}
\cftsetindents{definition}{0.5cm}{1.25cm}
\crefname{definition}{definition}{definitions}
\Crefname{definition}{Definition}{Definitions}
%\creflabelformat{definition}{#2#1#3}
\crefrangelabelformat{definition}{#3#1#4 -- #5#2#6}

%-------------------------------------------------------------------------------
% Recommendation environment
%-------------------------------------------------------------------------------
\typeout{   ... recommendation}
\newcommand{\listrecommendationname}{List of Recommendations}
\newlistof[chapter]{recommendation}{lorec}{\listrecommendationname}
\newcommand{\recommendationautorefname}{Recommendation}

\newenvironment{recommendation}[1][]{%
  \refstepcounter{recommendation}
  \addcontentsline{lorec}{recommendation}{\protect\numberline{\therecommendation}\xspace #1}
  \begin{tcolorbox}[%
    before skip=0.35cm, colback=cTDAQblockrecommendation!\fTDAQblockbg!white,colframe=cTDAQblock,%
    title={\bf \recommendationautorefname\xspace\therecommendation: \let\inenvhead\inenvheader {\it #1} \let\inenvhead\notinenvheader},%
    title style={left color=cTDAQblockrecommendation,right color=cTDAQblockrecommendation!\nTDAQblockfadeto},%
    enhanced,shadow={2mm}{-1mm}{0mm}{fill=cTDAQblockshadow,opacity=\fTDAQblockshadow}%
  ]%
  \par
}{%
  \end{tcolorbox}%
}

\renewcommand*{\therecommendation}{\thechapter.\arabic{recommendation}}
\renewcommand{\cftlorectitlefont}{\Large\bfseries}
\renewcommand{\cftafterlorectitle}{\hfill}
\cftsetindents{recommendation}{0.5cm}{0.75cm}
\crefname{recommendation}{recommendation}{recommendations}
\Crefname{recommendation}{Recommendation}{Recommendations}

%-------------------------------------------------------------------------------
% Requirement environment
%-------------------------------------------------------------------------------
\typeout{   ... requirement}
\newcommand{\listrequirementname}{List of Requirements}
\newlistof[chapter]{requirement}{loreq}{\listrequirementname}
\newcommand{\requirementautorefname}{Requirement}
\newenvironment{requirement}[1][]{%
  \refstepcounter{requirement}
  \addcontentsline{loreq}{requirement}{\protect\numberline{\therequirement}\xspace #1}
  \begin{tcolorbox}[%
    before skip=0.35cm, colback=cTDAQblockrequirement!\fTDAQblockbg!white, colframe=cTDAQblock,%
    title={\bf \requirementautorefname\xspace\therequirement: \let\inenvhead\inenvheader {\it #1} \let\inenvhead\notinenvheader},%
    title style={left color=cTDAQblockrequirement, right color=cTDAQblockrequirement!\nTDAQblockfadeto},%
    enhanced,shadow={2mm}{-1mm}{0mm}{fill=cTDAQblockshadow,opacity=\fTDAQblockshadow},%
    fonttitle=\bfseries%
  ]%
  \par%
}{%
  \end{tcolorbox}%
}

\renewcommand*{\therequirement}{\thechapter.\arabic{requirement}}
\renewcommand{\cftloreqtitlefont}{\Large\bfseries}
\renewcommand{\cftafterloreqtitle}{\hfill}
\cftsetindents{requirement}{0.5cm}{1.25cm}
\crefname{requirement}{requirement}{requirements}
\Crefname{requirement}{Requirement}{Requirements}
\crefrangelabelformat{requirement}{#3#1#4 -- #5#2#6}

%-------------------------------------------------------------------------------
% Longrequirement environment
%-------------------------------------------------------------------------------
\typeout{   ... longrequirement}
\newenvironment{longrequirement}[6][]{%
  \refstepcounter{longruleCounter}
  \refstepcounter{longrequirement}
%  \addcontentsline{loreq}{longrequirement}{\protect\numberline{\arabic{chapter}.\checksectionnumber\thelongrequirement}\xspace #1}
  \addcontentsline{lolongreq}{longrequirement}{\protect\numberline{\thelongrequirement}\xspace #1 #2}
  \begin{tcolorbox}[%
    before skip=0.35cm, colback=cTDAQblockrequirement!\fTDAQblockbg!white, colframe=cTDAQblock,%
    title={UR-#2-\thelongruleCounter: #3:#4, #5,  {\it#1} from #6},%
    title style={left color=cTDAQblockrequirement, right color=cTDAQblockrequirement!\nTDAQblockfadeto},%
    enhanced,shadow={2mm}{-1mm}{0mm}{fill=cTDAQblockshadow,opacity=\fTDAQblockshadow},%
    fonttitle=\bfseries%
  ]%
  \par%
}{%
  \end{tcolorbox}%
}

\newcommand*{\thelongrequirement}{\thechapter.\arabic{longrequirement}}

%-------------------------------------------------------------------------------
% Specification environment
%-------------------------------------------------------------------------------
\typeout{   ... specification}
\newcommand{\listspecificationname}{List of Specifications}
\newlistof[chapter]{specification}{lospec}{\listspecificationname}
\newcommand{\specificationautorefname}{Specification}
\newenvironment{specification}[1][]{%
  \refstepcounter{specification}
  \addcontentsline{lospec}{specification}{\protect\numberline{\thespecification}\xspace #1}
  \begin{tcolorbox}[%
    before skip=0.35cm, colback=cTDAQblockspecification!\fTDAQblockbg!white, colframe=cTDAQblock,%
    title={\bf \specificationautorefname\xspace\thespecification: \let\inenvhead\inenvheader {\it #1} \let\inenvhead\notinenvheader},%
    title style={left color=cTDAQblockspecification, right color=cTDAQblockspecification!\nTDAQblockfadeto},%
    enhanced,shadow={2mm}{-1mm}{0mm}{fill=cTDAQblockshadow,opacity=\fTDAQblockshadow},%
    fonttitle=\bfseries%
  ]%
  \par%
}{%
  \end{tcolorbox}%
}

\renewcommand*{\thespecification}{\thechapter.\arabic{specification}}
\renewcommand{\cftlospectitlefont}{\Large\bfseries}
\renewcommand{\cftafterlospectitle}{\hfill}
\cftsetindents{specification}{0.5cm}{1.25cm}
\crefname{specification}{specification}{specifications}
\Crefname{specification}{Specification}{Specifications}
\crefrangelabelformat{specification}{#3#1#4 -- #5#2#6}

%-------------------------------------------------------------------------------
% Remark environment
%-------------------------------------------------------------------------------
\typeout{   ... remark}
\newcommand{\listremarkname}{List of Remarks}
\newlistof[chapter]{remark}{lorem}{\listremarkname}
\newcommand{\remarkautorefname}{Remark}
\newenvironment{remark}[1][]{%
  \refstepcounter{remark}
  \addcontentsline{lorem}{remark}{\protect\numberline{\theremark}\xspace #1}
  \begin{tcolorbox}[%
    before skip=0.35cm, colback=cTDAQblockremark!\fTDAQblockbg!white, colframe=cTDAQblock,%
    title={\bf \remarkautorefname\xspace\theremark: \let\inenvhead\inenvheader {\it #1} \let\inenvhead\notinenvheader},%
    fontupper=\sffamily,%
    title style={left color=cTDAQblockremark,right color=cTDAQblockremark!\nTDAQblockfadeto},%
    enhanced,shadow={2mm}{-1mm}{0mm}{fill=cTDAQblockshadow,opacity=\fTDAQblockshadow}%
  ]%
  \par
}{%
  \end{tcolorbox}%
}

\renewcommand*{\theremark}{\thechapter.\arabic{remark}}
\renewcommand{\cftloremtitlefont}{\Large\bfseries}
\renewcommand{\cftafterloremtitle}{\hfill}
\cftsetindents{remark}{0.5cm}{1.25cm}
\crefname{remark}{remark}{remarks}
\Crefname{remark}{Remark}{Remarks}
\crefrangelabelformat{remark}{#3#1#4 -- #5#2#6}

%-------------------------------------------------------------------------------
% Review comment environment
%
% We use the todonotes package directly:
%   here we just define a dedicated 'List of Review Comments'
%-------------------------------------------------------------------------------
\if@Draft
	% correction on the margin for the ToC of \todonotes to prevent overfull \hbox
	% ATTENTION: This setting is global so also has effect on any other ToC-like command!
	\contentsmargin{2em}
	% so here let's define the list
	\newcommand{\listreviewname}{List of Review Comments}%
	\newlistof[chapter]{reviewcomments}{lorev}{\listreviewname}%
\else
	\newcommand{\listofreviewcomments}[1]{}
\fi

\newcommand{\addElementToReviewList}{%
    \if@todonotes@colorinlistoftodos%
        \addcontentsline{lorev}{reviewcomments}{%
            \fcolorbox{\@todonotes@currentbordercolor}%
                {\@todonotes@currentbackgroundcolor}%
                {\textcolor{\@todonotes@currentbackgroundcolor}{o}}%
            \ \@todonotes@caption}%
    \else%
        \addcontentsline{lorev}{reviewcomments}{\@todonotes@caption}%
    \fi%
}%

%-------------------------------------------------------------------------------
% glossary entries in definition, requirement and remark: apply link color
%-------------------------------------------------------------------------------

% global flags if in environment or not
\def\inenvheader{true}
\def\notinenvheader{false}
% the environments set \inenvhead in their title to \inenvheader
% then, print the title and set \inenvhead  back to \notinenvheader

% now, change the gls link color to something compatible with the background color
\newcommand*{\glsplainhyperlink}[2]{%
  \colorlet{currentlink}{\@linkcolor}% store current link color
  % now set the link color wrt. the environment
  \ifx\inenvhead\inenvheader
    \hypersetup{linkcolor=\@glsenvcolor}% set link color while in title
  \else
    \hypersetup{linkcolor=\@glsmaincolor}% set link color while not in title
  \fi
  \hyperlink{#1}{#2}% put the gls entry
  \hypersetup{linkcolor=currentlink}% reset to default
}

% override the existing \@glslink to use above command instead
\let\@glslink\glsplainhyperlink

%-------------------------------------------------------------------------------
% loadrevhistory environment
%-------------------------------------------------------------------------------
\typeout{==> Define loadrevhistory command}
\DeclareDocumentCommand \loadrevhistory {o m}{%
  \section*{Revision History}\label{part:history}
  \sectionmark{Revision History}
  % \IfNoValueTF{#1}{}{\addcontentsline{toc}{section}{Revision History}}
  \addcontentsline{toc}{section}{Revision History}
  \input{#2}
  \clearpage
}

\typeout{ ===> Redefining contentsname And tableofcontents }
%\renewcommand\contentsname{{\fontsize{28}{32}\selectfont Contents}}
\renewcommand\contentsname{Table of Contents}
\renewcommand\tableofcontents{%
  \section*{\contentsname}
  \sectionmark{\contentsname}
  \addcontentsline{toc}{section}{\contentsname}
  \@starttoc{toc}%
  \cleardoublepage
}

%-------------------------------------------------------------------------------
\AtBeginDocument{
  \tcbuselibrary{skins,breakable,hooks,xparse,fitting}
  \usetikzlibrary{fadings,arrows}
%-------------------------------------------------------------------------------
% tikzrule and west/eastgradient commands
%-------------------------------------------------------------------------------
  \usetikzlibrary{fadings,arrows}
  \newcommand{\tikzrule}[2][]{%
    \ifodd\c@page%
      \tikz{%
        \node[inner sep=0] (logo) at (0.025\textwidth,#2/2){% the image coordinate is where its center goes
          \includegraphics*[width=0.05\textwidth]{\@TemplatePath/logos/AT_atlaslogo_2015}%
        };% no need to restrict its height
        \fill[#1,path fading=west] (0.05\textwidth,0) rectangle (\textwidth,#2);%
      }%
    \else%
      \tikz{\fill[#1,path fading=east] (0,0) rectangle (\textwidth,#2);}%
    \fi%
  }

  \newcommand{\tikztablerule}[3][]{%
    \ifodd\c@page%
      \tikz{\fill[#1,path fading=west] (0.05\textwidth,0) rectangle (#2,#3);}%
    \else%
      \tikz{\fill[#1,path fading=east] (0,0) rectangle (#2,#3);}%
    \fi%
  }

%  \renewcommand{\arraystretch}{1.4}
  \newcommand{\head}[1]{\textsf{\textbf{#1}}}

% should we better use this?
%\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
  \newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
  \newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
  \newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}


%\newtcolorbox[use counter*=table]{ATLASPhaseIITabHeader}[2][]{%
  \newtcolorbox[]{ATLASPhaseIITabHeader}[2][]{%
    blank, sharp corners=all, coltitle=black,colback=white,colframe=black,
    enhanced,check odd page,toggle left and right,
    boxsep=0pt,top=0pt,bottom=0pt,leftupper=0pt,rightupper=0pt,
 % title={Table\ \thetable\ : \ #3},list text={#3},add to list={lot}{section},label=#1,
    fontupper=\bfseries\sffamily,
    tabularx*={\arrayrulecolor{black}\renewcommand{\arraystretch}{1.4}}{#2},
    before upper  app={\toprule\let\toprule\relax},
    after  upper app={\endtabularx},
    boxrule=0pt,
    if odd page={interior style={left color=CadetBlue!30, right color=cTDAQheader!70}}{interior style={left color=cTDAQheader,right color=CadetBlue!30}},
    if odd page={coltext=black}{coltext=white},
  }

%\newtcolorbox[use counter*=table]{ATLASPhaseIITabBody}[2][]{%
  \newtcolorbox[]{ATLASPhaseIITabBody}[2][]{%
    blank, sharp corners=all, coltitle=black,colback=white,colframe=black,
    enhanced,check odd page,toggle left and right,
    boxsep=0pt,top=0pt,bottom=0pt,leftupper=0pt,rightupper=0pt,
    tabularx*={\arrayrulecolor{black}\renewcommand{\arraystretch}{1.0}}{#2},
    before upper  app={\let\toprule\relax},
    after  upper app={\endtabularx},
    boxrule=0pt,
  }

  \newcommand\templatetableshortcaption{} % make sure \templatetableshortcaption is not in use.
  \newcommand\templatetablecaption{} % make sure \templatetablecaption is not in use.
  \newcommand\templatetablelabel{} % make sure \templatetablelabel is not in use.
  \newenvironment{templatetable}[6]{
    \def\templatetableshortcaption{#1}
    \def\templatetablecaption{#2}
    \def\templatetablelabel{#3}

    \setlength\LTleft{0pt}
    \setlength\LTright{0pt}
    \begin{longtable}{@{\extracolsep{\fill}}#5@{}}
      \hline
      #6 \\
      \hline
      \endfirsthead
      \multicolumn{#4}{r}{...continued from previous page} \\
%      \caption[]{(continued from previous page...)} \\
      \hline
      #6 \\
      \hline
      \endhead
      \hline % some more vertical space would be nice
      \multicolumn{#4}{r}{...continued on next page} \\
%      \caption[]{continued on next page...} \\
      \endfoot
      \endlastfoot
  }{
      \hline
      \caption[\templatetableshortcaption]{\templatetablecaption}
      \label{tab:\templatetablelabel}
    \end{longtable}
  }

% Hardware Interface Table
  \newenvironment{hwiftable}[2]{
    \begin{templatetable}
      {#1}% shortcaption
      {#1}% caption
      {#2}% label
      {2}% number of columns
      {|L{.47\linewidth}|L{.47\linewidth}|}% column definitions
      {\textbf{Name of Component} & \textbf{Name of Component Specification}
\if@Draft
  \\
  \hline
  List each electrical, mechanical or other component which interfaces to this component. & List the name of the specification for each component in the left column.
\fi
      }% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% Hardware Interface Table
  \newenvironment{hwpintable}[2]{
    \begin{templatetable}
      {#1}% shortcaption
      {#1}% caption
      {#2}% label
      {2}% number of columns
      {|L{.47\linewidth}|L{.47\linewidth}|}% column definitions
      {\textbf{Name or Number} & \textbf{Description}
\if@Draft
  \\
  \hline
  Name or number from \figref{physical-description:floorplan} & Very brief description of connection.
\fi
      }% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% Hardware Input/Output Table
  \newenvironment{hwiotable}[2]{
    \begin{templatetable}
      {#1}% shortcaption
      {#1}% caption
      {#2}% label
      {5}% number of columns
      {|L{.22\linewidth}|C{.12\linewidth}|C{.12\linewidth}|C{.12\linewidth}|L{.27\linewidth}|}% column definitions
      {\textbf{Name} & \textbf{In, Out or I/O} & \textbf{Type of Signal or Max/Min} & \textbf{Input or Output Impedance} & \textbf{Description}}% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% Hardware Power Table
  \newenvironment{hwpowertable}[2]{
    \begin{templatetable}
      {#1}% shortcaption
      {#1}% caption
      {#2}% label
      {5}% number of columns
      {|L{.1\linewidth}|L{.17\linewidth}|L{.18\linewidth}|L{.18\linewidth}|L{.22\linewidth}|}% column definitions
      {\textbf{Name} & \textbf{Max/Nom/Min} & \textbf{Nom/Max I} & \textbf{Max/Min V} & \textbf{Other}\\ & \textbf{V or I supplied} & \textbf{for voltage source} & \textbf{for current source} & \textbf{Requirements}}% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% Firmware External Interface Table
  \newenvironment{fweitable}[2]{
    \begin{templatetable}
      {#1}% shortcaption
      {#1}% caption
      {#2}% label
      {3}% number of columns
      {|L{.3\linewidth}|L{.3\linewidth}|L{.31\linewidth}|}% column definitions
      {\textbf{Name of Component} & \textbf{Name of Component Specification} & \textbf{Remark}%
\if@Draft
  \\
  \hline
  List each device/chip which the firmware interfaces to on the board. & List the name of the specification for each component in the left column. & Indicate the direction (input or output), number of links and their individual throughput. (Specify the protocol and data format.)%
\fi%
      }% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% Firmware Input/Output Table
  \newenvironment{fwiotable}[3]{
    \begin{templatetable}
      {#1}% shortcaption
      {#2}% caption
      {#3}% label
      {4}% number of columns
      {|L{.22\linewidth}|C{.12\linewidth}|C{.12\linewidth}|L{.42\linewidth}|}% column definitions
      {\textbf{Name} & \textbf{Direction} & \textbf{Type} & \textbf{Description}}% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

  \newenvironment{interfacetable}[3]{
    \begin{templatetable}
      {#1}% shortcaption
      {#2}% caption
      {#3}% label
      {4}% number of columns
      {|L{.22\linewidth}|C{.12\linewidth}|C{.12\linewidth}|L{.42\linewidth}|}% column definitions
      {\textbf{Port} & \textbf{Direction} & \textbf{Width} & \textbf{Description}}% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% so we actually don't need a longtable for resources as the usual indication would be one line only, but it can still be meaningful when making a summary ... (some more work would be needed then)
  \newenvironment{resourcetable}[2]{
    \begin{templatetable}
      {#1}% shortcaption
      {#1 (%
        LUT: Look-Up Table, %
        DSP: Digital Signal Processing block, %
        XCV: (High speed) Transceivers%
        )%
      }% caption
      {#2}% label
      {7}% number of columns
      {|C{.11\linewidth}|C{.11\linewidth}|C{.11\linewidth}|C{.11\linewidth}|C{.11\linewidth}|C{.11\linewidth}|C{.11\linewidth}|}% column definitions
      {%
        \textbf{LUTs} &
        \textbf{Registers} &
        \textbf{Memory (kb)} &
        \textbf{DSPs} &
        \textbf{User I/O pins} &
        \textbf{LVDS pairs} &
        \textbf{XCVs}
      }% column labels (no trailing \\)
  }{
    \end{templatetable}
  }

% to be seen if this could not also just use the templatetable ...
  \newenvironment{ATLASPhaseIITable}[6][!ht]{%
    \begin{table}[#1]
      \caption{#3}
      \label{#4}
      \vspace{-0.75\normalbaselineskip}
      \begin{ATLASPhaseIITabHeader}{#2}
        \tabularnewline\noalign{\vspace{-1.5\normalbaselineskip}} #5 \\ \bottomrule
      \end{ATLASPhaseIITabHeader}
      \begin{ATLASPhaseIITabBody}{#2}
        \tabularnewline\noalign{\vspace{-1.25\normalbaselineskip}}
        #6
      \end{ATLASPhaseIITabBody}
  }{
    \end{table}
  }

% to be seen if this could not also just use the templatetable ...
  \NewDocumentEnvironment{ATLASPhaseIILongTable}{o m m m m m o}{%
    \begin{ThreePartTable}
      \IfNoValueTF{#1}{ \begin{table}[!htbp] }{ \begin{table}[#1] }
      \IfNoValueTF{#3}{ \caption{No caption given} }{ \caption{#3} }
      \IfNoValueTF{#4}{ \label{tb:tmp} }{ \label{#4} }
      \vspace{-0.75\normalbaselineskip}
      \IfNoValueF{#2}{
      \begin{ATLASPhaseIITabHeader}{#2}
        \tabularnewline\noalign{\vspace{-1.5\normalbaselineskip}}
        \IfNoValueF{#5}{#5}
        \\ \bottomrule
      \end{ATLASPhaseIITabHeader}
      \begin{ATLASPhaseIITabBody}{#2}
        \tabularnewline\noalign{\vspace{-1.25\normalbaselineskip}}
        \IfNoValueF{#6}{#6}
      \end{ATLASPhaseIITabBody}
    }
  }{%
    \end{table}
    \IfNoValueTF{#7}{
      \typeout{Didnt find Long Table Optional argument 7 For tablenotes}
    }{#7}
    \end{ThreePartTable}
  }

  \typeout{ ===> Execution of commands AtBeginDocument }
  \pagenumbering{roman}
  \pagestyle{ATLASPhaseIIToc}
  \if@CoverPage
    \thispagestyle{empty}
    \includepdf{Cover/FrontCover}
  \fi
  \if@Draft
    \usepackage{draftwatermark}
    \SetWatermarkLightness{0.9}
    \linenumbers
% using the todonotes, with all notes on
    \usepackage[colorinlistoftodos]{todonotes}
  \else
% using the todonotes, with all notes off
    \usepackage[disable]{todonotes}
  \fi
  %\bookmarksetup{open,numbered}
%   \DeclareRobustCommand{\cmark}{\textbf{\color{OliveGreen}\ding{51}}}
  \DeclareRobustCommand{\cmark}{\textbf{\color{OliveGreen}\ding{51}}}
%  \floatsetup[table]{capposition = top, font = sf}    % Sets table to sans serif font and puts the caption on the top
  \captionsetup[figure]{labelfont=bf, textfont=rm, justification=justified, singlelinecheck=true}
  \captionsetup[table]{labelfont=bf, textfont=sf, justification=justified, singlelinecheck=false}
  \setstackEOL{\#}
  \setstackgap{L}{12pt}

  \renewcommand{\TPTtagStyle}{\sf\it}
  \def\fltnote#1{\protect\TPToverlap{\textsuperscript{{\TPTtagStyle see Note #1}}}}
  \def\fltnotes#1{\protect\TPToverlap{\textsuperscript{{\TPTtagStyle see Notes #1}}}}
  \g@addto@macro\TPT@defaults{\footnotesize}
  \renewcommand{\TPTdoTablenotes}{%
    \list{}{\topsep 1pt  \partopsep 1pt \head{Notes: }\hfil%
      \itemsep 2pt \parsep 2pt \itemindent 3pt
      \TPTnoteSettings
      \let\makelabel\TPTnoteLabel%
    }
  }

  %\pagenumbering{arabic} % reset page numbering after title page
}

\AtEndDocument{
  \typeout{ ===> Execution of commands AtEndDocument }
  \if@CoverPage
    \thispagestyle{empty}
    \includepdf{Cover/BackCover}
  \fi
}

% That's all, folks!
\endinput
