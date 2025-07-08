function [data, auxData, metaData, txtData, weights] = mydata_Beryx_decadactylus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beryciformes'; 
metaData.family     = 'Berycidae';
metaData.species    = 'Beryx_decadactylus'; 
metaData.species_en = 'Alfonsino'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 11];

%% set data
% zero-variate data

data.am = 69*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(11.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LeisCars2000';
  comment.Wwb = 'based on egg diameter of 1.1 mm of Beryx_splendens: pi/6*0.11^3';
data.Wwi = 18.1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.05, see F1; max published weight is 4 kg';

data.Ri = 1.96e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(11.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Beryx_splendens: 675e3*(100/70)^3';
  
% univariate data
data.LL = [ ... % fork length at t (cm), fork length at t+1 (cm)
17.482	31.563
18.501	22.933
18.908	23.209
19.334	25.759
19.877	24.557
19.935	22.721
20.094	27.748
20.733	24.949
21.105	28.937
21.273	28.536
21.381	25.622
21.684	28.333
21.909	26.016
22.079	25.376
22.561	26.369
23.205	27.481
23.283	27.880
23.293	26.802
24.008	29.190
26.888	27.369
27.489	28.720
27.625	31.792
28.332	30.509
28.994	29.705
29.028	30.463
30.854	32.083
31.209	33.557
32.921	34.220];
data.LL = 1.12 * data.LL; % convert FL to TL
units.LL  = {'cm', 'cm'};  label.LL = {'total length at t', 'total length at t+365'};  
temp.LL   = C2K(11.2);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'IkenMasu1968';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 5 * weights.LL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: W in g = 0.01445*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.12 * FL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'LN4V'; % Cat of Life
metaData.links.id_ITIS = '166155'; % ITIS
metaData.links.id_EoL = '47063436'; % Ency of Life
metaData.links.id_Wiki = 'Beryx_decadactylus'; % Wikipedia
metaData.links.id_ADW = 'Beryx_decadactylus'; % ADW
metaData.links.id_Taxo = '164110'; % Taxonomicon
metaData.links.id_WoRMS = '126394'; % WoRMS
metaData.links.id_fishbase = 'Beryx-decadactylus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beryx_decadactylus}}';
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
bibkey = 'IkenMasu1968'; type = 'Article'; bib = [ ... 
'author = {Ikenouye, H. and H. Masuzawa}, ' ... 
'year = {1968}, ' ...
'title = {An estimation of growth equation basing on the results of tagging experiments of the {J}apanese Alfonsin fish}, ' ...
'journal = {Bull. Jap, Soc. sci. Fish.}, ' ...
'volume = {34(2)}, ' ...
'pages = {97-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeisCars2000'; type = 'Book'; bib = [ ...  
'author = {J. M. Leis and B. M. Carson-Ewart}, ' ...
'year = {2000}, ' ...
'title  = {The Larvae of Indo-Pacific Coastal Fishes: An Identification Guide to Marine Fish Larvae (Fauna Malesiana Handbook,)}, ' ...
'publisher = {Brill}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Beryx-decadactylus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

