function [data, auxData, metaData, txtData, weights] = mydata_Anser_caerulescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anser_caerulescens'; 
metaData.species_en = 'Snow goose'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'xiFm', 'biTht'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 09 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 24;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'AnAge';   
  temp.ab = C2K(41.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for B. canadensis: 24 till 28 d';
data.tx = 60;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '78 till 96 d';
data.tp = 180;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.5 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 83;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'GautFour2006';
data.Wwi = 2391; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'GautFour2006';
data.Wwim = 2666; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'GautFour2006';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'AnAge';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.194	83.624
0.944	83.214
2.069	82.599
3.007	96.849
4.008	111.066
4.947	120.395
5.949	149.375
7.013	178.320
7.890	202.447
9.079	226.403
10.020	265.259
11.022	294.238
12.151	342.834
13.026	347.276
14.030	400.861
15.035	464.288
16.042	557.241
17.233	600.882
18.114	684.061
19.056	752.443
20.059	791.265
21.065	869.455
22.009	957.522
23.014	1025.870
24.024	1158.192
24.900	1167.555
26.031	1245.677
26.910	1299.330
28.040	1362.689
29.044	1426.116
29.988	1509.261
30.865	1528.467
31.928	1542.649
32.995	1606.042
33.880	1733.511
34.948	1806.746
35.951	1840.647
37.082	1928.611
38.025	2001.914
39.029	2050.578
39.909	2123.915
41.032	2098.695
42.034	2117.832
43.096	2117.251
43.913	2175.860
44.974	2155.594];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GautFour2006';
comment.tW = 'Data for Anser caerulescens atlanticus';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'initial assimilation is reduced in data set tW';
D4 = 'mod_1: v reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'TX2S'; % Cat of Life
metaData.links.id_ITIS = '175029'; % ITIS
metaData.links.id_EoL = '1048460'; % Ency of Life
metaData.links.id_Wiki = 'Chen_caerulescens'; % Wikipedia
metaData.links.id_ADW = 'Chen_caerulescens'; % ADW
metaData.links.id_Taxo = '52004'; % Taxonomicon
metaData.links.id_WoRMS = '1034711'; % WoRMS
metaData.links.id_avibase = 'D3A260BCA65503C6'; % avibase
metaData.links.id_birdlife = 'snow-goose-anser-caerulescens'; % birdlife
metaData.links.id_AnAge = 'Chen_caerulescens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anser_caerulescens}}';
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
bibkey = 'GautFour2006'; type = 'Article'; bib = [ ... 
'author = {Gauthier, G. and Fournier, F. and Larochelle, J.}, ' ... 
'year = {2006}, ' ...
'title = {The effect of environmental conditions on early growth in gees}, ' ...
'journal = {British Poultry Science}, ' ...
'volume = {29}, ' ...
'pages = {53-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chen_caerulescens}}';
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

