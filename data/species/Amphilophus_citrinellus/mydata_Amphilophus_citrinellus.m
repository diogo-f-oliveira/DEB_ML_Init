function [data, auxData, metaData, txtData, weights] = mydata_Amphilophus_citrinellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Amphilophus_citrinellus'; 
metaData.species_en = 'Midas cichlid'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Lim  = 28.7;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';
  comment.Lim = 'based on SL = 24.4 cm, converted to TL: 24.4/0.85 cm for photo';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Oreochromis niloticus: 4/3*pi*0.075^3';
data.Wwim = 747.5;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.03162*Li^3.00, see F2';

data.Ri  = 1000/60; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '300 to 1000 eggs per clutch, assumed: 1 clutch per 60 d';
 
% uni-variate data

% time-weight
data.tW_f = [ ... % time (d), wet weight (g)
181.680	4.031
314.148	37.899
366.421	61.606
403.566	83.982
424.030	95.391];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f    = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Oldf2009';
comment.tW_f = 'data for females';
% 
data.tW_m = [ ... % time (d), wet weight (g)
181.695	7.535
312.696	52.350
365.783	89.634
402.957	119.018
423.486	145.756];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m    = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Oldf2009';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'female and males guard nest';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.03162*(TL in cm)^3.00';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'D3GS'; % Cat of Life
metaData.links.id_ITIS = '648192'; % ITIS
metaData.links.id_EoL = '608445'; % Ency of Life
metaData.links.id_Wiki = 'Amphilophus_citrinellus'; % Wikipedia
metaData.links.id_ADW = 'Amphilophus_citrinellus'; % ADW
metaData.links.id_Taxo = '160723'; % Taxonomicon
metaData.links.id_WoRMS = '991188'; % WoRMS
metaData.links.id_fishbase = 'Amphilophus-citrinellus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphilophus_citrinellus}}';
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
bibkey = 'Oldf2009'; type = 'Article'; bib = [ ... 
'author = {Ronald G. Oldfield}, ' ... 
'year = {2009}, ' ...
'title = {Growth Patterns in Midas Cichlids Are Not Consistent with a Hypothesis of Socially Controlled Sex Determination}, ' ...
'journal = {Copeia}, ' ...
'volume = {2009(1)}, ' ...
'pages = {71-77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Amphilophus-citrinellus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

