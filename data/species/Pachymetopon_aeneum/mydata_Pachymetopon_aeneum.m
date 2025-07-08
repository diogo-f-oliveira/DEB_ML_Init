function [data, auxData, metaData, txtData, weights] = mydata_Pachymetopon_aeneum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pachymetopon_aeneum'; 
metaData.species_en = 'Blue hottentot'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

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

data.am = 12*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BuxtClar1986';   
  temp.am = C2K(19.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 55;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 229; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^3.04, see F1';
data.Wwi = 2516; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.04, see F1';

data.GSI  = 0.028; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'BuxtClar1986';   
  temp.GSI = C2K(19.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1.0	8.444
1.5	10.074
2.0	12.741
2.5	14.000
3.0	15.481
3.5	18.000
4.0	20.593
4.5	22.074
5.0	22.000
5.5	25.630
6.0	26.296
6.5	28.222
7.0	26.148
7.5	30.370
8.0	30.148
8.5	33.926
9.5	31.556
10.5	34.370
11.5	37.556];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.5);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL  = C2K(19.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BuxtClar1986'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BT4W'; % Cat of Life
metaData.links.id_ITIS = '647955'; % ITIS
metaData.links.id_EoL = '46580032'; % Ency of Life
metaData.links.id_Wiki = 'Pachymetopon_aeneum'; % Wikipedia
metaData.links.id_ADW = 'Pachymetopon_aeneum'; % ADW
metaData.links.id_Taxo = '182466'; % Taxonomicon
metaData.links.id_WoRMS = '218606'; % WoRMS
metaData.links.id_fishbase = 'Pachymetopon-aeneum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pachymetopon_aeneum}}';
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
bibkey = 'BuxtClar1986'; type = 'article'; bib = [ ... 
'doi = {10.2989/02577618909504551}, ' ...
'author = {Buxton, C.D. and J.R. Clarke}, ' ... 
'year = {1986}, ' ...
'title = {Age, growth and feeding of the blue hottentot \emph{Pachymetopon aeneum} ({P}isces: {S}paridae) with notes on reproductive biology}, ' ...
'journal = {S. Afr. J. Zool.}, ' ...
'chapter = {21}, ' ...
'pages = {33-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pachymetopon-aeneum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

