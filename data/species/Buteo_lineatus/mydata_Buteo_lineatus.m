function [data, auxData, metaData, txtData, weights] = mydata_Buteo_lineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_lineatus'; 
metaData.species_en = 'Red-shouldered hawk';

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 33;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 40;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'PenaDyks2013';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 120;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 22.4*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 45;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
  comment.Wwb = 'egg length 5.45 cm, width 4.3 cm, weight: pi/6*5.45*4.3^2=52.8 g';
data.Wwi = 700;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
data.Wwim = 550;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'Wiki';

data.Ri  = 3.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 3.5 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.979	77.224
3.018	57.295
3.973	73.488
4.966	99.644
5.002	129.537
5.005	80.961
5.997	124.555
6.991	137.011
6.992	120.819
7.945	173.132
7.982	189.324
8.022	159.431
8.977	184.342
9.015	171.886
9.930	229.181
10.956	347.509
11.993	275.267
12.909	298.932
12.948	283.986
12.949	261.566
12.984	325.089
13.022	337.544
13.980	297.687
14.975	280.249
15.009	353.737
15.968	307.651
15.969	290.214
15.997	478.292
16.996	379.893
17.037	343.772
17.993	341.281
18.027	408.541
18.028	389.858
18.984	397.331
19.024	371.174
19.970	551.779
19.981	352.491
20.013	460.854
20.014	450.890
20.015	428.470
21.010	406.050
21.012	383.630
21.927	428.470
21.961	498.221
21.998	519.395
22.007	367.438
22.956	491.993
22.999	403.559
23.991	447.153
23.995	376.157
24.023	553.025
24.026	498.221
24.982	508.185
24.985	447.153
24.988	403.559
25.975	531.851
25.979	460.854
26.011	570.463
26.019	429.715
26.968	554.270
26.973	457.117
27.967	469.573
28.003	499.466
28.012	347.509
28.038	567.972
28.957	533.096
29.001	432.206
29.039	448.399
29.951	543.060
29.996	428.470
31.018	607.829
31.019	589.146
32.931	592.883
32.972	543.060
32.976	467.082
34.009	467.082
35.002	488.256
35.036	567.972
35.997	473.310
35.999	444.662
36.030	579.181
37.977	622.776
37.980	569.217];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PenaDyks2013';

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
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5WTTW'; % Cat of Life
metaData.links.id_ITIS = '175359'; % ITIS
metaData.links.id_EoL = '45511421'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_lineatus'; % Wikipedia
metaData.links.id_ADW = 'Buteo_lineatus'; % ADW
metaData.links.id_Taxo = '52649'; % Taxonomicon
metaData.links.id_WoRMS = '159368'; % WoRMS
metaData.links.id_avibase = 'EA4D6C0B76852200'; % avibase
metaData.links.id_birdlife = 'red-shouldered-hawk-buteo-lineatus'; % birdlife
metaData.links.id_AnAge = 'Buteo_lineatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_lineatus}}';
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
bibkey = 'PenaDyks2013'; type = 'Article'; bib = [ ... 
'doi = {10.1676/13-020.1}, ' ...
'title = {Using morphometric measurements to estimate age of nestling Red-shouldered Hawks in two eastern populations}, ' ...
'author = {B. L. Penak and C. R. Dykstra and S. J. Miller and David M.}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'year = {2013}, ' ...
'volume = {125}, ' ...
'pages = {630-637}'];
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

