function [data, auxData, metaData, txtData, weights] = mydata_Onychoprion_anaethetus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Onychoprion_anaethetus'; 
metaData.species_en = 'Bridled tern'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 28;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HulsLang1985';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28 to 30 d';
data.tx = 58;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HulsLang1985';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 174;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 1460;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for O. fuscatus';
data.am = 17.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 23.4;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 133.3;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'HulsLang1985';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.979	27.465
1.209	22.066
2.050	32.394
2.760	32.394
2.762	34.272
3.701	27.465
3.940	29.577
4.061	31.690
4.062	33.099
4.182	34.272
4.192	42.958
5.127	32.394
5.131	36.150
6.434	37.559
6.925	52.347
7.388	42.958
7.992	53.991
7.995	55.869
8.464	52.347
8.794	31.690
8.919	37.089
9.292	51.878
9.756	44.366
9.877	46.479
10.008	57.042
10.367	60.798
10.813	37.559
10.945	49.061
10.947	50.704
10.960	61.502
11.199	63.615
11.901	56.808
12.971	60.563
13.679	59.155
13.696	73.474
13.898	44.601
14.044	67.840
15.355	75.822
16.053	65.493
16.391	50.939
17.008	72.300
17.010	74.178
18.062	62.676
18.067	67.371
18.207	85.446
19.242	59.624
19.610	70.892
19.862	83.803
19.968	73.474
19.976	79.812
20.214	81.221
20.558	72.300
21.053	89.906
21.775	100.000
21.867	77.934
22.478	94.366
22.740	115.728
22.846	105.634
23.667	99.296
24.705	75.822
24.829	81.221
25.536	78.404
25.810	110.329
26.040	104.460
26.620	94.366
26.736	92.488
27.919	92.019
28.044	97.887
28.650	109.624
28.760	102.582
29.809	88.732
29.814	93.662
30.522	91.549
30.665	112.441
30.771	102.113
30.791	118.779
30.900	111.268
31.713	97.653
31.955	102.113
31.975	119.718
32.442	113.850
33.856	108.920
34.078	96.244
34.218	115.023
34.795	101.878
35.164	114.085
35.525	119.014
36.472	119.718
36.698	110.329
36.700	112.207
36.702	113.850
36.721	129.577
37.532	114.789
37.533	116.197
37.906	130.986
38.598	115.493
38.602	119.484
39.323	128.169
39.680	130.047
40.976	125.587
41.663	105.399
41.780	104.225
42.873	128.169
42.880	133.803
43.091	112.207
44.856	103.756
45.483	133.333
45.813	112.676
45.830	126.761
46.786	134.507
47.931	102.582
48.663	120.892
48.760	102.582
48.897	118.779
49.846	119.953
50.172	96.009
50.690	133.333
51.596	99.061
51.635	132.394
51.849	113.146
52.698	130.047
54.928	114.319
55.778	132.864
57.864	95.540
57.987	99.296];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'HulsLang1985';

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
D1 = 'Body temperature is guessed, and below target just after hatch';
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: food availability is taken variable in tW data';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '49RDZ'; % Cat of Life
metaData.links.id_ITIS = '824104'; % ITIS
metaData.links.id_EoL = '45509323'; % Ency of Life
metaData.links.id_Wiki = 'Onychoprion_anaethetus'; % Wikipedia
metaData.links.id_ADW = 'Sterna_anaethetus'; % ADW
metaData.links.id_Taxo = '2682384'; % Taxonomicon
metaData.links.id_WoRMS = '567792'; % WoRMS
metaData.links.id_avibase = 'E6518B9D5C802F2A'; % avibase
metaData.links.id_birdlife = 'bridled-tern-onychoprion-anaethetus'; % birdlife
metaData.links.id_AnAge = 'Onychoprion_anaethetus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychoprion_anaethetus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Onychoprion_anaethetus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HulsLang1985'; type = 'Article'; bib = [ ... 
'author = {K. Hulsman and N. P. E. Langham}, ' ... 
'doi = {10.1071/MU9850240}, ' ...
'year = {1985}, ' ...
'title = {Breeding Biology of the Bridled Tern \emph{Sterna Anaethetus}}, ' ...
'journal = {Emu}, ' ...
'volume = {85}, ' ...
'pages = {240--249}'];
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

