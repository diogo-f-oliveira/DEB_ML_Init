function [data, auxData, metaData, txtData, weights] = mydata_Lepomis_macrochirus 

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Lepomis_macrochirus'; 
metaData.species_en = 'bluegill sunfish'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb', 'Dfc', 'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fs', 'Fv', 'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biPz', 'jiCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp, based on laboratory conditions 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L', 't-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Yvonne Mueller', 'Andre Gergs'};                            
metaData.date_subm = [2020 04 21];
metaData.email    = {'yvonne.mueller@bayer.com'};
metaData.address  = {'Bayer AG, Alfred-Nobel-Str. 50, 40789 Monheim, Germany'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 04 21];

%% set data
% zero-variate data;

%birth:
data.ab = 3+3;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HicPie2012';   
  temp.ab = C2K(21.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on temperature given in Farenheit (70 F), days are based on 3 days until hatch and additional 3 days until swim up';
data.tp = 365;      units.tp = 'd';      label.tp = 'time at puberty';          bibkey.tp = 'SwiSmi1943';
  temp.tp = C2K(19);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = ['most fish spawn at an age of 1 year (few fish already after 4 month),' ...
  'Temperature based on mean Temperature in lakes in Auburn (study site) from Boyd (2015) - Water quality - an introduction']; 
data.am = ((365*11)+(365*8))/2;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'Par2013';   
  temp.am = C2K(22.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'mean life span under captivity, temperature based on standard laboratory conditions from bioaccumulation study 20-25 C';
  
data.Lb  = (0.5+0.59)/2;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'TanMof1995'; 
  comment.Lb ='0.5-0.59 cm, derived from date at first feeding, from Siefert et al 1972';
data.Li  = 22.9;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Mec2008'; 
  comment.Li = 'under excellent conditions, based on 9 inches, world record around 40 cm';  

data.Wwp = 14.17;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'SwiSmi1943';
  comment.Wwp = 'weight at first spawn, weight based on 0.5 ounces (14.17 g)';  
data.Wwi = 340.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mec2008'; 
  comment.Wwi = 'under excellent conditions, 12 ounces; can reach weight > 2 kg';


data.Ri  = 8.0e4/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Est1949';   
  temp.Ri = C2K(26.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Temperature based on temperature range (21-32 C -> 26.5 C) under which reproduction occurs in Florida (Clugston 1966 found in cabi.org)';


%uni-variate data;

%t-L data
data.tL = [ ... % time (d), total length (mm)
29.08151716	10.32686271
34.35059073	12.56391769
41.05871361	14.73412651
48.84399994	17.56260408
63.21375166	23.81343126
99.15343999	34.3334051
111.0219917	34.98456257]; 
data.tL(:,2) = data.tL(:,2) / 10 ; 
units.tL = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'}; 
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Temperature based on mean along exposure period';
bibkey.tL = {'TanMof1995'};

% t-W data
data.tW = [ ... % time (d), wet weight (mg)
29.08059024	5.835717807
33.96140749	15.15455073
40.99886493	30.05752561
49.17139614	58.88138216
63.01929625	174.9294307
99.00113507	517.4578558
111.2599319	559.3026051];  
data.tW(:,2) = data.tW(:,2) / 1000; % convert mg to g
units.tW   = {'d', 'g'};  label.tW = {'time since hatch', 'wet weight'};  
temp.tW    = C2K(19);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
comment.tW = 'Temperature based on mean along exposure period';
bibkey.tW = {'TanMof1995'};

% t-W female data
data.tW_f = [ ... % time (days), wet weight (g)
364	5.6
728	15.7
1092 26.7
1456 46
1820 64.7
2184 95.5
2548 130.1
2912 153.9
3276 187.9];  
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'wet weight'};  
temp.tW_f    = C2K(11.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
comment.tW_f = 'Data for females; Temperature based on annual mean temperature in Lake Fort Smith';
bibkey.tW_f = {'HogKil1975'};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points


%% Links 
metaData.links.id_CoL = '3TG2J'; % Cat of Life
metaData.links.id_ITIS = '168141'; % ITIS
metaData.links.id_EoL = '207661'; % Ency of Life
metaData.links.id_Wiki = 'Lepomis_macrochirus'; % Wikipedia
metaData.links.id_ADW = 'Lepomis_macrochirus'; % ADW
metaData.links.id_Taxo = '45135'; % Taxonomicon
metaData.links.id_WoRMS = '1022846'; % WoRMS
metaData.links.id_fishbase = 'Lepomis-macrochirus'; % fishbase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Par2013'; type = 'misc'; bib = [ ...  
'author = {Parr, C.}, ' ...
'year = {2013}, ' ...
'title  = {Lepomis macrochirus (On-line)}, ' ...
'publisher = {Animal Diversity Web, Accessed March 31, 2020}, ' ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepomis_macrochirus/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HicPie2012'; type = 'Article'; bib = [ ... 
'author = {Hicks, C.E. and Pierce, R.A.}, ' ... 
'year = {2012}, ' ...
'title = {Bluegill Sunfish Production in Missouri}, ' ...
'journal = {University of Missouri Extensions - Agriculture}, ' ...
'volume = {47}, ' ...
'pages = {10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TanMof1995'; type = 'Article'; bib = [ ... 
'author = {Tanner, D.K. and Moffett, M.F.}, ' ... 
'year = {1995}, ' ...
'title = {Effects of Diflubenzuron on the reproduction success of the bluegill sunfish, Lepomis macrochirus}, ' ...
'journal = {Environmetal Toxicology and Chemistry}, ' ...
'volume = {14}, ' ...
'pages = {1345--1355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HogKil1975'; type = 'Article'; bib = [ ... 
'author = {Hogue, J.J. and Kilambi, R.V.}, ' ... 
'year = {1975}, ' ...
'title = {Age and growth of bluegill, \emph{Lepomis macrochirus} {R}afinesque, from {L}ake {F}ort {S}mith, {A}rkansas}, ' ...
'journal = {Journal of the Arkansas Academy of Science}, ' ...
'volume = {29}, ' ...
'pages = {43--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SwiSmi1943'; type = 'Article'; bib = [ ... 
'author = {Swingle, H. S. and Smith, E. V.}, ' ... 
'year = {1943}, ' ...
'title = {Factors Affecting the Reproduction of Bluegill Bream and Largemouth Black Bass in Ponds}, ' ...
'journal = {Agricultural Experiment Station of the Alabama Polytechnic Institute}, ' ...
'volume = {8}, ' ...
'pages = {67--74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mec2008'; type = 'techreport'; bib = [ ... 
'author = {Mecozzi, M.}, ' ... 
'year = {2008}, ' ...
'title = {Bluegill- (\emph{Lepomis macrochirus})}, ' ...
'institution = {Wisconsin Department of Natural Resources}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Est1949'; type = 'phdthesis'; bib = [ ... 
'author = {Estes, C.M.}, ' ... 
'year = {1949}, ' ...
'title = {The fecundity of the bluegill (\emph{Lepomis macrochirus}) in certain small east {T}exas reservoirs}, ' ...
'school = {North Texas State College}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
