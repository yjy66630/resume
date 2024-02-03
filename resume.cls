\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
\LoadClass[10pt]{article}

% disable indent globally
\setlength{\parindent}{0pt}
% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
% use fontawesome
\RequirePackage{fontawesome}
% use xcolor for customizing color
\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% Main document font
\setmainfont{Noto Serif CJK SC}

\RequirePackage[
	a4paper,
	left=0.6in,
	right=0.6in,
	top=0.8in,
	bottom=0.3in,
	nohead
]{geometry}


\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}
\RequirePackage[super]{nth}

%%%%%%%%%%%%%%%%%%%%%%%% Color %%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{basecolor}{HTML}{000000}%
\definecolor{basecolor}{HTML}{000066} % blue
%
\definecolor{darkGrey}{HTML}{989898}
%
\colorlet{linkcolor}{basecolor}
\colorlet{accentcolor}{linkcolor!90}
\colorlet{symbolcolor}{linkcolor!85}

%%%%%%%%%%%%%%%%%%%%%%%% Section %%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1}{*1}

\newcommand*{\sectionTitle}[2]{%
  \section{%
    \texorpdfstring%
      {\color{accentcolor}{\icon{#2} \textbf{#1}}}%
      {#1}%
  }
}

%%%%%%%%%%%%%%%%%%%%%%%% EnumItem %%%%%%%%%%%%%%%%%%%%%%%%
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em}
\setlist[description,1]{style=sameline}

%%%%%%%%%%%%%%%%%%%%%%%% Subsection %%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1}{*0.5}

%%%%%%%%%%%%%%%%%%%%%%%% Date Subsection %%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\datedsubsection}[3]{%
  \ifx\relax#3\relax
    \subsection[#1]{#1 \hfill #2}%
  \else
    \subsection[#1]{#1 \hfill #2 $\sim$ #3}%
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%% Name %%%%%%%%%%%%%%%%%%%%%%%%
% Render the name: \name{<lastname>}{<firstanme>}
\newcommand*{\name}[2]{%
  \textcolor{accentcolor}{\LARGE\bfseries #2 #1}
}

%%%%%%%%%%%%%%%%%%%%%%%% Photo %%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\yourphoto}[1]{
  \hfill \smash{\includegraphics[width={#1}\paperwidth]{images/you.jpg}}
}

%%%%%%%%%%%%%%%%%%%%%%%% Sepspace %%%%%%%%%%%%%%%%%%%%%%%%
% add
\newcommand{\sepspace}{\vspace*{1em}}		        % Vertical space macro

%%%%%%%%%%%%%%%%%%%%%%%% Icon In Header %%%%%%%%%%%%%%%%%%%%%%%%
\def\@iconsize{\Large}
\newcommand*{\iconsize}[1]{\def\@iconsize{#1}}

\newcommand*{\icon}[1]{%
  {\@iconsize\makebox[1em][c]{\textcolor{symbolcolor}{#1}}}%
  \hspace{0.2em}\strut%
}

% Font Awesome icon aliases
\newcommand*{\birthdaySymbol}{\faBirthdayCake}
\newcommand*{\degreeSymbol}{\faGraduationCap}
\newcommand*{\githubSymbol}{\faGithub}
\newcommand*{\homeSymbol}{\faHome}
\newcommand*{\infoSymbol}{\faInfoCircle}
\newcommand*{\mailSymbol}{\faAt}
\newcommand*{\mobileSymbol}{\faPhone}  % \faMobilePhone is too narrow
\newcommand*{\linkedinSymbol}{\faLinkedin}
\newcommand*{\locationSymbol}{\faMapMarker*}
\newcommand*{\phoneSymbol}{\faPhone}
\newcommand*{\universitySymbol}{\faUniversity}

% Render a text with its icon
% Usage: \icontext{<icon>}{<label>}
\newcommand*{\icontext}[2]{%
  \mbox{\icon{#1} #2 \hspace{1em}}%
}

% Render a link with its icon and text
% Usage: \iconlink{<icon>}{<label>}{<text>}
\newcommand*{\iconlink}[3]{%
  \mbox{\icon{#1} \link{#2}{#3} \hspace{1em}}%
}

\newcommand*{\githublink}[2]{%
  \href{http://github.com/#1/#2}{\githubSymbol{} #1/#2}%
}

\newcommand*{\link}[2]{\textcolor{linkcolor}{\href{#1}{#2}}}

% Address
\newcommand*{\address}[1]{\icontext{\locationSymbol}{#1}}
% Birthday
\newcommand*{\birthday}[1]{\icontext{\birthdaySymbol}{#1}}
% Home
\newcommand*{\home}[1]{\icontext{\homeSymbol}{#1}}
% Information
\newcommand*{\info}[1]{\icontext{\infoSymbol}{#1}}
% Mobile phone
\newcommand*{\mobile}[1]{\icontext{\mobileSymbol}{#1}}
% Phone
\newcommand*{\phone}[1]{\icontext{\phoneSymbol}{#1}}
% Degree
\newcommand*{\degree}[1]{\icontext{\degreeSymbol}{#1}}
% University
\newcommand*{\university}[1]{\icontext{\universitySymbol}{#1}}

% GitHub: \github{<username>}
\newcommand*{\github}[1]{%
  \iconlink{\githubSymbol}%
    {https://github.com/#1}%
    {\texttt{github.com/#1}}%
}
% Email address
\newcommand*{\email}[1]{%
  \iconlink{\mailSymbol}{mailto:#1}{\texttt{#1}}
}

\newcommand{\Content}[3]{
    \begin{itemize}[parsep=0.5ex]
    \item \textit{描述}：#1
    \item \textit{我的职责}：#2
    \item \textit{成果}：#3
    \end{itemize}
	\normalsize \par
}