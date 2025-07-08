function [data, auxData, metaData, txtData, weights] = mydata_Ichthyomyzon_greeleyi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Ichthyomyzon_greeleyi'; 
metaData.species_en = 'Mountain brook lamprey'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 14];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 14]; 

%% set data
% zero-variate data;
data.am = 6*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 10.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'msstate';
  comment.Wwb = 'based on egg diameter of 0.92 mm for I. gagei: pi/6*0.092^3';
data.Wwp = 2.155;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 10^(-2.632+2.904*log10(Lp))';
data.Wwi = 14;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 10^(-2.632+2.904*log10(Li))';

data.NR  = 1700;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'Walk2007';   
  temp.NR = C2K(14); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 68.586	2.068
114.533	3.284
143.155	4.038
179.066	3.694
220.383	4.204
237.566	3.910
260.151	4.445
266.796	3.908
283.435	4.712
327.691	4.904
327.755	5.245
365+14.514	5.486
365+68.646	6.385
365+114.474	6.967
365+146.719	7.062
365+178.997	7.329
365+218.719	7.326
365+262.902	7.128
365+268.980	7.566
365+326.027	8.026
730+14.368	8.705
730+66.809	8.580
730+114.245	9.748
730+144.942	9.575
730+175.675	9.597
730+216.891	9.570
730+258.794	9.201
730+266.270	9.103
730+282.804	9.346
730+325.598	9.733
730+328.075	10.953
1095+14.053	11.022
1095+66.553	11.214
1095+116.119	11.747
1095+144.576	11.624
1095+178.942	11.036
1095+220.319	11.862
1095+239.709	11.349
1095+260.713	11.445
1095+268.130	11.030
1095+284.061	12.053
1095+325.949	11.611
1095+326.256	13.246
1460+13.705	    13.169
1460+67.640	    13.019
1460+114.167	13.333
1460+144.183	13.526
1460+176.292	12.890
1460+220.767	14.253
1460+241.501	12.910
1460+259.703	14.055
1460+268.528	13.152
1460+282.233	14.297
1460+325.831	14.977];
data.tL(:,1) = 80 + data.tL(:,1); % correct for guessed origin
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BeamAust1985';
comment.tL = 'Data from Bent Creek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: Ww_i excludes eggs';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, no parasitic stage';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 10^(-2.632+2.904*log10(TL in cm))';
metaData.bibkey.F2 = 'BeamAust1985';
F3 = 'I. gagei: Ammocoetes do not have a predetermined sex; instead, they all rapidly produce eggs until about 17 months of age. Sex is determined by environmental factors including stream temperature, population density, average growth rate, and pH. Males then re-absorb the eggs, though it is not uncommon for male ammocoetes to still have eggs in their testes.';
metaData.bibkey.F3 = 'msstate';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6N5SN'; % Cat of Life
metaData.links.id_ITIS = '159728'; % ITIS
metaData.links.id_EoL = '207513'; % Ency of Life
metaData.links.id_Wiki = 'Ichthyomyzon_greeleyi'; % Wikipedia
metaData.links.id_ADW = 'Ichthyomyzon_greeleyi'; % ADW
metaData.links.id_Taxo = '177439'; % Taxonomicon
metaData.links.id_WoRMS = '1014132'; % WoRMS
metaData.links.id_fishbase = 'Ichthyomyzon-greeleyi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ichthyomyzon_greeleyi}}';  
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
bibkey = 'BeamAust1985'; type = 'article'; bib = [ ...  
'author = {Beamish, F. W. H. and Austin, L. S.}, ' ...
'year = {2011}, ' ...
'title  = {Growth of the mountain brook lamprey \emph{Ichthyomyzon greeleyi} {H}ubbs and {T}rautman}, ' ...
'journal = {Copeia}, ' ...
'volume = {1985(4)}, ' ...
'page = {881-890}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Walk2007'; type = 'article'; bib = [ ...  
'author = {Gretchen E. Walker}, ' ...
'year = {2007}, ' ...
'title  = {End of life behaviour in the the maountain brook lamprey \emph{Ichthyomyzon greeleyi}}, ' ...
'journal = {American currents}, ' ...
'volume = {33(3)}, ' ...
'page = {881-890}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ichthyomyzon-greeleyi.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'msstate'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cfr.msstate.edu/wildlife/fisheries/?a=detail&id=69&info=}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  