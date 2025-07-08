function [data, auxData, metaData, txtData, weights] = mydata_Prionace_glauca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Prionace_glauca'; 
metaData.species_en = 'Blue shark'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 07 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 11 * 30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'Wiki';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5.5 * 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';          bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 25;        units.Lb  = 'cm';  label.Lb  = 'fork length at birth'; bibkey.Lb  = 'BanoMano2016';
  comment.Lb = '25-50 cm';
data.Lp  = 220;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Wiki'; 
data.Lpm  = 182;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Wiki'; 
data.Li  = 380;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';
  comment.Li = 'fishbase gives 400 cm';
data.Lim  = 282;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'Wiki'; 
  
data.Ri  = 135/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-L data
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.132	83.549
2.132	114.009
3.100	143.382
4.068	172.214
5.112	187.517
6.063	206.058
7.107	221.361
8.090	242.614];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'TanaCail1990';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.898	78.102
1.913	104.232
2.928	139.027
3.929	174.361
4.972	185.874
5.935	182.755
6.937	230.003
11.950	277.793];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TanaCail1990';
comment.tL_m = 'Data for males';

% length weight data
data.LW = [ ... % fork length (ft), weight (lb)
9   303
8.5 253
8   209
7.5 171
7   138
6.5 109
6    85
5.5  65
5    48
4.5  35
4    24
3.5  16
3    10
2.5   5
2     3];
data.LW(:,1) = (data.LW(:,1) - 1.3908) * 30.48/ 0.8313; % convert FL to TL and ft to cm
data.LW(:,2) = data.LW(:,2) * 453.59237; % convert lb to g
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weigth'};  
bibkey.LW = 'KohlCase1996';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data at females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Viviparous, so foetal development';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Preferred temp 7-16 C';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4MF6P'; % Cat of Life
metaData.links.id_ITIS = '160424'; % ITIS
metaData.links.id_EoL = '46559816'; % Ency of Life
metaData.links.id_Wiki = 'Prionace_glauca'; % Wikipedia
metaData.links.id_ADW = 'Prionace_glauca'; % ADW
metaData.links.id_Taxo = '41997'; % Taxonomicon
metaData.links.id_WoRMS = '105801'; % WoRMS
metaData.links.id_fishbase = 'Prionace-glauca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionace_glauca}}';
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
%
bibkey = 'TanaCail1990'; type = 'Incollection'; bib = [ ... 
'author = {Tanaka, S. and Cailliet, G. M. and Yudin, K. G.}, ' ... 
'year = {1990}, ' ...
'title = {Differences in growth of the blue shark, \emph{Prionace glauca}: technique or population?}, ' ...
'booktitle = {Elasmobranchs as living resources: advances in the biology, ecology, systematics, and the status of the fisheries}, ' ...
'editor = {Pratt, H.L. and Gruber, S. H. and Taniuchi, T.}, ' ...
'publisher = {Washington, DC: United States Department of Commerce}, ' ...
'series = {NOAA Technical Report NMFS}, ' ...
'volume = {90}, ' ...
'pages = {167-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Prionace-glauca.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KohlCase1996'; type = 'Techreport'; bib = [ ... 
'author = {N. E. Kohler and J. G. Casey and P. A. Turner}, ' ... 
'year = {1996}, ' ...
'title = {Length-Length and Length-Weight Relationships for 13 Shark Species from the {W}estern {N}orth {A}tlantic}, ' ...
'institution = {National Oceanic and Atmospheric Administration}, ' ...
'number = {NOAA Technical Memorandum NMFS-NE-110}, ' ...
'pages = {167-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BanoMano2016'; type = 'Article'; bib = [ ... 
'author = {R. Banon and T. Mano and G. Mucientes}, ' ... 
'year = {2016}, ' ...
'title = {Observations of newborn blue sharks \emph{Prionace glauca} in shallow inshore waters of the north-east {A}tlantic {O}cean}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'booktitle = {Elasmobranchs as living resources: advances in the biology, ecology, systematics, and the status of the fisheries.}, ' ...
'editor = {Pratt, H.L. and Gruber, S. H. and Taniuchi, T.}, ' ...
'volume = {89}, ' ...
'pages = {2167-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

