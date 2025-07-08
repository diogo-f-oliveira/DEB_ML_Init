function [data, auxData, metaData, txtData, weights] = mydata_Burhinus_capensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Burhinidae';
metaData.species    = 'Burhinus_capensis'; 
metaData.species_en = 'Spotted thick-knee'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 27;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'BDExpl';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 to 30 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 55;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'TjorUnde2007';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 165;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.8*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for Burhinus oedicnemus';

data.Wwb = 22;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TjorUnde2007';
data.Wwi = 490;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'TjorUnde2007';
  
data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.004	32.713
0.067	43.224
0.121	24.540
0.122	16.363
0.180	47.907
0.925	38.593
0.926	28.079
0.927	21.070
1.668	39.793
1.793	29.284
1.794	21.107
1.914	51.486
2.039	38.641
2.908	26.995
3.031	37.515
3.153	52.707
3.896	50.402
3.897	43.392
4.702	44.595
4.762	57.448
5.132	69.146
5.692	50.478
5.876	66.841
6.001	58.669
6.866	72.724
6.867	65.715
6.869	47.023
6.992	56.374
7.915	103.143
7.918	84.451
7.919	73.937
8.969	95.010
8.970	86.832
8.976	43.608
9.034	73.985
9.035	66.975
9.036	57.629
11.937	136.024
11.939	124.342
11.940	116.164
11.941	109.155
12.008	64.765
12.066	95.141
12.067	85.796
12.254	76.458
13.055	116.211
13.056	108.034
13.059	77.660
13.119	98.691
13.177	130.235
13.612	113.899
13.858	133.769
13.859	126.760
13.983	120.924
14.666	105.766
14.776	219.088
14.973	130.312
17.017	129.230
17.878	179.500
17.998	211.048
18.006	140.954
18.007	135.113
18.877	114.122
18.937	132.816
18.993	177.211
20.972	202.996
21.834	245.089
22.152	173.841
22.940	316.398
23.010	247.475
23.821	204.286
23.938	258.029
23.950	162.235
23.951	150.553
24.067	217.147
24.134	175.093
24.866	265.078
24.868	246.386
24.937	196.155
25.861	237.083
25.908	357.412
25.979	277.975
26.043	266.296
26.911	255.819
26.916	216.099
26.977	221.943
26.985	156.523
27.044	181.058
27.906	220.814
27.965	247.686
28.034	193.951
28.038	161.240
29.001	383.244
29.875	329.543
29.877	315.524
29.882	273.468
29.883	264.123
29.884	253.609
29.887	231.412
29.940	301.508
30.930	312.064
30.932	299.214
31.009	173.049
31.065	220.948
31.860	308.599
33.036	309.817
33.851	232.749
33.921	168.500
34.952	343.777
35.011	369.481
35.019	306.397
37.058	343.867
38.916	347.450
38.972	391.845
40.106	238.856
40.959	354.546
41.018	374.409
41.023	333.521
42.012	351.086
42.997	401.362
43.003	353.465
43.931	358.177
46.896	423.724
48.129	469.337
50.987	400.533
51.055	347.966
52.041	388.896
53.087	443.847
53.156	391.279];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'TjorUnde2007';

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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'NXG4'; % Cat of Life
metaData.links.id_ITIS = '176747'; % ITIS
metaData.links.id_EoL = '45515099'; % Ency of Life
metaData.links.id_Wiki = 'Burhinus_capensis'; % Wikipedia
metaData.links.id_ADW = 'Burhinus_capensis'; % ADW
metaData.links.id_Taxo = '53522'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '862F6F04186871A8'; % avibase
metaData.links.id_birdlife = 'spotted-thick-knee-burhinus-capensis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Burhinus_capensis}}';
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
bibkey = 'TjorUnde2007'; type = 'Article'; bib = [ ...  
'title = {Pre-fledging energy requirements of the nocturnally fed semi-precocial chicks of the Spotted Thick-knee (\emph{Burhinus capensis})}, ' ...
'doi = {10.1071/mu06033}, ' ...
'journal = {Emu}, ' ...
'year = {2007}, ' ...
'author = {K. M. C. Tj\{o}rve and L. G. Underhill and G. H. Visser}, ' ...
'volume = {107}, ' ...
'pages = {143-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BDExpl'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.biodiversityexplorer.org/birds/burhinidae/burhinus_capensis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Burhinus_oedicnemus}}';
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

