function [data, auxData, metaData, txtData, weights] = mydata_Squalius_cephalus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Squalius_cephalus'; 
metaData.species_en = 'European Chub'; 

metaData.ecoCode.climate = {'Csa','Dfa'};        
metaData.ecoCode.ecozone = {'THp'};        
metaData.ecoCode.habitat = {'0iFc', '0iFl'};      
metaData.ecoCode.embryo  = {'Fg'};        
metaData.ecoCode.migrate = {};      
metaData.ecoCode.food    = {'bjCi','piO'};       
metaData.ecoCode.gender  = {'D'};       
metaData.ecoCode.reprod  = {'O'};       

metaData.T_typical  = C2K(19); % K, body temp, KuprMamc2011 --> 19 C optimal temperature       
metaData.data_0     = {'ah_T'; 'ab_T'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwb'; 'Wwi';'Ri'};         
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'L-N'; 'Ww-N'};         

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011        

metaData.author   = {'Yvonne Wolf'};        
metaData.date_subm = [2021 05 18];                                
metaData.email    = {'yvonne.wolf@bayer.com'};                 
metaData.address  = {'Bayer AG, Alfred-Nobel-Str. 50, 40789 Monheim, Germany'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.ah_19 = 4.5;  units.ah_19 = 'd'; label.ah_19 = 'age at hatching'; bibkey.ah_19 = 'KuprMamc2011';   
  temp.ah_19 = C2K(19); units.temp.ah_19 = 'K'; label.temp.ah_19 = 'temperature';
  comment.ah_19 = '0.5 of assessed individuals has hatched during that timepoint';
data.ah_27 = 1.5;  units.ah_27 = 'd'; label.ah_27 = 'age at hatching at 27.5 degrees'; bibkey.ah_27 = 'KuprMamc2011';   
  temp.ah_27 = C2K(27.5); units.temp.ah_27 = 'K'; label.temp.ah_27 = 'temperature';
  comment.ah_27 = '0.5 of assessed individuals has hatched during that timepoint';
data.ab_19 = 10.5; units.ab_19 = 'd'; label.ab_19 = 'age at birth'; bibkey.ab_19 = 'KuprMamc2011';   
  temp.ab_19 = C2K(19); units.temp.ab_19 = 'K'; label.temp.ab_19 = 'temperature';
    comment.ab_19 = 'start of feeding';
data.ab_27 = 5; units.ab_27 = 'd'; label.ab_27 = 'age at birth'; bibkey.ab_27 = 'KuprMamc2011';   
  temp.ab_27 = C2K(27.5); units.temp.ab_27 = 'K'; label.temp.ab_27 = 'temperature';
  comment.ab_27 = 'start of feeding'; 
data.tp = 2.5*365; units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Sasi2004';
  temp.tp = C2K((7.42+28.9)/2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'maturity was reached between age class 2 and 3, in age class 4 all sampled fish were mature; temperature ranged between 7.42 and 28.9 C during study duration';
data.am = 17.7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fischlexikon';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temperature assumed from KuprMamc2011 as optimal temperature';
  
data.Lh =0.59;      units.Lh ='cm';     label.Lh = 'total length at hatch'; bibkey.Lh = 'KuprMamc2011';
data.Lb = 0.785;    units.Lb = 'cm';   label.Lb = 'total length at birth'; bibkey.Lb = 'KuprMamc2011';
  comment.Lb = 'start of feeding at 19 C';
data.Lp = 19.18;      units.Lp = 'cm';   label.Lp = 'forked length at puberty female'; bibkey.Lp = 'KiliBece2016';
data.Lpm = 15.32;     units.Lpm = 'cm';   label.Lpm = 'forked length at puberty male'; bibkey.Lpm = 'KiliBece2016';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fischlexikon';

data.Ww0 = 5.24e-4;      units.Ww0 = 'g';      label.Ww0 = 'initial wet weigh';    bibkey.Ww0 = 'fishbase';
  comment.Ww0 = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwh = 0.1238;      units.Wwh = 'g';      label.Wwh = 'wet weight at hatch';    bibkey.Wwh = 'Calt2000';
data.Wwb = 0.151;      units.Wwb = 'g';      label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Calt2000';
  comment.Wwb = 'assumed based on KuprMamc2011 ratio of hatch and birth timepoint';
data.Wwi = 5000;      units.Wwi = 'g';      label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fischlexikon'; 

data.Ri = 15e4/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fischlexikon';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temperature assumed from KuprMamc2011 as optimal temperature';

% uni-variate data

% time - length
data.tL_f = [ ... % time (year), fork length (cm)
1   12.6;
2   14.5;
3   15.4;
4   17.4;
5   21.1; 
6   24.4]; 
data.tL_f(:,1) = data.tL_f(:,1)*365  ; % convert years to days
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'}; 
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KocErdo2007';
comment.tL_f = 'data for female; Temperature based on mean of study; 16-18 C';
%
data.tL_m = [ ... % time (year), fork length (cm)
1   12.9;
2   14.3;
3   15.3;
4   16.9;
5   19.6; 
6   23.6]; 
data.tL_m(:,1) = data.tL_m(:,1)*365  ; %convert years to days
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'}; 
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KocErdo2007'; 
comment.tL_m = 'data for male; Temperature based on mean of study; 16-18 C';
%
% data.tL1 = [... % days after hatch and total length 
% 0 6.7; 1 7.3; 2 7.7; 3 8.1; 4 8.2; 5 8.3; 6 9.2; 7 9.4; 8 10; 
% 9 10.8; 10 11.6; 12 13.1; 13 14.3; 14 14.9; 15 16; 17 17;
% 18 17.7; 19 18.3; 20 19.8; 21 20.6; 22 20.9; 23 21.9; 24 22.9; 
% 25 24.3; 26 25.2; 27 25.4; 28 26; 29 27.6; 30 28];
% data.tL1(:,2) = data.tL1(:,2)/10; %transform mm to cm
% units.tL1 = {'d','cm'}; label.tL1 = {'days after hatch', 'total length'}; 
% temp.tL1 = C2K(15.8);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
% bibkey.tL1 = {'KuprNowo2014'};
%
% data.tL2 = [ ... % time (days after hatch), total length (mm)
% 0 6.51;
% 2 7.22;
% 4 7.92;
% 6 8.52;
% 8 8.8;
% 10 9.1;
% 12 9.3]; 
% data.tL2(:,2) = data.tL2(:,2)/10  ; %convert mm to cm
% units.tL2 = {'d', 'cm'};  label.tL2 = {'days after hatch', 'total length'}; 
% temp.tL2 = C2K(17);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
% bibkey.tL2 = {'Calt2000'};
%
data.tL3 = [ ... % time (age), fork length (cm)
2   14.74;
3   16.51;
4   19.69;
5   22.64;
6   24.4;
7   26.1];
data.tL3(:,1) = data.tL3(:,1)*365 ; %convert years to days
units.tL3 = {'d', 'cm'};  label.tL3 = {'time since birth', 'fork length', 'mix'}; 
temp.tL3 = C2K((7.42+28.9)/2);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Sasi2004';
comment.tL3 = 'temperature ranged between 7.42 and 28.9 C during study duration';

% time - wet weight
data.tWw_f = [ ... % time (year), wet weight (g)
1 33.8;
2 45.1;
3 58.9;
4 77.7;
5 128.9; 
6 145.9]; 
data.tWw_f(:,1) = data.tWw_f(:,1)*365; % convert years to days
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'}; 
temp.tWw_f = C2K(17);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'KocErdo2007';
comment.tWw_f = 'data for female; Temperature based on mean of study; 16-18 C';
%
data.tWw_m = [ ... % time (year), wet weight (g)
1 34.8;
2 45.9;
3 56.8;
4 75.6;
5 97; 
6 137.8]; 
data.tWw_m(:,1) = data.tWw_m(:,1)*365  ; %convert years to days
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'}; 
temp.tWw_m = C2K(17);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'KocErdo2007';
comment.tWw_m = 'data for male; Temperature based on mean of study; 16-18 C';
%
% data.tWw1 = [ ... % time (days after hatch), wet weight (mg)
% 0   123.8;
% 2   128.4;
% 4   151;
% 6   162.6;
% 8   173.8;
% 10  185.2;
% 12  187]; 
% data.tWw1(:,2) = data.tWw1(:,2)/1000; % convert mg to g
% units.tWw1 = {'d', 'g'};  label.tWw1 = {'days after hatch', 'wet weight'}; 
% temp.tWw1 = C2K(17);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
% bibkey.tWw1 = {'Calt2000'};
%
data.tWw2 = [ ... % time (age), wet weight (g)
2 46.45;
3 68.65;
4 122.64;
5 192.08;
6 241.93;
7 326.4];
data.tWw2(:,1) = data.tWw2(:,1)*365 ; %convert years to days
units.tWw2 = {'d', 'g'};  label.tWw2 = {'time since birth', 'wet weight', 'male'}; 
temp.tWw2 = C2K((7.42+28.9)/2);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature';
bibkey.tWw2 = 'Sasi2004';
comment.tWw2 = 'temperature ranged between 7.42 and 28.9 C during study duration';

% time - dry weight
% data.tWd = [ ... % time (days after hatch),  dry weight (mg)
% 0 33.6;
% 2 31.9;
% 4 30.8;
% 6 30.2;
% 8 30.0;
% 10 30.0;
% 12 30.2]; 
% data.tWd(:,2) = data.tWd(:,2)/1000  ; %convert mg to g
% units.tWd = {'d', 'g'};  label.tWd = {'days after hatch', 'dry weight'}; 
% temp.tWd = C2K(17);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
% bibkey.tWd = {'Calt2000'};

% length - wet weight
data.LWw_f = [ ... %  fork length (cm), wet weight (g)
12.6 33.8;
14.5 45.1;
15.4 58.9;
17.4 77.7;
21.1 128.9; 
24.4 145.9]; 
units.LWw_f = {'cm', 'g'};  label.LWw_f = {'fork length', 'wet weight', 'female'}; 
bibkey.LWw_f = 'KocErdo2007';
comment.LWw_f = 'data for female; Temperature based on mean of study; 16-18 C';
%
% data.LWw = [ ... % total length (mm), wet weight (mg)
% 6.51   123.8;
% 7.22   128.4;
% 7.92   151;
% 8.52   162.6;
% 8.8   173.8;
% 9.1  185.2;
% 9.3  187]; 
% data.LWw(:,1) = data.LWw(:,1)/10  ; %convert mm to cm
% data.LWw(:,2) = data.LWw(:,2)/1000  ; %convert mg to g
% units.LWw = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'}; 
% bibkey.LWw = {'Calt2000'};
%
data.LWw1 = [ ... % fork length (cm), wet weight (g)
14.74 46.45;
16.51 68.65;
19.69 122.64;
22.64 192.08;
24.4 241.93;
26.1 326.4];
units.LWw1 = {'cm', 'g'};  label.LWw1 = {'fork length', 'wet weight', 'mix'}; 
bibkey.LWw1 = 'Sasi2004';

% time - fecundity
% data.tN = [ ... % time (age), fecundity (#)
% 2 9142;
% 3 10959;
% 4 27197;
% 5 41333;
% 6 23850;
% 7 53100];
% data.tN(:,1) = data.tN(:,1)*356; % convert years to days
% units.tN = {'d', '#'};  label.tN = {'days', 'fecundity'}; 
% temp.tN = C2K((7.42+28.9)/2);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
% bibkey.tN = {'Sasi2004'};
% comment.tN = {'temperature ranged between 7.42 and 28.9 C during study duration'};

% length - fecundity
data.LN = [ ... % fork length (cm),  fecundity (#)
14.74 9142;
16.51 10959;
19.69 27197;
22.64 41333;
24.4 23850;
26.1 53100];
units.LN = {'cm', '#'};  label.LN = {'fork length', 'fecundity'}; 
temp.LN = C2K((7.42+28.9)/2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Sasi2004';
comment.LN = 'temperature ranged between 7.42 and 28.9 C during study duration';

% wet weight - fecundity
data.WN = [ ... % wet weight (g),  fecundity (#)
46.45 9142;
68.65 10959;
122.64 27197;
192.08 41333;
241.93 23850;
326.4 53100];
units.WN = {'g', '#'};  label.WN = {'wet weight', 'fecundity'}; 
temp.WN = C2K((7.42+28.9)/2);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Sasi2004';
comment.WN = 'temperature ranged between 7.42 and 28.9 C during study duration';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwh = 0 * weights.Wwh;
weights.Wwb = 0 * weights.Wwb;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL3','tL_m'}; subtitle1 = {'Data for females, mixed, males'};
set2 = {'tWw_f', 'tWw2', 'tWw_m'}; subtitle2 = {'Data for females, mixed, males'};
set3 = {'LWw_f', 'LWw1'}; subtitle3 = {'Data for females, mixed'};
metaData.grp.sets = {set1, set2, set3};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D2 = 'Weights at hatch and birth were ignored due to inconsistency with egg size';
D3 = 'Ultimate reproduction was ignored due to inconsistency LN and WwN data; the value for Ri probably concerns a smaller fish';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6ZDRX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46581678'; % Ency of Life
metaData.links.id_Wiki = 'Squalius_cephalus'; % Wikipedia
metaData.links.id_ADW = 'Squalius_cephalus'; % ADW
metaData.links.id_Taxo = '592161'; % Taxonomicon
metaData.links.id_WoRMS = '282855'; % WoRMS
metaData.links.id_fishbase = 'Squalius-cephalus'; % fishbase

%% References
%
bibkey = 'wikipedia'; type = 'Misc'; bib = ...
'howpublished = {\url{https://de.wikipedia.org/wiki/Squalius_cephalus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fischlexikon'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fischlexikon.eu/fischlexikon/fische-suchen.php?fisch_id=0000000005}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalius-cephalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuprMamc2011'; type = 'Article'; bib = [ ...  
'author = {Kupren, K. and  Mamcarz, D. and Kucharczyk D.}, ' ...
'year = {2011}, ' ...
'title = {Effect of variable and constant thermal conditions on embryonic and early larval development of fish from the genus {L}euciscus ({C}yprinidae, {T}eleostei)}, ' ... 
'journal = {Czech J. Anim. Sci.}, ' ...
'volume = {56}, '...
'number = {2},' ...
'pages = {70--80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KocErdo2007'; type = 'Article'; bib = [ ...  
'author = {Koc, H.T. and Erdogan, Z. and Tinkci M. and Treer, T.}, ' ...
'year = {2007}, ' ...
'title = {Age, growth and reproductive characteristics of chub, \emph{Leuciscus cephalus} ({L}., 1758)in the {I}kizcetepeler {D}am {L}ake ({B}alikesir), {T}urkey}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {23}, '...
'pages = {19--24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KiliBece2016'; type = 'Article'; bib = [ ...  
'author = {Kilic, S. and Becer, Z.A. }, ' ...
'year = {2016}, ' ...
'title = {Growth and Reproduction of Chub (\emph{Squalius cephalus}) in {L}ake {Y}eni\c{c}a\v{g}a, {B}olu, {T}urkey}, ' ... 
'journal = {Int. J. Agric. Biol.}, ' ...
'volume = {18}, '...
'pages = {419--424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuprNowo2014'; type = 'Misc'; bib = [ ...  
'author = {Kupren, K. and Nowosad, J. and Zarski, D. and Targonska, K. and Kucharczyk, D. }, ' ...
'year = {2014}, ' ...
'title = {Early Development and Allometric grwoth in Laboratory-reared {E}uropean Chub \emph{Leuciscus chephalus} ({L}.)}, ' ... 
'note = {Poster presentation at scientific conference: "FABA 2014: International Symposium on fisheries and Aquatic Sciences"}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Calt2000'; type = 'Article'; bib = [ ...  
'author = {Calta, M. }, ' ...
'year = {2000}, ' ...
'title = {Morphological development and growth of chub, \emph{Leuciscus cephalus}, larvae}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {16}, '...
'pages = {83--85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sasi2004'; type = 'Article'; bib = [ ...  
'author = {Sasi. H. }, ' ...
'year = {2004}, ' ...
'title = {The Reproduction Biology of Chub (\emph{Leuciscus cephalus} {L}. 1758) in {T}opcam {D}am {L}ake ({A}yd{\i}n, {T}urkey)}, ' ... 
'journal = {Turk. J. Vet. Anim. Sci.}, ' ...
'volume = {28}, '...
'pages = {693--699}'];
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
