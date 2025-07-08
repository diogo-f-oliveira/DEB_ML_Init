function [data, auxData, metaData, txtData, weights] = mydata_Placopecten_magellanicus

%% set metaData
metaData.phylum     = 'Mollusca';
metaData.class      = 'Bivalvia';
metaData.order      = 'Pectinida';
metaData.family     = 'Pectinidae';
metaData.species    = 'Placopecten_magellanicus';
metaData.species_en = 'Atlantic deep-sea scallop';

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7);
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'};
metaData.data_1     = {'t-L_f'; 'L-Wd'; 'L-N'; 'Wd-JO_f'; 'T-JO'};

metaData.COMPLETE = 3.6;

metaData.author    = {'Romain Lavaud'};
metaData.date_subm = [2018 01 22];
metaData.email     = {'romain.lavaud@dfo-mpo.gc.ca'};
metaData.address   = {'Fisheries and Ocean Canada, Moncton, Canada'};

metaData.author_mod_1    = {'Bas Kooijman'};
metaData.date_mod_1      = [2020 03 21];
metaData.email_mod_1     = {'romain.lavaud@dfo-mpo.gc.ca'};
metaData.address_mod_1   = {'Fisheries and Ocean Canada, Moncton, Canada'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 03 21]; 

%% Set zero-variate data;
data.ab   = 4;        units.ab      = 'd'; label.ab      = 'age at birth';         bibkey.ab = 'Cull1974';
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj   = 35;       units.aj      = 'd'; label.aj      = 'age at metamorphosis'; bibkey.aj = 'Cull1974';
  temp.aj = C2K(15);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap   = 365;      units.ap      = 'd'; label.ap      = 'age at puberty';       bibkey.ap = {'Naid1970','ParsRobi1992'};
  temp.ap = C2K(12);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am   = 365 * 20; units.am      = 'd'; label.am      = 'life span';            bibkey.am = 'MacDThom1985';
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.0105; units.Lb = 'cm'; label.Lb = 'shell length at birth';         bibkey.Lb = 'Cull1974';
data.Lj = 0.035;  units.Lj = 'cm'; label.Lj = 'shell length at metamorphosis'; bibkey.Lj = 'Cull1974';
data.Lp = 2.5;    units.Lp = 'cm'; label.Lp = 'shell length at puberty';       bibkey.Lp = {'Naid1970','LangRobi1987','ParsRobi1992'};
data.Li = 23;     units.Li = 'cm'; label.Li = 'ultimate shell length';         bibkey.Li = 'ADW';

data.Wdb = 1.5e-7; units.Wdb = 'g'; label.Wdb = 'dry tissue weight at birth';         bibkey.Wdb = 'guess';
data.Wdj = 4e-6;   units.Wdj = 'g'; label.Wdj = 'dry tissue weight at metamorphosis'; bibkey.Wdj = 'guess';
data.Wdp = 0.5;    units.Wdp = 'g'; label.Wdp = 'dry tissue weight at puberty';       bibkey.Wdp = 'guess';
data.Wdi = 50;     units.Wdi = 'g'; label.Wdi = 'ultimate dry tissue weight';         bibkey.Wdi = 'guess';

data.Ri   = 3e5;    units.Ri      = '#/d'; label.Ri      = 'maximum reprod rate'; bibkey.Ri = {'MacDThom1985','Guess'};
  temp.Ri = C2K(7); units.temp.Ri = 'K';   label.temp.Ri = 'temperature';

%% Set uni-variate data
 % Time vs. shell length (North and South populations)
data.tL1 = [912 1277 1642 2007 2372 2737 3102; % d, time since birth
            4.09 6.39 8.33 9.99 11.33 12.35 13.38]'; % cm, shell length at f and T
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'shell length', '10 m'};
temp.tL1 = C2K(3.98); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'Growth at 10 m in Newfoundland - yearly average temperature'; bibkey.tL1 = 'MacDThom1988';
%
data.tL2 = [912 1277 1642 2007 2372 2737 3102; % d, time since birth
            4.06 5.83 7.44 8.76 9.81 10.82 11.56]'; % cm, shell length at f and T
units.tL2 = {'d', 'cm'}; label.tL2 = {'time since birth', 'shell length', '31 m'};
temp.tL2 = C2K(2.62); units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'Growth at 31 m in Newfoundland - yearly average temperature'; bibkey.tL2 = 'MacDThom1988';

 % Time vs. shell length (Center population, Gulf of Saint-Lawrence)
data.tL3 = [2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 7 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 9 9 9 9 9 9 9 10 10 10 10 10 10 11 11 11 11 11 12 12 12 12 13 13 13 14 14 15; % y, time since birth
            1.97 1.93 1.95 2.00 2.03 2.01 1.99 1.97 1.96 1.93 1.89 1.85 1.91 4.91 4.57 4.30 4.20 4.18 4.17 4.19 4.16 4.16 4.12 4.09 4.01 3.94 7.05 6.53 6.30 6.23 6.20 6.17 6.09 6.10 6.05 5.98 5.94 5.83 8.38 8.05 7.94 7.86 7.79 7.69 7.67 7.59 7.52 7.48 7.34 9.37 9.24 9.13 9.04 8.92 8.89 8.80 8.72 8.66 8.47 10.22 10.11 10.01 9.91 9.83 9.76 9.69 9.65 9.42 10.85 10.76 10.66 10.57 10.51 10.44 10.45 10.22 11.34 11.24 11.15 11.11 11.05 11.04 10.89 11.71 11.64 11.60 11.56 11.58 11.43 12.04 12.03 11.99 12.02 11.91 12.38 12.36 12.38 12.31 12.68 12.71 12.69 13.00 13.03 13.32]'; % cm, shell length
data.tL3(:,1) = 365 * data.tL3(:,1); % d, convert to days
units.tL3 = {'d', 'cm'}; label.tL3 = {'time since birth', 'shell length'};
temp.tL3 = C2K(6); units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
comment.tL3 = 'Estimated yearly average temperature'; bibkey.tL3 = 'RoddLund1994';

 % Shell length vs. tissue dry weight
data.LWd = [4.67 4.70 4.76 4.83 4.86 4.97 5.01 5.05 5.39 5.47 5.51 5.57 5.58 5.89 5.96 3.29 4.01 4.15 4.28 4.53 4.70 4.86 5.03 5.05 5.07 5.08 5.08 5.80 6.34 3.12 3.46 3.70 3.73 3.79 3.94 4.10 4.11 4.12 4.19 4.28 4.29 4.39 4.48 4.62 5.07 5.13 5.27 5.38; % cm, shell length
            0.73 0.81 0.66 0.8 0.8 0.92 0.93 0.93 1.6 1.33 1.01 1.56 2.03 2.12 1.64 0.13 0.41 0.48 0.49 0.51 0.73 0.79 0.87 1.03 1.07 0.89 1 1.79 1.99 0.13 0.16 0.14 0.3 0.29 0.25 0.3 0.36 0.26 0.34 0.41 0.3 0.27 0.39 0.52 0.8 0.73 0.91 0.91]'; % g, tissue dry weight
units.LWd = {'cm', 'g'}; label.LWd = {'shell length', 'tissue dry weight'}; bibkey.LWd = 'ClaeBure1994';
temp.LWd = C2K(9.5); units.temp.LWd = 'K'; label.temp.LWd = 'temperature';

 % Length vs. fecundity
data.LN = [0 4.5 5.0 5.5 6.0 6.5 7.0 7.5 8.0 8.5 9.0 9.5 10.0 10.5 11.0 11.5 12.0 12.5 13.0 13.5 14.0 14.5 15.0 15.5 16.0; % cm, shell length
           0 2.5 4.5 6.5 8.25 10.75 13.5 17.25 21.75 27.25 34.25 42.5 52.25 63.5 76.44 91.24 108.4 127.24 148.72 172.72 199.76 229.76 263.24 300.76 342.76]'; % #, millions of eggs per individual
data.LN(:,2) = 1e6 * data.LN(:,2); % #, convert to millions
units.LN = {'cm', '#'}; label.LN = {'shell length', 'fecundity'}; bibkey.LN = 'McGaSerc1992';
temp.LN = C2K(7); units.temp.LN = 'K'; label.temp.LN = 'temperature';

 % Dry weight vs. oxygen consumption rate
data.WJO = [4.26 4.44 4.53 4.74 4.87 4.88 4.93 4.97 5.18 5.2 5.48 5.6 6.88 7.1 7.8 8.48 8.91 9.02; % g, dry weight
            0.63 0.64 0.69 0.47 0.5 0.26 0.24 0.59 0.63 0.41 0.59 0.72 0.96 0.91 1.33 1.41 1.25 1.37]'; % mgO2/h, oxygen consumption rate
units.WJO = {'g', 'mg/h'}; label.WJO = {'dry weight', 'O_2 consumption rate', '6 C'}; bibkey.WJO = 'GranCran1991';
temp.WJO = C2K(6); units.temp.WJO = 'K'; label.temp.WJO = 'temperature';

 % Dry weight vs. oxygen consumption rate at different temperatures
data.WJO1 = [0.01 0.05 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; % g, dry weight
             0.0021 0.0071 0.0120 0.0407 0.0690 0.1169 0.1592 0.1982 0.2348 0.2698 0.3034 0.3358 0.3673 0.3980 0.4279 0.4572 0.4859 0.5141 0.5418 0.5691 0.5960 0.6225]'; % mLO2/h, oxygen consumption rate
units.WJO1 = {'g', 'mL/h'}; label.WJO1 = {'dry weight', 'O_2 consumption rate', '1 C'}; bibkey.WJO1 = 'ShumBart1988';
temp.WJO1 = C2K(1); units.temp.WJO1 = 'K'; label.temp.WJO1 = 'temperature';

data.WJO3 = [0.01 0.05 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; % g, dry weight
             0.0054 0.0177 0.0295 0.0970 0.1620 0.2706 0.3652 0.4519 0.5330 0.6100 0.6837 0.7547 0.8235 0.8903 0.9553 1.0188 1.0810 1.1420 1.2018 1.2606 1.3184 1.3754]'; % mLO2/h, oxygen consumption rate
units.WJO3 = {'g', 'mL/h'}; label.WJO3 = {'dry weight', 'O_2 consumption rate', '3 C'}; bibkey.WJO3 = 'ShumBart1988';
temp.WJO3 = C2K(3); units.temp.WJO3 = 'K'; label.temp.WJO3 = 'temperature';

data.WJO6 = [0.01 0.05 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; % g, dry weight
             0.0082 0.0259 0.0425 0.1341 0.2200 0.3609 0.4820 0.5920 0.6942 0.7907 0.8827 0.9710 1.0562 1.1387 1.2189 1.2971 1.3733 1.4480 1.5211 1.5928 1.6633 1.7326]'; % mLO2/h, oxygen consumption rate
units.WJO6 = {'g', 'mL/h'}; label.WJO6 = {'dry weight', 'O_2 consumption rate', '6 C'}; bibkey.WJO6 = 'ShumBart1988';
temp.WJO6 = C2K(6); units.temp.WJO6 = 'K'; label.temp.WJO6 = 'temperature';

data.WJO8 = [0.01 0.05 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; % g, dry weight
             0.0052 0.0204 0.0368 0.1439 0.2590 0.4662 0.6575 0.8392 1.0140 1.1835 1.3488 1.5105 1.6692 1.8252 1.9788 2.1303 2.2799 2.4278 2.5741 2.7189 2.8623 3.0045]'; % mLO2/h, oxygen consumption rate
units.WJO8 = {'g', 'mL/h'}; label.WJO8 = {'dry weight', 'O_2 consumption rate', '8 C'}; bibkey.WJO8 = 'ShumBart1988';
temp.WJO8 = C2K(8); units.temp.WJO8 = 'K'; label.temp.WJO8 = 'temperature';

data.WJO10 = [0.01 0.05 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; % g, dry weight
              0.0077 0.0295 0.0527 0.2031 0.3630 0.6489 0.9115 1.1599 1.3984 1.6293 1.8540 2.0735 2.2886 2.4998 2.7077 2.9125 3.1145 3.3141 3.5113 3.7065 3.8996 4.0910]'; % mLO2/h, oxygen consumption rate
units.WJO10 = {'g', 'mL/h'}; label.WJO10 = {'dry weight', 'O_2 consumption rate', '10 C'}; bibkey.WJO10 = 'ShumBart1988';
temp.WJO10 = C2K(10); units.temp.WJO10 = 'K'; label.temp.WJO10 = 'temperature';

data.WJO19 = [0.01 0.05 0.1 0.5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; % g, dry weight
              0.0085 0.0325 0.0581 0.2234 0.3990 0.7127 1.0007 1.2732 1.5347 1.7877 2.0339 2.2744 2.5100 2.7414 2.9691 3.1934 3.4146 3.6331 3.8491 4.0628 4.2742 4.4837]'; % mLO2/h, oxygen consumption rate
units.WJO19 = {'g', 'mL/h'}; label.WJO19 = {'dry weight', 'O_2 consumption rate', '19 C'}; bibkey.WJO19 = 'ShumBart1988';
temp.WJO19 = C2K(19); units.temp.WJO19 = 'K'; label.temp.WJO19 = 'temperature';

 % Temperature vs. oxygen consumption rate
data.TJO = [-0.5 0.1 1.6 2.5 4.0 8.1 12.2; % C, temperature
            0.0719 0.0676 0.0657 0.1159 0.1395 0.1720 0.1679]'; % mLO2/h, oxygen consumption rate
units.TJO = {'C', 'mL/h'}; label.TJO = {'temperature', 'O_2 consumption rate'}; bibkey.TJO = 'MacDThom1986';

%% Set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;
weights.tL2 = 5 * weights.tL2;
weights.tL3 = 5 * weights.tL3;
weights.ab = 0 * weights.ab;
weights.Wdb = 0 * weights.Wdb;
weights.Wdj = 0 * weights.Wdj;
weights.Wdp = 0 * weights.Wdp;
% weights.WJO = 40 * weights.WJO;

%% Set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;
%data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% Pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'10m North, 31m North'};
set2 = {'WJO19','WJO10','WJO8','WJO6','WJO3','WJO1'}; subtitle2 = {'19, 10, 8, 6, 3, 1 C'};
metaData.grp.sets    = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = '77NKN'; % Cat of Life
metaData.links.id_ITIS = '79718'; % ITIS
metaData.links.id_EoL = '46467879'; % Ency of Life
metaData.links.id_Wiki = 'Placopecten_magellanicus'; % Wikipedia
metaData.links.id_ADW = 'Placopecten_magellanicus'; % ADW
metaData.links.id_Taxo = '39370'; % Taxonomicon
metaData.links.id_WoRMS = '156972'; % WoRMS
metaData.links.id_molluscabase = '156972'; % molluscabase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = [...
'howpublished = {\url{http://animaldiversity.org/accounts/Placopecten_magellanicus/}},'...
'note = {Accessed : 2018-01-08}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Placopecten_magellanicus}},'...
'note = {Accessed : 2015-04-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Guess'; type = 'Misc'; bib = [...
'note = {Guestimation}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ClaeBure1994'; type = 'Article'; bib = [ ...
'author = {Claereboudt, M. R. and Bureau, D. and C\^{o}t\''{e}, J. and Himmelman, J. H.}, ' ...
'year = {1994}, ' ...
'title = {Fouling development and its effect on the growth of juvenile giant scallop \emph{Placopecten magellanicus} in suspended culture}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {121}, ' ...
'pages = {327-342}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cull1974'; type = 'Article'; bib = [ ...
'author = {Culliney, J. L.}, ' ...
'year = {1974}, ' ...
'title = {Larval development of the giant scallop \emph{Placopecten magellanicus}}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {147}, ' ...
'pages = {321-332}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GranCran1991'; type = 'Article'; bib = [ ...
'author = {Grant, J. and Cranford, P. J.}, ' ...
'year = {1991}, ' ...
'title = {Carbon and nitrogen scope for growth as a function of diet in the sea scallop \emph{Placopecten magellanicus}}, ' ...
'journal = {J. mar. biol. Ass. U.K}, ' ...
'volume = {71}, ' ...
'pages = {437-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LangRobi1987'; type = 'Article'; bib = [ ...
'author = {Langton, R. W. and Robinson, W. E. and Schick, D.}, ' ...
'year = {1987}, ' ...
'title = {Fecundity and reproductive effort of sea scallop \emph{Placopecten magellanicus} from the {G}ulf of {M}aine}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {37}, ' ...
'pages = {19-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDThom1985'; type = 'Article'; bib = [ ...
'author = {MacDonald, B. A. and Thompson, R. J.}, ' ...
'year = {1985}, ' ...
'title = {Influence of temperature and food availability on the ecological energetics of the giant scallop \emph{Placopecten magellanicus}. II. {R}eproductive output and total production}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {25}, ' ...
'pages = {295-303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDThom1986'; type = 'Article'; bib = [ ...
'author = {MacDonald, B. A. and Thompson, R. J.}, ' ...
'year = {1986}, ' ...
'title = {Influence of temperature and food availability on the ecological energetics of the giant scallop \emph{Placopecten magellanicus}. III. {P}hysiological ecology, the gametogenic cycle and scope for growth}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {93}, ' ...
'pages = {37-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDThom1988'; type = 'Article'; bib = [ ...
'author = {MacDonald, B. A. and Thompson, R. J.}, ' ...
'year = {1988}, ' ...
'title = {Intraspecific variation in growth and reproduction in latitudinally differentiated populations of the giant scallop \emph{Placopecten magellanicus} ({G}melin)}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {175}, ' ...
'pages = {361-371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McGaSerc1992'; type = 'Article'; bib = [ ...
'author = {McGarvey, R. and Serchuk, F. M. and McLaren, I. A.}, ' ...
'year = {1992}, ' ...
'title = {Statistics of reproduction and early life history survival of the {G}eorges {B}ank sea scallop \emph{Placopecten magellanicus} population}, ' ...
'journal = {J. Northwest Atl. Fish. Sci.}, ' ...
'volume = {13}, ' ...
'pages = {83-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Naid1970'; type = 'Article'; bib = [ ...
'author = {Naidu, K. S.}, ' ...
'year = {1970}, ' ...
'title = {Reproduction and breeding cycle of the giant scallop \emph{Placopecten magellanicus} ({B}ivalvia: {P}ectinidae) in {P}ort au {P}ort {B}ay, {N}ewfoundland}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {48}, ' ...
'pages = {1003-1012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParsRobi1992'; type = 'Article'; bib = [ ...
'author = {Parsons, G. J. and Robinson, S. M. C. and Chandler, R. A. and Davidson, L. A. and Lanteigne, M. and Dadswell, M. J.}, ' ...
'year = {1992}, ' ...
'title = {Intra-annual and long-term patterns in the reproductive cycle of giant scallops \emph{Placopecten magellanicus} ({B}ivalvia: {P}ectinidae) from {P}assamaquoddy {B}ay, {N}ew {B}runswick, {C}anada}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {80}, ' ...
'pages = {203-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoddLund1994'; type = 'Article'; bib = [ ...
'author = {Roddick, D. L. and Lundy, M. J. and Kenchington, E.}, ' ...
'year = {1992}, ' ...
'title = {Yield per recruit analysis and minimum meat weight recommendations for the {B}ay of {F}undy scallop fishery}, ' ...
'journal = {DFO Atlantic Fisheries report}, ' ...
'volume = {58}, ' ...
'pages = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShumBart1988'; type = 'Article'; bib = [ ...
'author = {Shumway, S. E. and Barter, J. and Stahlnecker, J.}, ' ...
'year = {1988}, ' ...
'title = {Seasonal changes in oxygen consumption of the giant scallop, \emph{Placopecten magellanicus} ({G}melin)}, ' ...
'journal = {J. Shellfish Reas.}, ' ...
'volume = {7}, ' ...
'number = {1}, ' ...
'pages = {77-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

