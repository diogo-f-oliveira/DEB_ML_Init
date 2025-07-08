function [data, auxData, metaData, txtData, weights] = mydata_Pachymetopon_blochii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pachymetopon_blochii'; 
metaData.species_en = 'Hottentot seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.3); % K, body temp
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

data.am = 13*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'PulfGrif1992';   
  temp.am = C2K(24.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 46;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 194; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Li^3.06, see F1';
data.Wwi = 1854; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^3.06, see F1; max. published weight: 1.7 kg';

data.GSI  = 0.10; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'PulfGrif1992';   
  temp.GSI = C2K(24.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  6.96
    2 11.28
    3 15.21
    4 18.77
    5 22.00
    6 24.94
    7 27.60
    8 30.02
    9 32.17
   10 34.21
   11 36.02
   12 37.66];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.1);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL  = C2K(24.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PulfGrif1992'; 

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
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BT4X'; % Cat of Life
metaData.links.id_ITIS = '647956'; % ITIS
metaData.links.id_EoL = '46580033'; % Ency of Life
metaData.links.id_Wiki = 'Pachymetopon_blochii'; % Wikipedia
metaData.links.id_ADW = 'Pachymetopon_blochii'; % ADW
metaData.links.id_Taxo = '182467'; % Taxonomicon
metaData.links.id_WoRMS = '218607'; % WoRMS
metaData.links.id_fishbase = 'Pachymetopon-blochiie'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pachymetopon_blochii}}';
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
bibkey = 'PulfGrif1992'; type = 'article'; bib = [ ... 
'doi = {10.2989/025776188784379062}, ' ...
'author = {A. Pulfrich and C. L. Griffiths}, ' ... 
'year = {1992}, ' ...
'title = {Growth, sexual maturity and reproduction in the hottentot \emph{Pachymetopon blochii} ({V}al.)}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'chapter = {7(1)}, ' ...
'pages = {25-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pachymetopon-blochii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

