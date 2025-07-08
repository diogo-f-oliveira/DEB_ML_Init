function [data, auxData, metaData, txtData, weights] = mydata_Dentex_angolensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Dentex_angolensis'; 
metaData.species_en = 'Angolan dentex'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 08];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(16.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(16.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Dentex dentex';

data.Lp  = 15;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';  
data.Li  = 37.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 54;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based in 0.01479*Lp^3.03, see F1';
data.Wwi = 870;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01479*Li^3.03, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(16.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Dentex dentex';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
91.885	14.694
182.992	18.118
211.703	19.041
300.349	21.551
330.354	21.431
362.810	22.486
365+65.276	23.293
365+88.999	23.954
365+120.227	24.487
365+148.965	24.758
365+181.427	25.682
365+210.182	25.562
365+238.931	25.572
365+300.110	27.290
365+332.604	27.432
365+360.120	27.051
730+65.070	28.249
730+181.318	28.291
730+301.273	29.377
730+361.277	29.268
1095+64.999	29.945
1095+89.999	29.954];
data.tL(:,1) = 300 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(16.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AmpoAsie2023';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34TSS'; % Cat of Life
metaData.links.id_ITIS = '647934'; % ITIS
metaData.links.id_EoL = '46579932'; % Ency of Life
metaData.links.id_Wiki = 'Dentex'; % Wikipedia
metaData.links.id_ADW = 'Dentex_angolensis'; % ADW
metaData.links.id_Taxo = '172978'; % Taxonomicon
metaData.links.id_WoRMS = '273958'; % WoRMS
metaData.links.id_fishbase = 'Dentex-angolensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentex}}';
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
bibkey = 'AmpoAsie2023'; type = 'Article'; bib = [ ... 
'author = {Amponsah, S. and B. Asiedu and N.C. Amarquaye and E. Ofori-Boateng and N.A. Afranewaa and S. Henneh}, ' ... 
'year = {2023}, ' ...
'title = {Population dynamics of seabreams (\emph{Pagrus caeruleostictus}, \emph{Pagellus bellottii}, \emph{Dentex angolensis} and \emph{Dentex congoensis}) from the coast of {G}hana, {W}est {A}frica}, ' ...
'journal = {Journal of Marine Sciences and Fisheries}, ' ...
'volume = {6(1)}, ' ...
'pages = {24-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Dentex-angolensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
