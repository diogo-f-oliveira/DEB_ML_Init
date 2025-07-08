function [data, auxData, metaData, txtData, weights] = mydata_Melanotaenia_fluviatilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Melanotaeniidae';
metaData.species    = 'Melanotaenia_fluviatilis'; 
metaData.species_en = 'Crimson-spotted rainbowfish'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 03 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 17]; 

%% set data
% zero-variate data

data.ab = 5;   units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'ReidHold1995';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4 d but variation is large';
data.am = 4*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.2;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'PollGeor2009'; 
  comment.Lp = 'based on lower end of size-range of adults';
data.Li  = 9;  units.Li  = 'cm';  label.Li  = 'ultimate std length for females';  bibkey.Li  = 'Wiki';
  comment.Li = 'based on typical max length of 7 and 8.5 cm for female and male: 11*7/8.5';
data.Lim  = 11;  units.Lim  = 'cm';  label.Lim  = 'ultimate std length for males';  bibkey.Lim  = 'Wiki';

data.Wwb = 5.56e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ReidHold1995';
  comment.Wwb = 'based on egg diameter of 0.98-1.07 mm: pi/6*0.102^3';

data.Ri = 25;units.Ri  = '#/d'; label.Ri  = 'reprod  at 4 cm';      bibkey.Ri  = 'PollGeor2009';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'length 3.3-5.3 cm';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... time since birth (d), std length (cm), weight (mg)
 0	0.418   0.221
 1	0.442   NaN
 2	0.433   0.236
 3	0.440   NaN
 4	0.458   0.214
 5	0.435   NaN
 6	0.456   NaN
 7	0.473   0.520
 8	0.490   NaN
 9	0.499   NaN
10	0.512   NaN % birth
12	0.558   1.305
17	0.598   NaN
20	0.569   NaN
22	0.815   4.155
32	1.390  29.264
42	1.377  26.695
52	1.743  77.251
72	2.119 106.943
82	2.352 127.594];
data.tLW(:,3) = data.tLW(:,3)/1e3; % convert mg to g
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since hatch', 'std length', 'weight'}; 
temp.tLW    = C2K(25.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ReidHold1995'; treat.tLW = {1, {'time','length','weight'}};

% length-weight
data.LW_f = [ ...
    3.3 3
    5.3 5];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'std length', 'weight', 'females'}; 
bibkey.LW_f = 'PollGeor2009'; comment.LW_f = 'Data for females';
%
data.LW_m = [ ...
    4.2 6
    6.0 8];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'std length', 'weight', 'males'}; 
bibkey.LW_m = 'PollGeor2009'; comment.LW_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
%weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3ZBLP'; % Cat of Life
metaData.links.id_ITIS = '630770'; % ITIS
metaData.links.id_EoL = '224581'; % Ency of Life
metaData.links.id_Wiki = 'Melanotaenia_fluviatilis'; % Wikipedia
metaData.links.id_ADW = 'Melanotaenia_fluviatilis'; % ADW
metaData.links.id_Taxo = '44650'; % Taxonomicon
metaData.links.id_WoRMS = '1423106'; % WoRMS
metaData.links.id_fishbase = 'Melanotaenia-fluviatilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Melanotaenia_fluviatilis}}'];
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
bibkey = 'ReidHold1995'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF9950475}, ' ...
'author = {Reid, H. P. and Holdway, D. A.}, ' ... 
'year = {1995}, ' ...
'title = {Early development of the {A}ustralian crimson-spotted rainbowfish, \emph{Melanotaenia fluviatilis} ({P}isces: {M}elanotaeniidae)}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {46(2)}, ' ...
'pages = {475-480}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PollGeor2009'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.ecoenv.2009.01.012}, ' ...
'author = {Carmel A. Pollino and Eugene Georgiades and Douglas A. Holdway}, ' ... 
'year = {2009}, ' ...
'title = {Physiological changes in reproductively active rainbowfish (\emph{Melanotaenia fluviatilis}) following exposure to naphthalene}, ' ...
'journal = {Ecotoxicology and Environmental Safety}, ' ...
'volume = {72}, ' ...
'pages = {1265–1270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.se/summary/Melanotaenia-fluviatilis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

