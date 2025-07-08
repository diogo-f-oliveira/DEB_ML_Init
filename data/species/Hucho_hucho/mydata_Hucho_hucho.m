  function [data, auxData, metaData, txtData, weights] = mydata_Hucho_hucho
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Hucho_hucho'; 
metaData.species_en = 'Huchen'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', '0iFe', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 16];

%% set data
% zero-variate data
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'AndrStra2013';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 75;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm of Stenodus leucichthys: pi/6*0.25^3';
data.Wwp = 5.6e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.017, see F1';
data.Wwi = 45e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.017 gives 45 kg, see F1; max. published weight: 52.0 kg';
    
data.Ri = 19e3/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (yr), std length (cm)
 1	 16.7  15.9
 2	 30.2  27.4
 3	 42.3  37.8
 4	 51.3  48.2
 5	 61.3  55.0
 6	 68.8  61.8
 7	 74.2  68.7
 8	 81.4  75.1
 9	 88.0  79.8
10	 94.6  83.1
11	100.2  88.9
12	106.9  93.9
13	NaN    99.1
14  NaN   103.6
15  NaN   108.7];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AndrStra2013'; treat.tL = {1 {'Dunajec River','farm in Pribovce'}};

% time-weight
data.tW = [ ... % time (yr), weight (g)
 1	   37    14
 2	  257   105
 3	  771   355
 4	 1444   888
 5	 2579  1462
 6	 3756  2269
 7	 4804  3383
 8	 6494  4735
 9	 8371  5954
10	10594  6937
11	12776  8949
12	15773 11001
13	NaN   13482
14  NaN   15942
15  NaN   19112];
data.tW(:,1) = 365 * (0.8 + data.tW(:,1));
units.tW = {'d', 'g'}; label.tW = {'time', 'weight'};  
temp.tW = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AndrStra2013'; treat.tW = {1 {'Dunajec River','farm in Pribovce'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature is guessed at the preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3MSJL'; % Cat of Life
metaData.links.id_ITIS = '162024'; % ITIS
metaData.links.id_EoL = '204854'; % Ency of Life
metaData.links.id_Wiki = 'Hucho_hucho'; % Wikipedia
metaData.links.id_ADW = 'Hucho_hucho'; % ADW
metaData.links.id_Taxo = '42801'; % Taxonomicon
metaData.links.id_WoRMS = '1023062'; % WoRMS
metaData.links.id_fishbase = 'Hucho-hucho'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hucho_hucho}}';  
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
bibkey = 'AndrStra2013'; type = 'Article'; bib = [ ... 
'doi = {10.2478/aopf-2013-0015}, ' ...
'author = {Jaroslav Andreji and Ivan Str\''{a}\`{o}ai}, ' ...
'year = {2013}, ' ...
'title = {Growth parameters of huchen \emph{Hucho hucho} ({L}.) in the wild and under culture conditions}, ' ... 
'journal = {Arch. Pol. Fish.}, ' ...
'pages = {179-188}, ' ...
'volume = {21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hucho-hucho.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

