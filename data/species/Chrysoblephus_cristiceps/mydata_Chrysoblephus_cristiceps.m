function [data, auxData, metaData, txtData, weights] = mydata_Chrysoblephus_cristiceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Chrysoblephus_cristiceps'; 
metaData.species_en = 'Daggerhead seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 06];

%% set data
% zero-variate data

data.am = 23*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Buxt1993';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36.5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 75;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 815; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01738*Lp^2.99, see F1';
data.Wwi = 7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.99, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'Buxt1990';   
  temp.GSI = C2K(17.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL_TS = [ ... % time since birth (yr), fork length (cm)
    1  8.70  NaN
    2  NaN  12.68
    3 23.18 15.97
    4 23.18 20.94
    5 27.20 24.33
    6 29.68 26.45
    7 32.62 28.16
    8 34.45 31.93
    9 36.68 34.82
   10 39.04 34.98
   11 41.33 41.17
   12 43.49 44.10
   13 44.69 45.90
   14 45.93 45.20
   15 47.10 46.80
   16 50.85 NaN
   17 50.16 NaN
   18 51.86 52.50
   19 53.70 NaN
   20 53.20 NaN
   21 58.00 NaN
   22 56.30 NaN
   23 58.60 NaN];
data.tL_TS(:,1) = 365 * (data.tL_TS(:,1) + 0.5);
units.tL_TS = {'d', 'cm'};  label.tL_TS = {'time since birth', 'fork length'};  
temp.tL_TS   = C2K(17.5);  units.temp.tL_TS = 'K'; label.temp.tL_TS = 'temperature';
bibkey.tL_TS = 'Buxt1993'; treat.tL_TS = {1 {'Tsitsikamma','Sardinia Bay to Noordhoek'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_TS = 10 * weights.tL_TS;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01738*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Only known from South Africa';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5YLZS'; % Cat of Life
metaData.links.id_ITIS = '647927'; % ITIS
metaData.links.id_EoL = '46580046'; % Ency of Life
metaData.links.id_Wiki = 'Chrysoblephus_cristiceps'; % Wikipedia
metaData.links.id_ADW = 'Chrysoblephus_cristiceps'; % ADW
metaData.links.id_Taxo = '171179'; % Taxonomicon
metaData.links.id_WoRMS = '218597'; % WoRMS
metaData.links.id_fishbase = 'Chrysoblephus-cristiceps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrysoblephus_cristiceps}}';
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
bibkey = 'Buxt1993'; type = 'article'; bib = [ ... 
'doi = {10.1007/BF00005979}, ' ...
'author = {Buxton, C.D.}, ' ... 
'year = {1993}, ' ...
'title = {Life-history changes in exploited reef fishes on the east coast of {S}outh {A}frica}, ' ...
'journal = {Environ. Biol. Fishes}, ' ...
'chapter = {36(1)}, ' ...
'pages = {47-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buxt1990'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1990.tb04321.x}, ' ...
'author = {Buxton, C.D.}, ' ... 
'year = {1990}, ' ...
'title = {The reproductive biology of \emph{Chrysoblephus laticeps} and \emph{C. cristiceps} ({T}eleostei: {S}paridae)}, ' ...
'journal = {Journal of Zoology}, ' ...
'chapter = {220(3)}, ' ...
'pages = {497–511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrysoblephus-cristiceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

