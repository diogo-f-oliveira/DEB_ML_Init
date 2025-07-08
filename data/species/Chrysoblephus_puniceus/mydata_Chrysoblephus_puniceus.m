function [data, auxData, metaData, txtData, weights] = mydata_Chrysoblephus_puniceus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Chrysoblephus_puniceus'; 
metaData.species_en = 'Slinger seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 07];

%% set data
% zero-variate data

data.am = 11*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'GarrGove1993';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 85;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 335; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02754*Lp^3.00, see F1';
data.Wwi = 16913; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02754*Li^3.00, see F1';

data.GSI  = 0.035; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(24.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Pterogymnus_laniarius'; 
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
 1	20.297 NaN
 2	23.694 NaN
 3	26.103 NaN
 4	27.793 NaN
 5	33.797 36.134
 6	36.296 38.274
 7	34.930 38.885
 8	33.564 36.979
 9	29.591 38.939
10	33.528 38.292
11	28.566 40.072];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0.6);
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm  = C2K(24.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GarrGove1993'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
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
F1 = 'length-weight: Ww in g = 0.02754*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YMB6'; % Cat of Life
metaData.links.id_ITIS = '647931'; % ITIS
metaData.links.id_EoL = '46580049'; % Ency of Life
metaData.links.id_Wiki = 'Chrysoblephus_puniceus'; % Wikipedia
metaData.links.id_ADW = 'Chrysoblephus_puniceus'; % ADW
metaData.links.id_Taxo = '171183'; % Taxonomicon
metaData.links.id_WoRMS = '218600'; % WoRMS
metaData.links.id_fishbase = 'Chrysoblephus-puniceus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrysoblephus_puniceus}}';
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
bibkey = 'GarrGove1993'; type = 'article'; bib = [ ... 
'doi = {10.2989/025776193784287176}, ' ...
'author = {Garratt, P. A. and Govender, A. and Punt, A. E.}, ' ... 
'year = {1993}, ' ...
'title = {Growth acceleration at sex change in the protogynous hermaphrodite \emph{Chrysoblephus puniceus} ({P}isces: {S}paridae)}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'chapter = {13(1)}, ' ...
'pages = {187–193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrysoblephus-puniceus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

