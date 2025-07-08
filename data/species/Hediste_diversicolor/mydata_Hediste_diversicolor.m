function [data, auxData, metaData, txtData, weights] = mydata_Hediste_diversicolor 
  
% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Polychaeta'; 
metaData.order      = 'Phyllodocida'; 
metaData.family     = 'Nereidae';
metaData.species    = 'Hediste_diversicolor'; 
metaData.species_en = 'Ragworm'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Ww0'; 'Wwp'; 'Wwi'; 'Wdi'; 'pX_m'}; 
metaData.data_1     = {'t-L'; 'L-W';'L_Ri';'Wd-JO';'pX_m-r';'L-W';'TC-T'}; 


metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Sebastien Lefebvre'}; 
metaData.date_subm = [2019 09 27]; 
metaData.email    = {'sebastien.lefebvre@univ-lille.fr'}; 
metaData.address  = {'UMR LOG/univ-Lille, 62930, France'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 09 28]; 

% set data
data.ab_18 = 152/24;      units.ab_18 = 'd';    label.ab_18 = 'age at birth';  bibkey.ab_18 = 'MartBren1997';   
  temp.ab_18 = C2K(18);  units.temp.ab_18 = 'K'; label.temp.ab_18 = 'temperature';
  comment.ab_18  = 'Salinity was 35 psu'; 
data.aj_8 = 10*7;      units.aj_8 = 'd';    label.aj_8 = 'age at metamorphosis';  bibkey.aj_8 = 'Dale1950';   
  temp.aj_8 = C2K(8.5);  units.temp.aj_8 = 'K'; label.temp.aj_8 = 'temperature';
  comment.aj_8  = 'Mean in situ temperature, salinity unknown'; 
data.aj_18 = 28+152/24;      units.aj_18 = 'd';    label.aj_18 = 'age at metamorphosis';  bibkey.aj_18 = 'MartBren1997';   comment.aj_18  = 'salinity 35'; 
  temp.aj_18 = C2K(18);  units.temp.aj_18 = 'K'; label.temp.aj_18 = 'temperature';
data.ap_16 = 67;      units.ap_16 = 'd';    label.ap_16 = 'age at puberty';  bibkey.ap_16 = 'NestSimo2012';   
  temp.ap_16 = C2K(16.3);  units.temp.ap_16 = 'K'; label.temp.ap_16 = 'temperature';
  comment.ap_16  = 'salinity 19, 67 guessed, T 60d at 16 and 7 d at 19 C';
data.am = 112;     units.am = 'd';    label.am = 'age at first repro=death';     bibkey.am = 'NestSimo2012';   
  temp.am = C2K(17.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am  = 'salinity 19, 112 guessed, T 60d at 16 and 52d at 19 C';

data.Lj  = 0.36; units.Lj  = 'cm';   label.Lj  = 'length at metamorphosis';    bibkey.Lj  = 'Dale1950'; comment.Lj  = 'From the number of setigers n=19';  
data.Li = 14.7;  units.Li  = 'cm';   label.Li  = 'max length at first reproduction';    bibkey.Li  = 'NestSimo2018'; comment.Li  = 'the biggest of the figure X';  
data.L3i = 0.47; units.L3i  = 'cm';  label.L3i  = 'max L3 length at first reproduction';    bibkey.L3i  = 'NestSimo2018'; comment.L3i  = 'the biggest of the figure X';  

data.Ww0 = 4.2e-6;  units.Ww0  = 'g';   label.Ww0  = 'initial wet weight';    bibkey.Ww0  = 'DuroMoun2008'; 
  comment.Ww0  = 'based on egg diameter of 190-225 mum Scaps 200-270 mum: pi/6*0.02^3'; 
data.Wwp = 0.08;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'NestSimo2012';
data.Ww60 = 0.030; units.Ww60 = 'g';    label.Ww60 = 'wet weight at age 60 d'; bibkey.Ww60 = 'NestSimo2012';
  temp.Ww60 = C2K(16);  units.temp.Ww60 = 'K'; label.temp.Ww60 = 'temperature'; 
data.Wwi = 1.57; units.Wwi = 'g';    label.Wwi = 'wet weight at death'; bibkey.Wwi = 'NestSimo2018';
data.Wdi = 0.27; units.Wdi = 'g';    label.Wdi = 'wet weight at death'; bibkey.Wdi = 'NestSimo2018';

%p_Xm
data.p_Xm = 132; units.p_Xm = 'J/d';    label.p_Xm = 'Maximum ingestion rate'; bibkey.p_Xm = 'NielErik1995';
temp.p_Xm = C2K(15);  units.temp.p_Xm = 'K'; label.temp.p_Xm = 'temperature'; 
auxData.Wd.p_Xm = 0.11; units.Wd.p_Xm = 'g'; label.Wd.p_Xm = 'Dry weight';  

%-----------------
% uni-variate data
%-----------------

%tL Nesto 
data.tL =[2 190e-4;3 220e-4; 4 425e-4;14 700e-4];%age d and Length cm 
units.tL   = {'d', 'cm'};  label.tL = {'age', 'Physical length'};  bibkey.tL = 'NestSimo2018';
temp.tL    = C2K(16) ;  units.temp.tL = 'C'; label.temp.tL = 'temperature';
comment.tL = 'Salinity was 16 PSU,  food conditions unknown but reasonably high'; 

%tL Marty
Marty=[14 6.1; 21 10.7; 28 18.3;35	25.4;42	32.3;49	36.6;56	40.2;63	45.8]; %time since birth vs number of setigers
d = [Marty(Marty(:,2)<20,2).*0.1865-0.2353 ; Marty(Marty(:,2)>20,2).*1.1948-20];%transform Number of setigers in TL mm, two different "shapes" whether above or below 20 i.e 'j'
data.tL2 = [Marty(:,1) d./10]; % d, age  % g, Physical length at f and T
units.tL2   = {'d', 'cm'};  label.tL2 = {'age', 'Physical length'};  bibkey.tL2 = 'MartBren1997';
temp.tL2    = C2K(18);  units.temp.tL2 = 'C'; label.temp.tL2 = 'temperature';
comment.tL2 = 'fed ad libitum with tetramin salinity was 35 PSU, total length proxied using Dales 1950, Galasso 2018 and Nesto 2018 from setigers';

% L3 vs Ri Gaudron in situ
data.L3_Ri=[1.83 12467;2.3 15767;2.76 30133;1.38 3217;1.19 1567];% L3 length mm Ri
data.L3_Ri(:,1)=data.L3_Ri(:,1)./10;% mm to cm
data.L3_Ri=sortrows(data.L3_Ri,1);
units.L3_Ri  ={'cm','#'};  label.L3_Ri  = {'L3 length','maximum number of egg emitted at first repro i.e. death'}; bibkey.L3_Ri  = 'Gaud2017';  comment.L3_Ri  = 'In situ temperature from SOMLIT data, mean of fortnightly 2012-2015 sampling ';
temp.L3_Ri = C2K(12.06);  units.temp.L3_Ri = 'K'; label.temp.L3_Ri = 'temperature';

% tWw Nesto
Nesto=[0 14 28 42 56;
       0.025 0.145 0.351 0.618 0.917;
       0.025 0.125 0.204 0.295 0.654;
       0.025 0.062 0.124 0.138 0.222;
       0.025 0.1452 0.3536 0.7452 0.9994]';
t0=60; % age at t0 is 60 days
       
data.tWw1 = [Nesto(:,1)+t0 Nesto(:,2)]; % d, age  % g, Wet weight at f and T    
units.tWw1   = {'d', 'g'};  label.tWw1 = {'age', 'Wet weight'};  bibkey.tWw1 = 'NestSimo2012';
temp.tWw1    = C2K(19) ;  units.temp.tWw1 = 'C'; label.temp.tWw1 = 'temperature';
comment.tWw1 = 'Salinity was 16 PSU, from birth to t60 Temp was 16 C and fed ad libitum with Larviva-Biomar high protein content (66per cent protein, 14per cent fat) then from t60 T was 19 C '; 

data.tWw2 = [Nesto(:,1)+t0 Nesto(:,3)]; % d, age % g, Wet weight at f and T    
units.tWw2   = {'d', 'g'};  label.tWw2 = {'age', 'Wet weight'};  bibkey.tWw2 = 'NestSimo2012';
temp.tWw2    = C2K(19);  units.temp.tWw2 = 'C'; label.temp.tWw2 = 'temperature';
comment.tWw2 = 'Salinity was 16 PSU, from birth to t60 Temp was 16 C and fed ad libitum with Larviva-Biomar then from t60 T was 19 C fed ad libitum with classic C22 Hendrix moderate protein content (28per cent protein, 7per cent fat)';

data.tWw3 = [Nesto(:,1)+t0 Nesto(:,4)];% d, age  % g, Wet weight at f and T    
units.tWw3   = {'d', 'g'};  label.tWw3 = {'age', 'Wet weight'};  bibkey.tWw3 = 'NestSimo2012';
temp.tWw3    = C2K(19);  units.temp.tWw3 = 'C'; label.temp.tWw3 = 'temperature';
comment.tWw3 = 'Salinity was 16 PSU, from birth to t60 Temp was 16 C and fed ad libitum with Larviva-Biomar then from t60 T was 19 C fed ad libitum with Sargassum low protein content (9.5per cent protein, 0.52per cent fat)'; 

data.tWw4 = [Nesto(:,1) + t0 Nesto(:,5)];% d, age % g, Wet weight at f and T    
units.tWw4   = {'d', 'g'};  label.tWw4 = {'age', 'Wet weight'};  bibkey.tWw4 = 'NestSimo2012';
temp.tWw4    = C2K(19);  units.temp.tWw4 = 'C'; label.temp.tWw4 = 'temperature';
comment.tWw4 = 'Salinity was 16 PSU, from birth to t60 Temp was 16 C and fed ad libitum with Larviva-Biomar then from t60 T was 19 C and 300 ind/ml'; 

%Nielsen
Nielsen=[0.0626 34.1; 0.0534 34.8; 0.0555 36.8; 0.0519 42.8; 0.0635 57.6; 0.0661 65.4; 0.0584 71.4];%Wd (g)	mul02.h-1
data.Wd_JO_T15=[Nielsen(:,1) Nielsen(:,2)./1000.*44.66.*24.*1e-6];% Wd en g, JO (mol/d) from mulO2.h-1
data.Wd_JO_T15=sortrows(data.Wd_JO_T15,1);
temp.Wd_JO_T15=C2K(15);units.Wd_JO_T15 = {'g', 'mol O2/d'};  label.Wd_JO_T15 = {'Dry weight', 'O2 consumption'}; 
units.temp.Wd_JO_T15 = 'C'; label.temp.Wd_JO_T15= {'Temperature'};bibkey.Wd_JO_T15 = 'NielErik1995';% Table 3
comment.Wd_JO_T15='Measurement 30 min after feeding, salinity was 15PSU';

% Shumway
Shumway=[ 0.08	0.05; 0.081	0.06; 0.09	0.05; 0.10	0.08; 0.12	0.07; 0.15	0.07; 0.20	0.11; 0.16	0.12; 0.22	0.14; 0.29  0.12];%Wd (g) mlO2.h-1
data.Wd_JO_T10=[Shumway(:,1) Shumway(:,2).*44.66.*24.*1e-6];% Wd en g, JO (mol/d) from mlO2.h-1
data.Wd_JO_T10=sortrows(data.Wd_JO_T10,1);
temp.Wd_JO_T10=C2K(10);units.Wd_JO_T10 = {'g', 'mol O2/d'};  label.Wd_JO_T10 = {'Dry weight', 'O2 consumption'}; 
units.temp.Wd_JO_T10 = 'C'; label.temp.Wd_JO_T10= {'Temperature'};bibkey.Wd_JO_T10 = 'Shum1979';
comment.Wd_JO_T10='Measurement and feeding conditions not specified, salinity not specified but probably 35';

% Kristensen
Kristensen= [4.73   110.27; 10.98	220.59; 15.31	308.18; 19.48	452.41; 29.51	580.69];%Temperature	gWw mug02 g-1.h-1
data.TC_T=[Kristensen(:,1) Kristensen(:,2)./452.41]; %Temperature and TC 
units.TC_T = {'C', '-'};  label.TC_T = {'Temperature', 'Temperature correction'}; bibkey.TC_T = 'Kris1983';
comment.TC_T='Weight measurement unclear, data only used for Temperature correction';


% %Nielsen_J_vs_r
Nielsen_J_vs_r = [ 2.8 0.7;8.7 2.4; 10.4 2.9; 15.8 3.6; 21.3 4.3; 37.6 6.3; 40.4 6.7; 42 7.0];% (mg wet weight shrimp/d/ind) spec growth rate r %/d)
data.p_Xm_r_T15=[Nielsen_J_vs_r(:,1).*3.3 Nielsen_J_vs_r(:,2)./100];% %p_Xm (J/d/ind) spec growth rate r (/d) assuming 1mg wet weight shrimp=3.3 J
data.p_Xm_r_T15=sortrows(data.p_Xm_r_T15,1);
temp.p_Xm_r_T15=C2K(15);units.p_Xm_r_T15 = {'J/d', '1/d'};  label.p_Xm_r_T15 = {'Ingestion rate', 'spec growth rate'}; 
units.temp.p_Xm_r_T15 = 'C'; label.temp.p_Xm_r_T15= {'Temperature'};bibkey.p_Xm_r_T15 = 'NielErik1995';
comment.p_Xm_r_T15='salinity was 15PSU, Wd =auxData.Wd.p_Xm=0.06g;';
auxData.Wd.p_Xm_r_T15=0.06; units.Wd.p_Xm_r_T15 = {'g'}; label.Wd.p_Xm_r_T15 = 'Dry weight';  

% Shapes 
%L3 vs Ww
data.Ww_L3w = [0.191918358,0.1281121245;0.214691987,0.123373451;0.2366928684,0.1667424592;0.2615338744,0.2593852668;0.285627191875,0.34585835;0.3105988,0.487435131;0.33277477,0.532947857;0.3622356462,0.9401526948;0.395310324,1.08542207225];
data.Ww_L3w = sortrows(data.Ww_L3w,1);
units.Ww_L3w = {'cm', 'g'};  label.Ww_L3w = {'Physical length L3', 'Wet Weight'}; bibkey.Ww_L3w = 'NestSimo2018';
%TL vs Ww
data.Ww_Lw =[2.285714285,0.0157894737;3.48739495625,0.0765789472875;4.694677871,0.1599999;5.862184874,0.2371578947;7.48139255,0.41233082;8.5975723,0.5414035;10.48739,0.77368421;11.29411764,0.956210525;12.8627451,1.12421052;14.65546,1.55684211];
data.Ww_Lw = sortrows(data.Ww_Lw,1);
units.Ww_Lw = {'cm', 'g'};  label.Ww_Lw = {'Physical length TL', 'Wet Weight'}; bibkey.Ww_Lw = 'NestSimo2018';


 %% set weights for all real data
weights = setweights(data, []);
weights.Lj    = 0 * weights.Lj;             % salinity unknown
weights.aj_8 = 0 * weights.aj_8;            % salinity unknown
weights.aj_18 = 0 * weights.aj_18;          % salinity unknown
weights.Ww_Lw([9 10]) = 0;                  % Possibly missing terminal parts
weights.p_Xm_r_T15= 0 * weights.p_Xm_r_T15; % Experimental conditions not clear
weights.Wd_JO_T10 = 0 * weights.Wd_JO_T10;  % Experimental conditions not clear

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw1','tWw2','tWw3','tWw4'}; subtitle1 = {'NestSimo2012'};
set2 = {'Wd_JO_T15','Wd_JO_T10'}; subtitle2 = {'Niel1995 + Shum1979'};
set3 = {'tL','tL2'}; subtitle3 = {'Nesto2018 + Marty'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1;subtitle2;subtitle3};

%% Discussion points
D1 = 'True Li unknown since H. diversicolor is a semelparous species (death at first reproduction) ';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The larval stage lasts 202 days and no feeding occurs';
metaData.bibkey.F1 = 'Wiki'; % optional bibkey
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3JZBG'; % Cat of Life
metaData.links.id_ITIS = '65991'; % ITIS
metaData.links.id_EoL = '406336'; % Ency of Life
metaData.links.id_Wiki = 'Hediste_diversicolor'; % Wikipedia
metaData.links.id_ADW = 'Hediste_diversicolor'; % ADW
metaData.links.id_Taxo = '15136'; % Taxonomicon
metaData.links.id_WoRMS = '152302'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hediste_diversicolor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Dale1950'; type = 'Article'; bib = [...
'author = {Dales, R. P.},'...
'year = {1950},'...
'title = {The reproduction and larval development of \emph{Nereis diversicolor} {O}.{F}. {M}uller},'...
'journal = {Journal of the Marine Biological Association of the United Kingdom},'...
'volume = {29},'...
'number = {2},'...
'pages = {321-360},'...
'DOI = {10.1017/s0025315400055405},'...
'url = {<Go to ISI>://WOS:A1950XR28200005}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'DuroMoun2008'; type = 'Article'; bib = [...
'author = {Durou, C. and Mouneyrac, C. and Amiard-Triquet, C.},'...
'year = {2008},'...
'title = {Environmental quality assessment in estuarine ecosystems: {U}se of biometric measurements and fecundity of the ragworm \emph{Nereis diversicolor} ({P}olychaeta, {N}ereididae)},'...
'journal = {Water Research},'...
'volume = {42},'...
'number = {8-9},'...
'pages = {2157-2165},'...
'DOI = {10.1016/j.watres.2007.11.028},'...
'url = {<Go to ISI>://WOS:000255825500032}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Gaud2017'; type = 'Misc'; bib = [...
'author = {Gaudron, S.},'...
'year = {2017},'...
'title = {Personal communication},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Kris1983'; type = 'Article'; bib = [...
'author = {Kristensen, E.},'...
'year = {1983},'...
'title = {Ventilation and oxygen uptake by 3 species of {N}ereis ({A}nnelida, {P}olychaeta) .2. {E}ffects of temperature and salinity changes},'...
'journal = {Marine Ecology Progress Series},'...
'volume = {12},'...
'number = {3},'...
'pages = {299-305},'...
'DOI = {10.3354/meps012299},'...
'url = {<Go to ISI>://WOS:A1983QW73700009}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'MartBren1997'; type = 'Article'; bib = [...
'author = {Marty, R. and Brenot, S. and Retiere, C. and Desrosiers, G.},'...
'year = {1997},'...
'title = {First case of adelphophagia studied in {N}ereidae ({A}nnelida, {P}olycheta): {E}cological significance of this behavior developed by \emph{Nereis diversicolor} ({O}.{F}. {M}uller)},'...
'journal = {Canadian Journal of Zoology-Revue Canadienne De Zoologie},'...
'volume = {75},'...
'number = {10},'...
'pages = {1575-1584},'...
'DOI = {10.1139/z97-784},'...
'url = {<Go to ISI>://WOS:A1997YE06500003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'NestSimo2012'; type = 'Article'; bib = [...
'author = {Nesto, N. and Simonini, R. and Prevedelli, D. and Da Ros, L.},'...
'year = {2012},'...
'title = {Effects of diet and density on growth, survival and gametogenesis of \emph{Hediste diversicolor} ({O}.{F}. {M}uller, 1776) ({N}ereididae, {P}olychaeta)},'...
'journal = {Aquaculture},'...
'volume = {362},'...
'pages = {1-9},'...
'DOI = {10.1016/j.aquaculture.2012.07.025},'...
'url = {<Go to ISI>://WOS:000309605000001}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'NestSimo2018'; type = 'Article'; bib = [...
'author = {Nesto, N. and Simonini, R. and Prevedelli, D. and Da Ros, L.},'...
'year = {2018},'...
'title = {Evaluation of different procedures for fertilization and larvae production in \emph{Hediste diversicolor} ({O}.{F}. {M}uller, 1776) ({N}ereididae, {P}olychaeta)},'...
'journal = {Aquaculture Research},'...
'volume = {49},'...
'number = {4},'...
'pages = {1396-1406},'...
'DOI = {10.1111/are.13589}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'NielErik1995'; type = 'Article'; bib = [...
'author = {Nielsen, A. M. and Eriksen, N. T. and Iversen, J. J. L. and Riisgard, H. U.},'...
'year = {1995},'...
'title = {Feeding, growth and respiration in the polychaetes \emph{Nereis diversicolor} (Facultative filter-feeder) and \emph{N. virens} (Omnivorous) - a comparative study},'...
'journal = {Marine Ecology Progress Series},'...
'volume = {125},'...
'number = {1-3},'...
'pages = {149-158},'...
'DOI = {10.3354/meps125149},'...
'url = {<Go to ISI>://WOS:A1995TB12400015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Shum1979'; type = 'Article'; bib = [...
'author = {Shumway, S. E.},'...
'year = {1979},'...
'title = {Effects of body size, oxygen tension and mode of life on the oxygen uptake rates of polychaetes},'...
'journal = {Comparative Biochemistry and Physiology a-Molecular & Integrative Physiology},'...
'volume = {64},'...
'number = {2},'...
'pages = {273-278},'...
'DOI = {10.1016/0300-9629(79)90660-1},'...
'url = {<Go to ISI>://WOS:A1979HM59800011}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%------------------------------------------------------------------------------------------------------







