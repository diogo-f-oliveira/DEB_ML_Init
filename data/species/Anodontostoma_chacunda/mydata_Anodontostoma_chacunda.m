  function [data, auxData, metaData, txtData, weights] = mydata_Anodontostoma_chacunda
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Anodontostoma_chacunda'; 
metaData.species_en = 'Chacunda gizzard shad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 09];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.1;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 22;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'RamyBena2019';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 29;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.04, see F1';
data.Wwi = 112.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.04, see F1';

data.Ri  = 7e5/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity: 297457 to 1144871';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
274.294	11.015
303.547	12.066
365-59.574	12.083
365-29.251	13.896
365+2.567	13.676
365+63.144	15.311
365+94.954	14.879
365+124.693	14.870];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'DwinHari1986';
comment.tL = 'Data from length frequency distributions';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Weights Wwi and Wwp are ignored due to inconsistency with tW versus tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.04';  
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '675VQ'; % Cat of Life
metaData.links.id_ITIS = '161796'; % ITIS
metaData.links.id_EoL = '46562498'; % Ency of Life
metaData.links.id_Wiki = 'Anodontostoma_chacunda'; % Wikipedia
metaData.links.id_ADW = 'Anodontostoma_chacunda'; % ADW
metaData.links.id_Taxo = '160990'; % Taxonomicon
metaData.links.id_WoRMS = '279626'; % WoRMS
metaData.links.id_fishbase = 'Anodontostoma-chacunda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Anodontostoma_chacunda}}';  
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
bibkey = 'DwinHari1986'; type = 'techreport'; bib = [ ...  
'author = {A. Dwiponggo and T. Hariati and S. Banon and M.L. Palomares and D. Pauly}, ' ...
'year = {1986}, ' ...
'title = {Growth, Mortality and Recruitment of Commercially Important Fishes and Penaeid Shrimps in Indonesian Waters}, ' ... 
'institution = {RESEARCH INSTITUTE FOR MARINE FISHERIES, JAKARTA, INDONESIA; INTERNATIONAL CENTER FOR LIVING AQUATIC RESOURCES MANAGEMENT, MANILA PHILIPPINES}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SelvVara2013'; type = 'article'; bib = [ ... 
'doi = {10.4172/2157-7099.1000193}, ' ...
'author = {Selvam, J. and Varadharajan, D and Babu, A. and Balasubramanian, T.}, ' ...
'year = {2013}, ' ...
'title = {Taxonomy and Identification of Finfish Eggs from {M}uthupettai, South East Coast of {I}ndia}, ' ... 
'journal = {J. Cytol. Histol}, ' ...
'volume = {4}, ' ...
'pages = {5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamyBena2019'; type = 'article'; bib = [ ... 
'author = {V.C. Ramya and S. Benakappa and V. Mahesh and A.S. Kumar Naik and H.N. Anjanayappa and M.E. Vijaykumar}, ' ...
'year = {2019}, ' ...
'title = {Breeding seasonality of \emph{Anodontostoma chacunda} ({H}amilton, 1822) off {M}angalore coast, {K}arnataka, {I}ndia}, ' ... 
'journal = {Indian Journal of Geo Marine Sciences}', ...
'volume = {48(05)}, ' ...
'pages = {628-634}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anodontostoma-chacunda.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  