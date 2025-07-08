function [data, auxData, metaData, txtData, weights] = mydata_Mareca_strepera

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Mareca_strepera'; 
metaData.species_en = 'Gadwall'; 

metaData.ecoCode.climate = {'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1      = {'Bas Kooijman'};    
metaData.date_mod_1   = [2022 08 13];              
metaData.email_mod_1       = {'bas.kooijman@vu.nl'};            
metaData.address_mod1     = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 24];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 23;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'Orin1968';   
  temp.ab = C2K(37.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for B. canadensis: 24 till 28 d';
data.tx = 55;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'Wiki';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value for Anas platyrhynchos';
data.tp = 165;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value for Anas platyrhynchos';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'Wiki';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 22;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Orin1968';
data.Wwi = 730; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Orin1968';
data.Wwim = 950; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Orin1968';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'AnAge';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
 1.195	 24.072
 8.167	 67.990
13.347	171.801
13.745	195.825
19.920	287.695
20.916	278.755
21.315	305.779
27.888	421.673
35.060	510.604
41.833	562.010
49.203	571.452
55.777	630.347
55.778	663.347
62.749	680.265
64.343	722.361
72.311	719.839
81.275	661.876];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = metaData.T_typical;  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Orin1968';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
 2.789 	 19.667
 6.175	 70.871
 6.574	102.394
14.143	182.349
20.916	292.255
20.917	316.255
27.689	618.161
28.287	400.697
34.661	648.580
34.662	662.080
40.239	651.914
41.434	741.986
45.219	640.213
48.406	658.404
55.578	574.835
55.777	679.847
62.351	713.241
72.311	845.839
81.474	792.388
89.243	971.355
100.199	901.512];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = metaData.T_typical;  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Orin1968';
comment.tW_m = 'Data for males';
%
data.tW_e = [ ... time (d), embryo weight (g)
8.767	0.819
8.769	1.142
9.875	1.054
9.877	1.424
10.802	1.889
10.938	1.520
11.861	1.616
11.864	2.124
12.934	4.208
13.946	3.519
14.830	5.140
14.966	4.771
15.908	8.842
15.994	7.640
17.867	13.564
18.024	17.771
18.924	12.736
19.111	13.338
21.006	24.300
21.102	24.994
21.980	25.459
22.083	27.725
23.005	27.682
23.017	30.178];
units.tW_e   = {'d', 'g'};  label.tW_e = {'time since birth', 'emvryo wet weight'};  
temp.tW_e    = C2K(37.5);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'Orin1968';
comment.tW_e = 'Data for embryos';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_e = weights.tW_e * 2;
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.Ww0 = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1:embryo-data added';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = 'DGPL'; % Cat of Life
metaData.links.id_ITIS = '175073'; % ITIS
metaData.links.id_EoL = '52231958'; % Ency of Life
metaData.links.id_Wiki = 'Mareca_strepera'; % Wikipedia
metaData.links.id_ADW = 'Mareca_strepera'; % ADW
metaData.links.id_Taxo = '52179'; % Taxonomicon
metaData.links.id_WoRMS = '159171'; % WoRMS
metaData.links.id_avibase = 'C235A4D712BB8855'; % Avibase
metaData.links.id_birdlife = 'gadwall-mareca-strepera'; % Birdlife
metaData.links.id_AnAge = 'Anas_strepera'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mareca_strepera}}';
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
bibkey = 'Orin1968'; type = 'Article'; bib = [ ... 
'doi = {10.2307/4083285}, ' ...
'author = {Oring, L. W.}, ' ... 
'year = {1968}, ' ...
'title = {Growth, Molts, and Plumages of the Gadwall}, ' ...
'journal = {The Auk}, ' ...
'volume = {85}, ' ...
'pages = {355-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anas_strepera}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

