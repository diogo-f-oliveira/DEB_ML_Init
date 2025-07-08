function [data, auxData, metaData, txtData, weights] = mydata_Gadus_macrocephalus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Gadus_macrocephalus'; 
metaData.species_en = 'Pacific cod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.9); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 14];

%% set data
% zero-variate data
data.ab = 29;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'besed on Pollachus virens';
data.am = 25*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(2.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 66.6;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 119 ;    units.Li = 'cm';   label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.15  mm for Polloachius virens: pi/6*0.115^3';
data.Wwp = 2.12e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00661*Lp^3.02, see F1';
data.Wwi = 12.25e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^3.02, see F1';

data.Ri = 5.7e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(2.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length-weight
data.tLW = [ ... % age class (yr), Length (cm), weight (g) 
    1 26.0  190
    2 43.5  950
    3 55.2 1980
    4 64.2 3160
    5 71.1 4350
    6 76.4 5430
    7 80.5 6380
    8 83.5 7170];
data.tLW(:,1) = 365 * (data.tLW(:,1) + 0.7); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(2.9);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Ketc1964'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.ab = 0 * weights.ab;

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
D1 = 'temperatures are guessed; ab is ignored; (Li,Wwi) is not fully consistent with (tL,tW)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00661*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6K6PF'; % Cat of Life
metaData.links.id_ITIS = '934083'; % ITIS
metaData.links.id_EoL = '216657'; % Ency of Life
metaData.links.id_Wiki = 'Gadus_macrocephalus'; % Wikipedia
metaData.links.id_ADW = 'Gadus_macrocephalus'; % ADW
metaData.links.id_Taxo = '388036'; % Taxonomicon
metaData.links.id_WoRMS = '300735'; % WoRMS
metaData.links.id_fishbase = 'Gadus-macrocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gadus_macrocephalus}}';
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
bibkey = 'Ketc1964'; type = 'article'; bib = [ ...
'doi = {10.1139/f64-096}, ' ...
'author = {Ketchen, K. S.}, ' ... 
'year   = {1964}, ' ...
'title  = {Preliminary Results of Studies on Growth and Mortality of Pacific Cod (\emph{Gadus macrocephalus}) in {H}ecate {S}trait, {B}ritish {C}olumbia}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'page = {1051–1067}, ' ...
'volume = {21(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Gadus-macrocephalus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

