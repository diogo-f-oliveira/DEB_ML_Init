function [data, auxData, metaData, txtData, weights] = mydata_Ploceus_castaneiceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Ploceidae';
metaData.species    = 'Ploceus_castaneiceps'; 
metaData.species_en = 'Taveta weaver'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 11];

%% set data
% zero-variate data

data.ab = 11;   units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value taken from Foudia';
data.tx = 14.27;    units.tx = 'd';    label.tx = 'time since birth at fledging';   bibkey.tx = 'BreeFerr2012';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42.81;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';    bibkey.tR = 'BreeFerr2012';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on Passer domesticus';

data.Wwb = 1.6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'BreeFerr2012';
data.Wwi = 18;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'BreeFerr2012';
data.Wwim = 23.5; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'BreeFerr2012';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
0.961	1.623
2.023	1.837
2.984	2.122
3.009	2.545
3.844	3.604
3.869	3.815
3.945	5.858
4.982	6.143
5.007	5.086
5.007	7.129
5.032	5.509
5.083	4.664
5.968	6.005
5.968	6.709
5.968	7.273
6.954	7.276
6.979	7.698
6.979	8.262
6.979	9.318
6.979	12.558
7.005	11.431
7.030	10.797
7.991	8.476
7.991	8.899
7.991	13.054
7.991	13.899
8.016	9.533
8.016	11.575
8.926	15.662
8.926	16.226
8.977	13.972
8.977	14.677
9.002	10.029
9.002	13.057
9.053	11.578
9.078	11.015
9.938	14.680
9.938	15.525
9.963	16.792
9.963	17.638
9.963	18.905
9.989	12.074
9.989	15.877
9.989	16.229
10.014	13.131
10.014	13.976
10.975	14.965
10.975	15.599
10.975	16.232
10.975	16.796
10.975	17.289
10.975	18.134
10.975	19.472
11.000	13.486
11.025	14.120
11.910	17.996
11.961	15.813
11.961	17.292
11.961	19.052
11.961	19.616
11.986	14.545
12.998	18.351
13.023	15.535
13.023	16.380
13.023	18.915
13.023	19.478
13.048	17.084
13.048	17.366
13.074	17.859
13.984	18.495
14.009	16.172
14.009	16.805
14.009	19.059
14.009	19.481
14.009	20.608
14.060	15.468
14.060	17.369
14.920	20.048
14.945	19.344
14.995	17.865
14.995	18.499
15.046	16.245
15.046	16.950
15.046	17.443
15.931	18.079
15.956	17.093
15.982	15.755
15.982	18.995
15.982	19.629
17.018	18.646
17.044	17.379
18.055	17.382
18.055	18.227
19.016	17.244
19.016	17.948
20.078	17.952
20.078	18.867
21.014	18.377];
n=size(data.tW_f,1); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1);data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3;end;end
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'weight', 'female'};  
temp.tW_f    = C2K(41.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BreeFerr2012';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), carapace length (cm)
0.936	1.693
0.936	2.327
1.998	2.401
1.998	3.035
2.023	1.767
2.984	2.686
2.984	3.390
2.984	4.094
3.945	4.168
3.945	4.801
3.945	5.506
4.931	6.213
4.931	6.776
4.931	7.269
4.931	7.762
5.943	8.047
5.968	10.019
5.993	8.399
5.993	8.892
5.993	9.456
7.030	9.811
7.030	10.656
7.030	11.501
7.030	12.346
8.041	13.336
8.067	11.998
8.067	12.843
8.067	13.969
8.067	14.322
8.067	15.096
9.002	15.522
9.028	14.747
9.028	15.944
9.028	16.578
9.028	17.071
9.078	14.114
10.014	16.511
10.014	17.779
10.014	18.483
10.014	18.905
10.014	19.398
10.014	19.610
10.924	17.781
10.924	18.415
11.000	19.824
11.000	20.176
11.000	21.232
11.051	19.049
11.986	21.024
12.011	23.137
12.037	20.320
12.037	21.447
12.037	21.870
12.037	22.503
12.998	20.394
12.998	21.873
12.998	22.506
12.998	23.140
13.048	23.633
14.034	23.355
14.060	19.975
14.060	22.580
14.060	23.637
14.060	24.552
15.021	23.358
15.046	22.583
15.046	24.133
15.046	24.626
15.071	21.598
16.007	24.136
16.032	21.882
16.032	22.305
16.032	22.868
16.032	23.502
16.032	24.418
17.069	21.815
17.069	22.167
17.069	22.660
17.069	24.350
17.979	22.029
18.055	24.706
19.016	23.582];
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1);data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3;end;end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'weight', 'male'};  
temp.tW_m    = C2K(41.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BreeFerr2012';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

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
set1 = {'tW_f', 'tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'Food availability is taken variable in tW data';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '4KH87'; % Cat of Life
metaData.links.id_ITIS = '562294'; % ITIS
metaData.links.id_EoL = '45514960'; % Ency of Life
metaData.links.id_Wiki = 'Ploceus_castaneiceps'; % Wikipedia
metaData.links.id_ADW = 'Ploceus_castaneiceps'; % ADW
metaData.links.id_Taxo = '58970'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2379E3EBD59FFCE6'; % avibase
metaData.links.id_birdlife = 'taveta-golden-weaver-ploceus-castaneiceps'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ploceus_castaneiceps}}';
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
bibkey = 'BreeFerr2012'; type = 'Article'; bib = [ ... 
'author = {S. Breeding and G. M. Ferrie and P. Schutz and K. A. Leighty and C. Plass\''{e}}, ' ... 
'year = {2012}, ' ...
'title = {Hand-Rearing and Sex Determination Tool for the Taveta Golden Weaver (Ploceus castaneiceps)}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {31}, ' ...
'pages = {600--608}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/919008/overview}}';
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

