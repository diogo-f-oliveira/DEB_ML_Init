function [data, auxData, metaData, txtData, weights] = mydata_Mimachlamys_varia
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pectinida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Mimachlamys_varia'; 
metaData.species_en = 'Variegated scallop'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE','MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 21]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on 2 d for Pecten maximus at 18 C';
data.tj = 20;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'guess';
  temp.tj = C2K(16);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'based on Aequipecten_opercularis';
data.am = 7*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'sealifebase';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.75;   units.Lp  = 'cm';  label.Lp  = 'shell height at puberty';   bibkey.Lp  = 'guess';
data.Li  = 8;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'marlin';
  comment.Li = ' 3-10 cm';

data.Wwb = 1.64e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'marlin';
  comment.Wwb = 'Based on 68 mum egg diameter for Aequipecten_opercularis: pi/6*0.0068^3';
data.Wwi = 31.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on size-corrected value for Aequipecten_opercularis: 107*(6/9)^3';

data.Ri = 6e6/365;    units.Ri = 'g';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected fecundity of Aequipecten_opercularis';
   
% uni-variate data
% time-length
data.tL1 = [ ... % time since 1 sept 2008 (d), shell height (cm)
0.000	1.548
33.684	1.908
68.180	2.398
99.017	2.780
132.806	3.119
165.168	3.213
198.268	3.292
230.606	3.515
264.414	3.746
298.215	4.020
331.286	4.258
364.349	4.539
395.980	4.604
429.070	4.741
461.430	4.841
494.535	4.899
528.372	4.971
562.219	4.993
593.130	4.971
626.243	4.986
660.089	5.007];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time', 'shell height', 'depth 1 m'};  
temp.tL1    = C2K(17.08);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'RathBolo2017';
comment.tL1 = 'depth 1 m; temperature between 17.08 pm 5.21 C';
%
data.tL3 = [ ... % time since 1 sept 2008 (d), shell height (cm)
0.000	1.526
34.433	1.836
66.750	2.175
99.061	2.542
132.855	2.852
165.217	2.946
199.062	2.975
232.874	3.184
263.002	3.422
298.266	3.739
331.330	4.020
361.433	4.387
397.480	4.452
428.367	4.560
462.206	4.625
495.314	4.661
528.427	4.676
562.264	4.748
592.433	4.762
628.490	4.769
660.130	4.784];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time', 'shell height', 'depth 3 m'};  
temp.tL3    = C2K(16.96);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'RathBolo2017';
comment.tL3 = 'depth 3 m; temperature between 16.96 pm 4.80 C';
%
data.tL5 = [ ... % time since 1 sept 2008 (d), shell height (cm)
0.00	1.353
33.758	1.505
66.109	1.656
99.886	2.059
134.402	2.441
166.010	2.636
200.575	2.751
232.912	2.982
264.523	3.155
299.791	3.450
333.617	3.587
364.458	3.948
397.554	4.049
430.627	4.279
464.456	4.395
498.288	4.495
529.921	4.553
561.535	4.712
594.649	4.719
628.497	4.733
661.602	4.784];
units.tL5   = {'d', 'cm'};  label.tL5 = {'time', 'shell height', 'depth 5 m'};  
temp.tL5    = C2K(16.90);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
bibkey.tL5 = 'RathBolo2017';
comment.tL5 = 'depth 5 m; temperature between 16.90 pm 4.34 C';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL1 = 3 * weights.tL1;
%weights.tL3 = 3 * weights.tL3;
%weights.tL5 = 3 * weights.tL5;
%weights.Li = 5 * weights.Li;
%weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL3','tL5'}; subtitle1 = {'Data for depths 1, 3, 5 m'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperature (C) of tL data changes as: T(t)=mean+amplitude*sin(2*pi*(t+250)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Incidental hermaphroditic';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Sports jet propulsion swimming';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6RKGL'; % Cat of Life
metaData.links.id_ITIS = '79628'; % ITIS
metaData.links.id_EoL = '46468063'; % Ency of Life
metaData.links.id_Wiki = 'Mimachlamys'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3967485'; % Taxonomicon
metaData.links.id_WoRMS = '236719'; % WoRMS
metaData.links.id_molluscabase = '236719'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlamys_varia}}';
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
bibkey = 'RathBolo2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10499-016-0018-9}, ' ...
'author = {Mara Rathman and Jak\v{s}a Bolotin and Nik\v{s}a Glavi\''{c} and Josip Bari\v{s}i\''{c}}, ' ... 
'year = {2017}, ' ...
'title = {Influence of water depth on growth and mortality of \emph{Chlamys varia} ({L}innaeus, 1758): implications for cage culture in {M}ali {S}ton {B}ay, {C}roatia}, ' ...
'journal = {Aquacult. Int.}, ' ...
'volume = {25}, ' ...
'pages = {135-146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\urlhttp://www.marlin.ac.uk/biotic/browse.php?sp=6255}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Mimachlamys-varia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

