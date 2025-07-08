function [data, auxData, metaData, txtData, weights] = mydata_Cheimerius_nufar

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Cheimerius_nufar'; 
metaData.species_en = 'Santer seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 05];

%% set data
% zero-variate data

data.am = 23*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'CoetBair1981';   
  temp.am = C2K(23.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 34.6;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 75;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 659; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01380*Lp^3.04, see F1';
data.Wwi = 6.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.04, see F1';

data.Ri  = 473277 /365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'speciesstatus';   
  temp.Ri = C2K(23.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1 NaN    128
    2 24.70  232
    3 30.27  368
    4 33.92  533
    5 35.09  725
    6 41.91  940
    7 43.35 1175
    8 47.08 1427
    9 49.46 1693
   10 53.96 1968
   11 56.34 2250
   12 58.20 2537
   13 60.33 2826
   14 61.88 3115
   15 64.66 3403
   16 67.37 3687
   17 62.40 3966
   18 66.30 4241
   19 NaN   4508
   20 68.50 4768
   21 NaN   5018
   22 70.50 5263];    
data.tLW(:,1) = 365 * (data.tLW(:,1) + 0.9);
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW   = C2K(23.9);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'CoetBair1981'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 15 * weights.tLW;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TT94'; % Cat of Life
metaData.links.id_ITIS = '647925'; % ITIS
metaData.links.id_EoL = '46580016'; % Ency of Life
metaData.links.id_Wiki = 'Cheimerius_nufar'; % Wikipedia
metaData.links.id_ADW = 'Cheimerius_nufar'; % ADW
metaData.links.id_Taxo = '170711'; % Taxonomicon
metaData.links.id_WoRMS = '218594'; % WoRMS
metaData.links.id_fishbase = 'Cheimerius-nufar'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheimerius_nufar}}';
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
bibkey = 'CoetBair1981'; type = 'article'; bib = [ ... 
'author = {P.S. Coetzee and D. Baird}, ' ... 
'year = {1981}, ' ...
'title = {Age, growth and food of \emph{Cheimerius nufar} ({E}hrenberg, 1820) ({S}paridae), collected off {S}t {C}roix {I}sland, {A}lgoa {B}ay}, ' ...
'journal = {S. Afr. J. Zool.}, ' ...
'chapter = {16}, ' ...
'pages = {137-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cheimerius-nufar.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'speciesstatus'; type = 'Misc'; bib = ...
'howpublished = {\url{https://speciesstatus.sanbi.org/taxa/detail/2940/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
