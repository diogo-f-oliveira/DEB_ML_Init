function [data, auxData, metaData, txtData, weights] = mydata_Pluvialis_apricaria

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Pluvialis_apricaria'; 
metaData.species_en = 'European golden plover'; 

metaData.ecoCode.climate = {'ET', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 27.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Harr1975';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 37;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'PearYald2002';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 111;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.8*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 19.5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PearYald2002';
data.Wwi = 260;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'EoL';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.043	19.561
0.045	17.565
0.166	23.156
0.745	18.380
0.803	23.969
0.934	20.779
1.636	20.397
1.821	26.787
1.826	21.998
2.524	24.809
2.592	20.819
2.711	29.203
2.779	25.214
3.351	27.223
3.733	27.232
3.920	32.026
4.060	20.056
4.690	26.856
4.693	24.062
4.825	20.074
5.006	30.056
5.843	22.493
5.894	34.867
6.015	40.857
6.797	25.310
6.847	37.684
6.852	33.693
6.919	30.102
7.880	26.533
7.884	22.542
7.928	40.503
8.112	48.091
8.824	38.130
9.782	36.956
9.788	31.368
9.951	58.113
10.085	51.331
10.157	43.750
10.748	28.198
10.853	48.955
11.571	33.806
11.691	40.993
11.695	37.002
11.927	58.958
11.936	50.178
12.043	69.338
12.820	58.980
13.887	74.571
13.894	68.185
13.900	62.598
13.927	36.656
13.974	53.021
13.985	42.644
14.005	83.354
14.595	68.202
15.808	67.433
15.816	60.249
15.825	51.868
15.858	80.605
15.865	73.820
16.888	71.051
16.999	86.619
17.765	85.839
17.824	91.029
18.030	77.065
18.059	49.926
18.583	97.033
18.661	83.066
19.601	99.452
19.773	57.550
19.809	83.094
19.850	105.046
20.787	62.763
20.827	85.114
21.713	92.319
21.890	105.095
22.597	100.322
22.606	91.941
22.840	111.503
23.736	109.130
23.772	75.206
23.873	99.555
24.632	105.560
24.811	117.138
24.870	121.929
25.773	112.372
25.841	107.983
25.864	86.831
25.888	124.348
26.587	126.759
26.774	130.755
26.921	112.399
27.678	120.001
27.686	112.418
27.697	102.440
28.745	135.991
28.752	130.004
28.767	116.036
29.705	133.220
29.842	124.443
29.854	113.268
30.798	124.865
31.628	123.687
31.738	140.852
31.746	133.269
31.752	127.681
32.894	132.498
32.903	124.915
32.944	146.069
33.773	145.690
33.779	140.102
34.047	128.535
34.540	144.511
34.728	147.708
35.564	140.544
35.624	144.138
36.004	146.941
36.708	144.962
37.601	144.983
39.891	150.227
40.772	161.423];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PearYald2002';

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
D1 = 'Long tp cannot be captured by std model';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4KKPV'; % Cat of Life
metaData.links.id_ITIS = '176561'; % ITIS
metaData.links.id_EoL = '45509150'; % Ency of Life
metaData.links.id_Wiki = 'Pluvialis_apricaria'; % Wikipedia
metaData.links.id_ADW = 'Pluvialis_apricaria'; % ADW
metaData.links.id_Taxo = '53622'; % Taxonomicon
metaData.links.id_WoRMS = '159135'; % WoRMS
metaData.links.id_avibase = '25A20BA6F7EA9D9A'; % avibase
metaData.links.id_birdlife = 'eurasian-golden-plover-pluvialis-apricaria'; % birdlife
metaData.links.id_AnAge = 'Pluvialis_apricaria'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pluvialis_apricaria}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pluvialis_apricaria}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PearYald2002'; type = 'Article'; bib = [ ...  
'author = {J. W. Pearce-Higgins and D. W. Yalden}, ' ...
'title = {Variation in the growth and survival of Golden Plover \emph{Pluvialis apricaria} chicks}, ' ...
'journal = {Ibis}, ' ...
'year = {2002}, ' ...
'volume = {144}, ' ...
'pages = {200-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
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

