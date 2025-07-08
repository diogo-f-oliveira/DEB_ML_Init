function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_latipinna

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Poecilia_latipinna'; 
metaData.species_en = 'Sailfin molly'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN','THn'};
metaData.ecoCode.habitat = {'0iFm','0iFc'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 26;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3-4 wk';
data.tpm = 148;      units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'TravFarr1989';
  temp.tpm = C2K(25);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 0.9 * 365;  units.amm = 'd';    label.amm = 'life span for males';   bibkey.amm = 'Wiki';   
  temp.amm = C2K(26);  units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lb  = 0.98;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'MoshEagd2015';  
data.Lp  = 6.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';
data.Lpm  = 4.53/0.83;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for male';      bibkey.Lpm  = 'TravFarr1989';
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'fishbase';
data.Lim  = 7.6/0.83;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length of male';      bibkey.Lim  = 'Wiki';
  comment.Lim = 'based on SL 7.6 cm, see F3';

data.Wwb = .013 * data.Lb^3.0447; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'MoshEagd2015','fishbase'};
  comment.Wwb = 'based on 0.01380*Lb^3.03, see F2';
data.Wwp = 4.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01380*Lp^3.03, see F2';
data.Wwi = 50.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.03, see F2';
data.Wwim = 11.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.01380*Lim^3.03, see F2';

data.Ri  = 300/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: upto 140 young per litter';
 
% uni-variate data
  
% time-length
data.tL_m = [ ... % time since birth (d), std length (cm)
21.436	1.807
28.076	2.214
35.249	2.492
42.398	2.943
50.117	3.017
57.299	3.236
63.449	3.470
70.142	3.514
75.776	3.748
83.489	3.865
90.175	3.953
96.857	4.071
103.546	4.145
110.754	4.189
118.478	4.234
125.158	4.366
131.857	4.367
138.036	4.397
148.837	4.544
153.990	4.545
159.659	4.546
166.865	4.606
180.768	4.681];
data.tL_m(:,1) = data.tL_m(:,1)/ 0.83; % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length'};  
temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TravFarr1989';
comment.tL_m = 'Data for male, SL converted to TL';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_m = 50 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am}, E_Hp and h_a only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g  = 0.01380 * (TL in cm)^3.03';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-length from photo: SL  = 0.83 * TL';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Males die soon after maturation';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '7855L'; % Cat of Life
metaData.links.id_ITIS = '165898'; % ITIS
metaData.links.id_EoL = '211989'; % Ency of Life
metaData.links.id_Wiki = 'Poecilia_latipinna'; % Wikipedia
metaData.links.id_ADW = 'Poecilia_latipinna'; % ADW
metaData.links.id_Taxo = '44608'; % Taxonomicon
metaData.links.id_WoRMS = '275348'; % WoRMS
metaData.links.id_fishbase = 'Poecilia-latipinna'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Poecilia_latipinna}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Poecilia-latipinna.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TravFarr1989'; type = 'Article'; bib = [ ... 
'author = {Joseph Travis and James A. Farr and Michael McManus and Joel C. Trexler}, ' ... 
'year = {1989}, ' ...
'title = {Environmental effects on adult growth patterns in the male sailfin molly, \emph{Poecilia latipinna} ({P}oeciliidae)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {26}, ' ...
'pages = {119-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoshEagd2015'; type = 'Article'; bib = [ ... 
'author = {Fatemeh Moshayedi and Soheil Eagderi and Pariya Jalili and Hamed Mousavi-Sabet}, ' ... 
'year = {2015}, ' ...
'title = {Allometric growth pattern and morphological development of sailfin molly - \emph{Poecilia latipinna} ({C}yprinodontiformes, {P}oeciliidae) during early development}, ' ...
'journal = {Poeciliid Research, 2015, Volume 5, Issue 1.}, ' ...
'volume = {5(1)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

