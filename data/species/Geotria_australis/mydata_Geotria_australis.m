function [data, auxData, metaData, txtData, weights] = mydata_Geotria_australis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Geotriidae';
metaData.species    = 'Geotria_australis'; 
metaData.species_en = 'Pouched lamprey'; 

metaData.ecoCode.climate = {'MC','BWh','Cfb'};
metaData.ecoCode.ecozone = {'MPS','TA','TN'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bpD','piTvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temperature
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 07 14];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 14]; 

%% set data
% zero-variate data;
data.tp = 3.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 10.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'ToddKels1993';
data.Li  = 57;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on diameter 1 mm: pi/6*0.1^3';
data.Wwp = 1.23;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'ToddKels1993','fishbase'};
  comment.Wwp = 'based on 0.00120*Lp^3, see F2';
data.Wwi = 222;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00120*Li^3, see F2';

data.NR  = 68212;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
  temp.NR = C2K(15); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% univariate data
% time - length
data.tL_1 = [ ... % time (d), total length (cm)
0   	1.660
33.090	2.046
125.425	2.295
219.939	3.137
283.693	4.083
347.415	4.697
383.466	4.437
415.328	4.753
505.620	5.822
561.840	5.668
612.809	6.072
641.508	6.597
719.017	7.142
748.759	7.475
778.478	7.582];
units.tL_1 = {'d', 'cm'};     label.tL_1 = {'time', 'total length'};  
bibkey.tL_1 = 'ToddKels1993';
temp.tL_1 = C2K(15);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
comment.tL_1 = 'Data from Okuti Stream';
%
data.tL_2 = [ ... % time (d), total length (cm)
0	    4.768
35.459	4.613
129.935	5.054
220.204	5.879
283.890	6.126
347.690	7.543
386.837	6.393
418.757	7.302
507.915	7.621
566.278	7.676
611.903	7.678
752.070	8.802
777.567	9.135
990.894	9.722];
units.tL_2 = {'d', 'cm'};     label.tL_2 = {'time', 'total length'};  
bibkey.tL_2 = 'ToddKels1993';
temp.tL_2 = C2K(15);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
comment.tL_2 = 'Data from Okuti Stream';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1','tL_2'}; subtitle1 = {'Data for 2 initial lengths'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'assumption: Ww_i excludes eggs';
D2 = 'time since birth at puberty was ignorned because it is very variable';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, parasitic stage present';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00120*(TL in cm)^3';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Ammocoetes stay in freshwater upt 7 yrs, then migrate to sea, returning to spawn and die';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '3FT77'; % Cat of Life
metaData.links.id_ITIS = '159744'; % ITIS
metaData.links.id_EoL = '46582343'; % Ency of Life
metaData.links.id_Wiki = 'Geotria_australis'; % Wikipedia
metaData.links.id_ADW = 'Geotria_australis'; % ADW
metaData.links.id_Taxo = '41681'; % Taxonomicon
metaData.links.id_WoRMS = '234686'; % WoRMS
metaData.links.id_fishbase = 'Geotria-australis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geotria_australis}}';  
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
bibkey = 'ToddKels1993'; type = 'article'; bib = [ ...  
'author = {Todd, P. R. and Kelso, J. R. M.}, ' ...
'year = {1993}, ' ...
'title  = {Distribution, growth and transformation timing of larval \emph{Geotria australis} in {N}ew {Z}ealand}, ' ...
'journal = {Ecology of Freshwurer Fish}, ' ...
'volume = {2}, ' ...
'page = {99-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Geotria-australis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
