function [data, auxData, metaData, txtData, weights] = mydata_Chrysoblephus_laticeps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Chrysoblephus_laticeps'; 
metaData.species_en = 'Roman seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
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
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.1;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 105; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^3.00, see F1';
data.Wwi = 2222; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^3.00, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'Buxt1990';   
  temp.GSI = C2K(23); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL_TN = [ ... % time since birth (yr), fork length (cm)
    0  7.19 NaN
    1 14.90 12.60
    2 16.13 15.84
    3 19.68 20.90
    4 23.19 23.81
    5 25.53 25.29
    6 27.68 27.19
    7 29.52 29.21
    8 30.86 31.02
    9 32.29 32.66
   10 33.63 34.18
   11 35.46 36.49
   12 36.14 37.05
   13 37.92 39.33
   14 38.31 42.40
   15 NaN   43.30
   16 39.66 43.55
   17 39.78 42.20];
data.tL_TN(:,1) = 365 * (data.tL_TN(:,1) + 0.9);
units.tL_TN = {'d', 'cm'};  label.tL_TN = {'time since birth', 'fork length'};  
temp.tL_TN   = C2K(23);  units.temp.tL_TN = 'K'; label.temp.tL_TN = 'temperature';
bibkey.tL_TN = 'Buxt1993'; treat.tL_TN = {1 {'Tsitsikamma','Noordhoek'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_TN = 10 * weights.tL_TN;
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
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YLZZ'; % Cat of Life
metaData.links.id_ITIS = '647929'; % ITIS
metaData.links.id_EoL = '46580048'; % Ency of Life
metaData.links.id_Wiki = 'Chrysoblephus_laticeps'; % Wikipedia
metaData.links.id_ADW = 'Chrysoblephus_laticeps'; % ADW
metaData.links.id_Taxo = '171181'; % Taxonomicon
metaData.links.id_WoRMS = '218599'; % WoRMS
metaData.links.id_fishbase = 'Chrysoblephus-laticeps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrysoblephus_laticeps}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Chrysoblephus-laticeps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

