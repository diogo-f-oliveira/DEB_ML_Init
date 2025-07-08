function [data, auxData, metaData, txtData, weights] = mydata_Pterogymnus_laniarius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pterogymnus_laniarius'; 
metaData.species_en = 'Panga seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
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

data.am = 33*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'SmalPunt1991';   
  temp.am = C2K(18.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20.4;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 160; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01622*Lp^3.05, see F1';
data.Wwi = 1788; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01622*Li^3.05, see F1';

data.GSI  = 0.035; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'HechBaird1977';   
  temp.GSI = C2K(18.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
% 1 26.8 26.5 % ignore6, strange outlier
 5 30.1 29.9
 6 32.5 31.8
 7 35.9 34.9
 8 37.2 37.2
 9 39.2 38.9
10 40.7 40.9
11 42.1 41.9];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0);
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm  = C2K(18.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HechBaird1977'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01622*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WKMD'; % Cat of Life
metaData.links.id_ITIS = '647974'; % ITIS
metaData.links.id_EoL = '46580026'; % Ency of Life
metaData.links.id_Wiki = 'Pterogymnus_laniarius'; % Wikipedia
metaData.links.id_ADW = 'Pterogymnus_laniarius'; % ADW
metaData.links.id_Taxo = '185476'; % Taxonomicon
metaData.links.id_WoRMS = '218619'; % WoRMS
metaData.links.id_fishbase = 'Pterogymnus-laniarius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterogymnus_laniarius}}';
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
bibkey = 'HechBaird1977'; type = 'article'; bib = [ ... 
'doi = {10.1080/00445096.1977.11447581}, ' ...
'author = {T. Hecht and D. Baird}, ' ... 
'year = {1977}, ' ...
'title = {Contributions to the Biology of the Panga \emph{Pterogymnus Laniarus} ({P}isces : {S}paridae): Age, Growth and Reproduction}, ' ...
'journal = {Zoologica Africana}, ' ...
'chapter = {12(2)}, ' ...
'pages = {363-372}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pterogymnus-laniarius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

