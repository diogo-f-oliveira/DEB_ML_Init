function [data, auxData, metaData, txtData, weights] = mydata_Merops_pusillus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Coraciiformes'; 
metaData.family     = 'Meropidae';
metaData.species    = 'Merops_pusillus'; 
metaData.species_en = 'Little bee-eater'; 

metaData.ecoCode.climate = {'Aw','BSh','BWh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Merops_apiaster: 3 till 4 wks';
data.tx = 23.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365; units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Merops_bullockoides';

data.Ww0 = 2.7;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 2.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'McCl2020';
data.Wwi = 14.8; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 4.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.ab = '4.4 eggs per clutch; 1 clutch per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.747	2.747
1.099	4.239
1.099	3.532
1.231	5.573
1.231	4.867
1.231	2.746
2.198	5.572
2.286	6.435
2.330	4.236
2.330	4.236
3.297	3.685
4.176	2.976
4.308	9.651
4.352	5.882
4.352	6.745
4.352	7.138
4.352	7.374
4.352	8.552
4.396	5.018
5.319	7.843
5.319	8.393
5.363	8.942
5.363	9.178
5.407	10.827
6.066	8.391
6.286	9.490
7.341	9.802
7.385	6.818
7.385	7.446
7.385	8.153
7.385	10.666
7.385	12.787
7.429	8.624
7.429	11.687
7.429	12.158
8.308	12.078
8.308	11.685
8.308	11.528
8.308	11.214
8.308	9.172
8.308	9.015
8.308	7.444
8.352	14.041
8.352	13.570
8.352	10.350
8.352	9.565
8.352	8.465
8.352	7.994
8.396	7.130
8.396	5.638
9.275	14.511
9.363	12.940
9.363	12.390
9.363	12.076
9.363	11.212
9.363	10.741
9.363	10.427
9.363	9.955
9.407	13.961
9.407	9.327
9.407	9.249
9.451	7.835
10.330	14.980
10.330	15.608
10.374	12.467
10.418	10.974
10.418	13.095
10.418	14.037
11.341	9.559
11.429	13.171
11.429	12.936
11.473	15.449
11.473	14.899
11.473	14.349
12.440	11.442
12.440	9.635
13.451	11.754
13.451	12.539
13.451	13.167
13.451	13.403
13.451	14.188
13.451	15.209
13.495	16.937
13.538	15.916
14.374	13.165
14.462	15.757
14.462	15.207
14.462	12.380
14.462	11.281
14.505	8.846
15.385	9.865
15.429	17.090
15.516	13.399
15.516	13.949
15.516	15.912
15.516	16.540
15.560	14.891
16.527	15.831
16.527	15.282
16.527	13.083
16.527	12.612
17.538	16.850
17.582	13.081
17.582	16.379
17.626	16.065
18.505	14.807
18.549	13.786
18.549	13.471
18.593	15.906
19.429	14.569
21.495	17.000
21.626	15.900];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'McCl2020';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
D1 = 'Ww0 data ignored due to inconsistency with tW and Wwb data';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3ZW5N'; % Cat of Life
metaData.links.id_ITIS = '554647'; % ITIS
metaData.links.id_EoL = '45514072'; % Ency of Life
metaData.links.id_Wiki = 'Merops_pusillus'; % Wikipedia
metaData.links.id_ADW = 'Merops_pusillus'; % ADW
metaData.links.id_Taxo = '55310'; % Taxonomicon
metaData.links.id_WoRMS = '212739'; % WoRMS
metaData.links.id_avibase = 'C0A68CA01963299C'; % avibase
metaData.links.id_birdlife = 'little-bee-eater-merops-pusillus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Merops_pusillus}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C0A68CA01963299C&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCl2020'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://open.uct.ac.za/bitstream/handle/11427/32856/thesis_sci_2020_mcclean%20luke%20alexander.pdf?sequence=1}}, ' ...
'author = {Luke Alexander McClean}, ' ... 
'year = {2020}, ' ...
'title = {Coevolution between brood-parasitic honeyguides and their hosts}, ' ...
'school = {Department of Biological Sciences, Faculty of Science, University of Cape Town}'];
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

